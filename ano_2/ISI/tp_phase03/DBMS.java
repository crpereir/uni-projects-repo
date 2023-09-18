/** 
ISEL - DEETC
Introdução a Sistemas de Informação
MP,ND, 2014-2022
*/

package jdbc;

import java.io.IOError;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Scanner;

/**
 * Interface que liga a aplicação à base de dados.
 */
interface DbWorker 
{
	/**
	 * Função abstrata que permite a execução de funções da aplicação.
	 */
	void doWork();
}

/**
 * Classe que simboliza a aplicação.
 */
class App
{
	/**
	 * Classe enumerada com todas as opções da aplicação.
	 * Por defeito, a opção é [Unknown].
	 */
	private enum Option
	{
		Unknown,
		Exit,
		SetupDB,
		InsertDriver,
		VehicleOutOfService,
		GetVehicleData,
		ClientWithMostTrips,
		DriversWithNTrips,
		TripCountByYear,
		DriverWithHighestTotalCost
	}

	/**
	 * Variável que representa uma instância da aplicação
	 */
	private static App __instance = null;
	/**
	 * Variável que contem a connection string usada para a conexão ao servidor PostgreSQL.
	 */
	private String __connectionString;
	/**
	 * Lista que contem o par das opções com os handlers respetivos.
	 */
	private final HashMap<Option,DbWorker> __dbMethods;

	/**
	 * Construtor da aplicação, que cria a lista de opções com os seus handlers.
	 */
	private App()
	{
		__dbMethods = new HashMap<>();
		__dbMethods.put(Option.SetupDB, new DbWorker() { public void doWork() {App.this.SetupDB();}});
		__dbMethods.put(Option.InsertDriver, new DbWorker() { public void doWork() {App.this.InsertDriver();}});
		__dbMethods.put(Option.VehicleOutOfService,
				new DbWorker() { public void doWork() {App.this.VehicleOutOfService();}});
		__dbMethods.put(Option.GetVehicleData,
				new DbWorker() { public void doWork() {App.this.GetVehicleData();}});
		__dbMethods.put(Option.ClientWithMostTrips,
				new DbWorker() { public void doWork() {App.this.ClientWithMostTrips();}});
		__dbMethods.put(Option.DriversWithNTrips,
				new DbWorker() { public void doWork() {App.this.DriversWithNTrips();}});
		__dbMethods.put(Option.TripCountByYear,
				new DbWorker() { public void doWork() {App.this.TripCountByYear();}});
		__dbMethods.put(Option.DriverWithHighestTotalCost,
				new DbWorker() { public void doWork() {App.this.DriverWithHighestTotalCost();}});

	}

	/**
	 * Cria uma instância da aplicação caso ela não exista.
	 * @return Instância da applicação.
	 */
	public static App getInstance()
	{
		if(__instance == null) 
		{
			__instance = new App();
		}
		return __instance;
	}

	/**
	 * Mostra as opções da aplicação, lendo do standard input aquela que o utilizador escolheu.
	 * @return A opção escolhida pelo utilizador.
	 */
	private Option DisplayMenu()
	{ 
		Option option=Option.Unknown;
		try
		{
			System.out.println("APP");
			System.out.println();
			System.out.println("1. Exit");
			System.out.println("2. Validar a base de dados");
			System.out.println("3. Inserir um novo condutor");
			System.out.println("4. Colocar um veiculo fora de serviço");
			System.out.println("5. Obter o custo, kilometros e horas totais de um veiculo");
			System.out.println("6. Obter o cliente com mais viagens");
			System.out.println("7. Obter os condutores com n viagens feitas");
			System.out.println("8. Obter o n. de viagens dos carros de um dado proprietario de um ano");
			System.out.println("9. Obter o condutor com maior custo total de viagens num ano");
			System.out.print(">");
			Scanner s = new Scanner(System.in);
			int result = s.nextInt();
			option = Option.values()[result];			
		}
		catch(RuntimeException ex)
		{
			//nothing to do. 
		}
		
		return option;
		
	}

	/**
	 * Apaga a consola.
	 */
	private final static void clearConsole() {
	    for (int y = 0; y < 25; y++) //console is 80 columns and 25 lines
	    	System.out.println("\n");

	}


	/**
	 * Testa a conexão à base de dados.
	 * @throws java.sql.SQLException Quando a coxe
	 */
	private void Login() throws java.sql.SQLException
	{
		Connection con = DriverManager.getConnection(getConnectionString());
		if(con != null)
			con.close();      
		
	}

	/**
	 * O código principal da aplicação, onde é executado a opção escolhida pelo utlizador.
	 * @throws Exception Caso a opção não for válida.
	 */
	public void Run() throws Exception
	{
		Login ();
		Option userInput = Option.Unknown;
		do
		{
			clearConsole();
			clearConsole();
			userInput = DisplayMenu();
			clearConsole();		  	
			try
			{		
				__dbMethods.get(userInput).doWork();		
				System.in.read();		
				
			}
			catch(NullPointerException ex)
			{
				//Nothing to do. The option was not a valid one. Read another.
			}
			
		}while(userInput!=Option.Exit);
	}

	/**
	 * Retira a informação da connection string.
	 * @return A connections string.
	 */
	public String getConnectionString() 
	{
		return __connectionString;			
	}

	/**
	 * Define a connection string com o valor da string s.
	 * @param s Valor da connection string.
	 */
	public void setConnectionString(String s) 
	{
		__connectionString = s;
	}

	/* Funções que representam as opções da aplicação */

	/**
	 * Valida a base de dados de acordo com os requisitos do programa.
	 */
	private void SetupDB() {
		System.out.println("Validando a base de dados...");
		Connection connection = null;
		try {
			connection = DriverManager.getConnection(__connectionString);
			connection.setAutoCommit(false);
			System.out.println("Verificando carros em excesso...");
			LimitCarCount(connection);
			System.out.println("Apagando condutores que sao proprietarios...");
			DeleteRedundantDrivers(connection);
			System.out.println("Validando a matricula e o numero de cartas de condução...");
			ValidateNCCMatricula(connection);
			System.out.println("Arquivando os carros mais velhos...");
			archiveOldCars(connection);
			System.out.println("Habilitando a criação de novos tipos...");
			dropCarTypeRestriction(connection);
			connection.setAutoCommit(true);
			System.out.println("Base de dados validada!");

		}
		catch (SQLException sqlerr) {
			System.out.println(sqlerr.getMessage());
		}
		finally {
			try {
				if(connection != null) connection.close();
			}
			catch (SQLException sqlerr) {
				System.out.println(sqlerr.getMessage());
			}
		}
	}



	/**
	 * Insere um condutor novo com os dados lidos do standard input.
	 */
	private void InsertDriver() {

		final String SELECT_PROP_ID = "select noident from pessoa where atrdisc like '%P%'";
		final String SELECT_MAX_ID = "select max(id) id from pessoa";
		final String INSERT_DRIVER_PESSOA = "insert into pessoa values (?,?,?,?,?,?,?,?,'C')";
		final String INSERT_DRIVER_CONDUTOR = "insert into condutor values (?,?,?)";

		int id = 0;
		String noident = "";
		String nif = "";
		String nproprio = "";
		String apelido = "";
		String morada = "";
		int codpostal = 0;
		String localidade = "";
		String ncconducao = "";
		LocalDate dtnascimento = null;

		Connection connection = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Scanner scanner = new Scanner(System.in);
			while(true){
				System.out.println("No. Identificação:");
				noident = scanner.nextLine();
				if(citizenCardValid(noident)) {
					break;
				}
				else if (passaportValid(noident)) {
					break;
				}
				else {
					System.out.println("No. identificação inválido!");
				}
			}
			while(true){
				System.out.println("NIF:");
				nif = scanner.nextLine();
				if(nifValid(nif)) {
					break;
				}
				else {
					System.out.println("NIF invalid");
				}
			}
			System.out.println("Primeiro nome:");
			nproprio = scanner.nextLine();
			System.out.println("Apelido:");
			apelido = scanner.nextLine();
			System.out.println("Morada:");
			morada = scanner.nextLine();
			System.out.println("Codigo Postal:");
			codpostal = Integer.parseInt(scanner.nextLine());
			System.out.println("Localidade:");
			localidade = scanner.nextLine();
			while(true) {
				System.out.println("Numero de Carta de Condução:");
				ncconducao = scanner.nextLine();
				if(drivingLicenseValid(ncconducao)) {
					break;
				}
				else {
					System.out.println("Numero de carta de condução invalido!");
				}
			}
			while(true) {
				try {
					System.out.println("Data nascimento:");
					dtnascimento = Date.valueOf(scanner.nextLine()).toLocalDate();
					if (isOlderThan18(dtnascimento)) {
						break;
					} else {
						System.out.println("Cannot insert driver younger than 18");
						return;
					}
				}
				catch (IllegalArgumentException iaerr) {
					System.out.println("Date is invalid!");
				}
			}
		}
		catch (IOError ioerr) {
			System.out.println(ioerr.getMessage());
		}
		try {
				System.out.println("Inserindo o condutor...");
				connection = DriverManager.getConnection(__connectionString);
				connection.setAutoCommit(false);
				stmt = connection.createStatement();
				rs = stmt.executeQuery(SELECT_PROP_ID);
				ArrayList<String> owners = new ArrayList<>();
				while (rs.next()) {
					owners.add(rs.getString("noident"));
				}
				rs.close();
				stmt.close();
				if(!owners.contains(noident)) {
					stmt = connection.createStatement();
					rs = stmt.executeQuery(SELECT_MAX_ID);
					if(rs.next()) {
						id = rs.getInt("id") + 1;
						pstmt = connection.prepareStatement(INSERT_DRIVER_PESSOA);
						pstmt.setInt(1, id);
						pstmt.setString(2, noident);
						pstmt.setString(3, nif);
						pstmt.setString(4, nproprio);
						pstmt.setString(5, apelido);
						pstmt.setString(6, morada);
						pstmt.setInt(7, codpostal);
						pstmt.setString(8, localidade);
						pstmt.executeUpdate();
						pstmt.close();
						pstmt = connection.prepareStatement(INSERT_DRIVER_CONDUTOR);
						pstmt.setInt(1, id);
						pstmt.setString(2, ncconducao);
						assert dtnascimento != null;
						pstmt.setDate(3, Date.valueOf(dtnascimento));
						pstmt.executeUpdate();
					}

					connection.commit();
					connection.setAutoCommit(true);
					System.out.println("Condutor inserido!");
				}
			}
		catch (SQLException sqlerr) {
			System.out.println(sqlerr.getMessage());
			}
		finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (pstmt != null) pstmt.close();
				if (connection != null) connection.close();
			}
			catch (SQLException sqlerr) {
				System.out.println(sqlerr.getMessage());
			}
		}
	}



	/**
	 * Coloca um veiculo fora de serviço através da sua matricula que é indicada no standard input.
	 */
	private void VehicleOutOfService() {

		final String SELECT_VEHICLE_MATRICULA = "select id from veiculo where matricula like ?";

		String matricula = "";
		Integer id = null;

		try {
			Scanner scanner = new Scanner(System.in);
			while(true) {
				System.out.println("Insere a matricula do carro:");
				matricula = scanner.nextLine();
				if(matriculaIsValid(matricula)) {
					matricula = '%' + matricula + '%';
					break;
				}
				else {
					System.out.println("Matricula invalida.");
				}
			}
		}
		catch (IOError ioerr) {
			System.out.println(ioerr.getMessage());
		}

		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			System.out.println("Colocando o veiculo fora de serviço...");
			connection = DriverManager.getConnection(__connectionString);
			connection.setAutoCommit(false);
			pstmt = connection.prepareStatement(SELECT_VEHICLE_MATRICULA);
			pstmt.setString(1, matricula);
			rs = pstmt.executeQuery();
			rs.next();
			id = rs.getInt("id");
			MoveCar(connection, id);
			connection.commit();
			connection.setAutoCommit(true);
			System.out.println("O veiculo agora está fora de serviço.");
		}
		catch (SQLException sqlerr) {
			System.out.println(sqlerr.getMessage());
		}
		finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (connection != null) connection.close();
			}
			catch (SQLException sqlerr) {
				System.out.println(sqlerr.getMessage());
			}
		}
	}

	/**
	 * Obtem os dados de um carro, sendo eles o custo total, os kilometros totais e as horas totais.
	 * O carro é obtido pelo seu id que é indicado no standard input.
	 */
	private void GetVehicleData() {

		final String SELECT_CARS = "select id, matricula from veiculo";
		final String SELECT_CAR_TRIP_DATA =
				"select hinicio, hfim, valfinal, latinicio, longinicio, latfim, longfim " +
				"from viagem where veiculo = ?";

		int id = 0;
		int totalHours = 0;
		double totalKilometers = 0;
		double totalCost = 0;


		Connection connection = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			System.out.println("Obtendo a lista de carros...");
			connection = DriverManager.getConnection(__connectionString);
			connection.setAutoCommit(false);
			stmt = connection.createStatement();
			rs = stmt.executeQuery(SELECT_CARS);
			printResults(rs);
			rs.close();
			System.out.println("\nSelecione o id de um dos veiculos acima:");
			try {
				Scanner scanner = new Scanner(System.in);
				id = scanner.nextInt();
			}
			catch(IOError ioerr) {
				System.out.println(ioerr.getMessage());
				return;
			}
			System.out.println("Obtendo a informação do carro escolhido...");
			pstmt = connection.prepareStatement(SELECT_CAR_TRIP_DATA);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				totalCost += rs.getDouble("valfinal");
				if(rs.getTime("hfim") != null)
					totalHours += rs.getTime("hfim").toLocalTime().getHour() -
							rs.getTime("hinicio").toLocalTime().getHour();
				if(rs.getDouble("latfim") != 0 && rs.getDouble("longfim") != 0)
					totalKilometers += distance(
							rs.getDouble("latinicio"),
							rs.getDouble("longinicio"),
							rs.getDouble("latfim"),
							rs.getDouble("longfim"),
							"K"
					);
			}
			System.out.format(
					"Total cost: %f\nTotal kilometers: %f\nTotal hours: %d\n",
					totalCost,
					totalKilometers,
					totalHours
			);
			connection.commit();
			connection.setAutoCommit(true);
		}
		catch (SQLException sqlerr) {
			System.out.println(sqlerr.getMessage());
		}
		finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (pstmt != null) pstmt.close();
				if (connection != null) connection.close();
			}
			catch (SQLException sqlerr) {
				System.out.println(sqlerr.getMessage());
			}
		}
	}

	/**
	 * Obtem o condutor com mais viagens.
	 */
	private void ClientWithMostTrips() {

		final String SELECT_CLIENT_ORDERED_BY_TRIPCOUNT =
				"select p.id, p.nproprio, p.apelido, p.nif " +
						"from (clienteviagem c join pessoa p on p.id = c.idpessoa) " +
						"join viagem v on v.idsistema = c.viagem " +
						"where extract(year from v.dtviagem) = ? " +
						"group by p.id order by count(v.idsistema) desc";

		int year = 0;

		try {
			Scanner scanner = new Scanner(System.in);
			System.out.println("Insere o ano:");
			year = scanner.nextInt();
		}
		catch(IOError ioerr) {
			System.out.println(ioerr.getMessage());
		}

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			System.out.println("Obtendo o numero de viagens de cada cliente...");
			con = DriverManager.getConnection(__connectionString);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(SELECT_CLIENT_ORDERED_BY_TRIPCOUNT);
			pstmt.setInt(1, year);
			rs = pstmt.executeQuery();
			if(rs != null)
				printResults(rs);
			con.commit();
			con.setAutoCommit(true);
		}
		catch (SQLException e){
			System.out.println(e.getMessage());
		}
		finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			}
			catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}

	/**
	 * Obtem os condutores que fizeram n viagens, onde n é um numero indicado pelo utilizador no standard input.
	 */
	private void DriversWithNTrips() {

		final String SELECT_DRIVERS_WITH_N_TRIPS =
				"select p.id, p.nproprio, p.apelido, p.nif " +
						"from PESSOA p " +
						"where p.id in " +
						"(select v.condutor from viagem v group by v.condutor having count(v.idsistema) = ?)";

		int tripCount = 0;

		try {
			Scanner scanner = new Scanner(System.in);
			System.out.println("Insere o n. de viagens:");
			tripCount = scanner.nextInt();
		}
		catch(IOError ioerr) {
			System.out.println(ioerr.getMessage());
		}

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			System.out.println("Obtendo os condutores que efetuaram " + Integer.toString(tripCount) +
					" viagens...");
			con = DriverManager.getConnection(__connectionString);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(SELECT_DRIVERS_WITH_N_TRIPS);
			pstmt.setInt(1, tripCount);
			rs = pstmt.executeQuery();
			if(rs != null)
				printResults(rs);
			con.commit();
			con.setAutoCommit(true);
		}
		catch (SQLException e){
			System.out.println(e.getMessage());
		}
		finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			}
			catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}

	/**
	 * Obtem o numero de viagens feito pelos carros de um proprietário num determinado ano.
	 * O proprietário e o ano é indicado pelo utilizador no standard input.
	 * O proprietário pode ser indicado pelo nome ou pelo nif.
	 */
	private void TripCountByYear() {

		final String SELECT_TRIPCOUNT_BY_OWNER_NIF =
				"select nif, extract(year from dtviagem) viagemYear, count(idsistema) " +
						"from (VIAGEM vi join VEICULO ve on vi.veiculo = ve.id) " +
						"join PESSOA p on ve.proprietario = p.id " +
						"where nif like ? " +
						"group by nif, viagemYear " +
						"having extract(year from dtviagem) = ?";

		final String SELECT_TRIPCOUNT_BY_OWNER_NAME =
				"select nif, extract(year from dtviagem) viagemYear, count(idsistema) " +
						"from (VIAGEM vi join VEICULO ve on vi.veiculo = ve.id) " +
						"join PESSOA p on ve.proprietario = p.id " +
						"where nproprio like ? and apelido like ?" +
						"group by nif, viagemYear " +
						"having extract(year from dtviagem) = ?";

		String nif = null;
		String nproprio = null;
		String apelido = null;
		int year = 0;

		try {
			Scanner scanner = new Scanner(System.in);
			System.out.println("Insere 1 para escolher o proprietario por nome, 2 para o escolher por nif:");
			int choice = Integer.parseInt(scanner.nextLine());
			switch (choice) {
				case 1 -> {
					System.out.println("Insere o nome (primeiro (espaço) ultimo) do proprietário");
					String[] line = scanner.nextLine().split(" ");
					nproprio = '%' + line[0] + '%';
					apelido = '%' + line[1] + '%';
				}
				case 2 -> {
					System.out.println("Insere o nif do proprietário");
					nif = '%' + scanner.nextLine() + '%';
				}
				default -> { return; }
			}
			System.out.println("Insere o ano");
			year = scanner.nextInt();
		}
		catch(IOError ioerr) {
			System.out.println(ioerr.getMessage());
		}

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			System.out.println("Obtendo o numero de viagens de cada carro...");
			con = DriverManager.getConnection(__connectionString);
			con.setAutoCommit(false);
			if(nif == null){
				pstmt = con.prepareStatement(SELECT_TRIPCOUNT_BY_OWNER_NAME);
				pstmt.setString(1, nproprio);
				pstmt.setString(2, apelido);
				pstmt.setInt(3, year);
			}
			else {
				pstmt = con.prepareStatement(SELECT_TRIPCOUNT_BY_OWNER_NIF);
				pstmt.setString(1, nif);
				pstmt.setInt(2, year);
			}
			rs = pstmt.executeQuery();
			if(rs != null)
				printResults(rs);
			con.commit();
			con.setAutoCommit(true);
		}
		catch (SQLException e){
			System.out.println(e.getMessage());
		}
		finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			}
			catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}

	/**
	 * Obtem o condutor com o maior custo total de um determinado ano.
	 * O ano é indicado pelo utilizador no standard input.
	 */
	private void DriverWithHighestTotalCost() {

		final String SELECT_DRIVER_HIGHEST_COST =
				"select nproprio, apelido, nif, morada " +
						"from PESSOA p join VIAGEM v on p.id = v.condutor " +
						"where extract(year from v.dtviagem) = ? " +
						"group by nproprio, apelido, nif, morada " +
						"order by sum(v.valfinal) desc nulls last";

		int year = 0;

		try {
			Scanner scanner = new Scanner(System.in);
			System.out.println("Insere o ano:");
			year = scanner.nextInt();
		}
		catch(IOError ioerr) {
			System.out.println(ioerr.getMessage());
		}

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			System.out.println("Obtendo o condutor com o maior custo total...");
			con = DriverManager.getConnection(__connectionString);
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(SELECT_DRIVER_HIGHEST_COST);
			pstmt.setInt(1, year);
			rs = pstmt.executeQuery();
			if(rs != null)
				printResults(rs);
			con.commit();
			con.setAutoCommit(true);
		}
		catch (SQLException e){
			System.out.println(e.getMessage());
		}
		finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			}
			catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}

	/* Funções que permitam mostrar os resultados dos pedidos a BD */

	/**
	 * Devolve a informação de uma tabela presente no ResultSet dr no standard output.
	 * @param dr Tabela a mostrar.
	 */
	private void printResults(ResultSet dr) {
		try {
			ResultSetMetaData md = dr.getMetaData();
			int columnCount = md.getColumnCount();
			int currentCount = 1;
			while(currentCount <= columnCount) {
				System.out.format("%s\t\t", md.getColumnLabel(currentCount));
				currentCount++;
			}
			currentCount = 1;
			System.out.print("\n");
			for(int i = 0; i < columnCount; i++) {
				System.out.print("----------");
			}
			System.out.println();
			while(dr.next()){
				while(currentCount <= columnCount){
					System.out.format("%s\t\t", dr.getString(currentCount));
					currentCount++;
				}
				System.out.print("\n");
				currentCount = 1;
			}
		}
		catch(SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	/* Funções auxiliares com pedidos à BD */

	/**
	 * Verifica se todos os proprietários tem até 20 carros. Caso tiverem mais, serão copiados para uma nova tabela
	 * que contem carros fora de serviço.
	 * @param connection Conexão aberta na função SetupDB()
	 * @throws SQLException Caso os dados não serem bem definidos ou bem enviados.
	 */
	private void LimitCarCount(Connection connection) throws SQLException {
		final String SELECT_OWNER_COUNT =
				"select proprietario, count(id) nveiculos from veiculo group by proprietario";
		final String DELETE_CAR =
				"delete from veiculo where proprietario = ? and id not in " +
						"(select id from veiculo order by id asc limit 20)";
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			stmt = connection.createStatement();
			rs = stmt.executeQuery(SELECT_OWNER_COUNT);
			while(rs.next()) {
				int count = rs.getInt("nveiculos");
				if(count > 20) {
					int prop = rs.getInt("proprietario");
					pstmt = connection.prepareStatement(DELETE_CAR);
					pstmt.setInt(1, prop);
					pstmt.executeUpdate();
					pstmt.close();
				}
			}
		}
		catch (SQLException sqlerr) {
			System.out.println(sqlerr.getMessage());
		}
		finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(stmt != null) stmt.close();
		}
	}

	/**
	 * Verifica se não há condutor que seja proprietário. Caso haja, elimina a pessoa do registo dos condutores.
	 * @param connection Conexão aberta na função SetupDB()
	 * @throws SQLException Caso os dados não serem bem definidos ou bem enviados.
	 */
	private void DeleteRedundantDrivers(Connection connection) throws SQLException {
		final String SELECT_ID_DRIVER_OWNER =
				"select idpessoa from proprietario intersect select idpessoa from condutor";
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = connection.createStatement();
			rs = stmt.executeQuery(SELECT_ID_DRIVER_OWNER);
			while(rs.next()) {
				int id = rs.getInt("idpessoa");
				DeleteDriver(connection, id);
			}
		}
		catch (SQLException sqlerr) {
			System.out.println(sqlerr.getMessage());
		}
		finally {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
		}
	}

	/**
	 * Valida o numero de carta de condução de cada condutor e a matricula de cada carros. Cajo haja um que não
	 * é valido, é removido o condutor ou o carro, respetivamente.
	 * @param connection Conexão aberta na função SetupDB()
	 * @throws SQLException Caso os dados não serem bem definidos ou bem enviados.
	 */
	private void ValidateNCCMatricula(Connection connection) throws SQLException {
		final String SELECT_NCC_DRIVER =
				"select idpessoa, ncconducao from condutor";
		final String SELECT_MATRICULA_CAR =
				"select id, matricula from veiculo";
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = connection.createStatement();
			rs = stmt.executeQuery(SELECT_NCC_DRIVER);
			while(rs.next()) {
				String nccconducao = rs.getString("ncconducao");
				if(!drivingLicenseValid(nccconducao)){
					DeleteDriver(connection, rs.getInt("idpessoa"));
				}
			}
			rs.close();
			stmt.close();
			stmt = connection.createStatement();
			rs = stmt.executeQuery(SELECT_MATRICULA_CAR);
			while(rs.next()){
				String matricula = rs.getString("matricula");
				if(!matriculaIsValid(matricula)) {
					DeleteCar(connection, rs.getInt("id"));
				}
			}
		}
		catch (SQLException sqlerr) {
			System.out.println(sqlerr.getMessage());
		}
		finally {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
		}
	}

	/**
	 * Coloca os carros com mais de 5 anos fora de serviço.
	 * @param connection Conexão aberta na função SetupDB()
	 * @throws SQLException Caso os dados não serem bem definidos ou bem enviados.
	 */
	private void archiveOldCars(Connection connection) throws SQLException {

		final String SELECT_YEAR_CAR =
				"select id, ano from veiculo";

		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = connection.createStatement();
			rs = stmt.executeQuery(SELECT_YEAR_CAR);
			while(rs.next()) {
				int year = rs.getInt("ano");
				if(LocalDate.now().getYear() - year > 5) {
					MoveCar(connection, rs.getInt("id"));
				}
			}
		}
		catch (SQLException sqlerr) {
			System.out.println(sqlerr.getMessage());
		}
		finally {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
		}
	}

	/**
	 * Permite a adição de um novo tipo de carro na base de dados.
	 * @param connection Conexão aberta na função SetupDB()
	 * @throws SQLException Caso os dados não serem bem definidos ou bem enviados.
	 */
	private void dropCarTypeRestriction(Connection connection) throws SQLException {
		final String DROP_CAR_TYPE_RESTRICTION =
				"alter table TIPOVEICULO drop constraint tipoveiculo_designacao_check";

		Statement stmt = null;

		try {
			stmt = connection.createStatement();
			stmt.executeUpdate(DROP_CAR_TYPE_RESTRICTION);
		}
		catch (SQLException sqlerr) {
			System.out.println(sqlerr.getMessage());
		}
		finally {
			if(stmt != null) stmt.close();
		}
	}



	/**
	 * Apaga o registo do condutor.
	 * @param connection Conexão aberta nas funções que a chamam.
	 * @param id ID do condutor.
	 * @throws SQLException Caso os dados não serem bem definidos ou bem enviados.
	 */
	private void DeleteDriver(Connection connection, int id) throws SQLException {

		final String DELETE_DRIVER_CLIENTEVIAGEM =
				"delete from clienteviagem where viagem in (select idsistema from viagem where condutor = ?)";
		final String DELETE_DRIVER_VIAGEM =
				"delete from viagem where condutor = ?";
		final String DELETE_DRIVER_PERIODOACTIVO =
				"delete from periodoactivo where condutor = ?";
		final String DELETE_DRIVER_CONTACTO =
				"delete from contacto where idpessoa = ? and idpessoa not in (select idpessoa from proprietario)";
		final String DELETE_DRIVER_CONDUTORHABILITADO =
				"delete from condutorhabilitado where condutor = ?";
		final String DELETE_DRIVER_CONDUTOR =
				"delete from condutor where idpessoa = ?";
		final String DELETE_DRIVER_PESSOA =
				"delete from pessoa where id = ? and atrdisc like '%C%'";

		PreparedStatement pstmt = null;


		try {
			pstmt = connection.prepareStatement(DELETE_DRIVER_CLIENTEVIAGEM);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			pstmt.close();
			pstmt = connection.prepareStatement(DELETE_DRIVER_VIAGEM);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			pstmt.close();
			pstmt = connection.prepareStatement(DELETE_DRIVER_PERIODOACTIVO);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			pstmt.close();
			pstmt = connection.prepareStatement(DELETE_DRIVER_CONTACTO);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			pstmt.close();
			pstmt = connection.prepareStatement(DELETE_DRIVER_CONDUTORHABILITADO);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			pstmt.close();
			pstmt = connection.prepareStatement(DELETE_DRIVER_CONDUTOR);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			pstmt.close();
			pstmt = connection.prepareStatement(DELETE_DRIVER_PESSOA);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		}
		catch (SQLException sqlerr) {
			System.out.println(sqlerr.getMessage());
		}
		finally {
			if(pstmt != null) pstmt.close();
		}
	}

	/**
	 * Apaga o registo do carro
	 * @param connection Conexão aberta pelas funções que chamaram esta função.
	 * @param id ID do carro.
	 * @throws SQLException Caso os dados não serem bem definidos ou bem enviados.
	 */
	private void DeleteCar(Connection connection, int id) throws SQLException {

		final String DELETE_CAR_CLIENTEVIAGEM =
				"delete from clienteviagem where viagem in (select idsistema from viagem where veiculo = ?)";
		final String DELETE_CAR_VIAGEM =
				"delete from viagem where veiculo = ?";
		final String DELETE_CAR_PERIODOACTIVO =
				"delete from periodoactivo where veiculo = ?";
		final String DELETE_CAR_CORVEICULO =
				"delete from corveiculo where veiculo = ?";
		final String DELETE_CAR_CONDUTORHABILITADO =
				"delete from condutorhabilitado where veiculo = ?";
		final String DELETE_CAR_VEICULO =
				"delete from veiculo where id = ?";

		PreparedStatement pstmt = null;

		try {
			pstmt = connection.prepareStatement(DELETE_CAR_CLIENTEVIAGEM);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			pstmt.close();
			pstmt = connection.prepareStatement(DELETE_CAR_VIAGEM);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			pstmt.close();
			pstmt = connection.prepareStatement(DELETE_CAR_PERIODOACTIVO);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			pstmt.close();
			pstmt = connection.prepareStatement(DELETE_CAR_CORVEICULO);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			pstmt.close();
			pstmt = connection.prepareStatement(DELETE_CAR_CONDUTORHABILITADO);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			pstmt.close();
			pstmt = connection.prepareStatement(DELETE_CAR_VEICULO);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			pstmt.close();
		}
		catch (SQLException sqlerr) {
			System.out.println(sqlerr.getMessage());
		}
		finally {
			if(pstmt != null) pstmt.close();
		}

	}

	/**
	 * Arquiva o carro para uma tabela nova que contem carros fora de serviço
	 * @param connection Conexão aberta na função que a chamou.
	 * @param id ID do carro.
	 * @throws SQLException Caso os dados não serem bem definidos ou bem enviados.
	 */
	private void MoveCar(Connection connection, int id) throws SQLException {

		final String CREATE_OLD_CAR_TABLE =
				"create table if not exists VEICULO_OLD(" +
						"id integer primary key, " +
						"matricula varchar(10) unique not null, " +
						"tipo integer not null, " +
						"foreign key (tipo) references TIPOVEICULO(tipo), " +
						"modelo varchar(10) not null, " +
						"marca varchar(10) not null, " +
						"ano integer check (ano > 0) not null, " +
						"proprietario integer not null, " +
						"foreign key (proprietario) references PROPRIETARIO(idpessoa), " +
						"n_viagens integer not null, " +
						"total_kilometers decimal(6,2)" +
						");";

		final String INSERT_CAR_OLDTABLE =
				"insert into veiculo_old values (?,?,?,?,?,?,?,?,?)";
		final String SELECT_TRIPCOUNT_CAR =
				"select veiculo, count(idsistema) nviagens from viagem where veiculo = ? group by veiculo";
		final String SELECT_LATITUDE_LONGITUDE_CAR =
				"select veiculo, latinicio, longinicio, latfim, longfim from viagem where veiculo = ?";
		final String DELETE_CAR_VEICULO =
				"delete from veiculo where veiculo = ?";
		final String SELECT_CAR =
				"select * from veiculo where id = ?";

		Statement stmt = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;

		try {
			int viagens = 0;
			double latinicial = 0F;
			double longinicial = 0F;
			double latfinal = 0F;
			double longfinal = 0F;

			stmt = connection.createStatement();
			stmt.executeUpdate(CREATE_OLD_CAR_TABLE);
			stmt.close();
			pstmt1 = connection.prepareStatement(SELECT_TRIPCOUNT_CAR);
			pstmt1.setInt(1, id);
			rs = pstmt1.executeQuery();
			if(rs.next()) {
				viagens = rs.getInt("nviagens");
			}
			rs.close();
			pstmt1.close();
			pstmt1 = connection.prepareStatement(SELECT_LATITUDE_LONGITUDE_CAR);
			pstmt1.setInt(1, id);
			rs = pstmt1.executeQuery();
			while(rs.next()) {
				latinicial += rs.getDouble("latinicio");
				longinicial += rs.getDouble("longinicio");
				latfinal += rs.getDouble("latfim");
				longfinal += rs.getDouble("longfim");
			}
			rs.close();
			pstmt1.close();
			double distance = distance(latinicial, longinicial, latfinal, longfinal, "K");
			pstmt1 = connection.prepareStatement(SELECT_CAR);
			pstmt1.setInt(1, id);
			rs = pstmt1.executeQuery();
			if(rs.next()) {
				pstmt2 = connection.prepareStatement(INSERT_CAR_OLDTABLE);
				pstmt2.setInt(1, id);
				pstmt2.setString(2, rs.getString(2));
				pstmt2.setInt(3, rs.getInt(3));
				pstmt2.setString(4, rs.getString(4));
				pstmt2.setString(5, rs.getString(5));
				pstmt2.setInt(6, rs.getInt(6));
				pstmt2.setInt(7, rs.getInt(7));
				pstmt2.setInt(8, viagens);
				pstmt2.setDouble(9, distance);
				pstmt2.executeUpdate();
				pstmt2.close();
			}
			pstmt1.close();
			rs.close();
			DeleteCar(connection, id);
		}
		catch (SQLException sqlex) {
			System.out.println(sqlex.getMessage());
		}
		finally {
			if(rs != null) rs.close();
			if(pstmt2 != null) pstmt2.close();
			if(pstmt1 != null) pstmt1.close();
			if(stmt != null) stmt.close();
		}
	}

	/* Funções auxiliares sem pedidos à BD */

	/**
	 * Verifica de o número de carta de condução é valido.
	 * @param ncc Número de carta de condução a testar.
	 * @return true se for valido, false caso contrário.
	 */
	private boolean drivingLicenseValid(String ncc) {
		if(ncc.length() != 10 || ncc.charAt(2) != '-') return false;
		String[] dividedNcc = ncc.split("-");
		try {
			Integer.parseInt(dividedNcc[1]);
			return Character.isAlphabetic(dividedNcc[0].charAt(0))
					&& Character.isAlphabetic(dividedNcc[0].charAt(1));
		}
		catch(NumberFormatException ex) {
			return false;
		}
	}

	/**
	 * Verifica se a matricula é valida.
	 * @param matricula Matricula a avaliar.
	 * @return true se for valida, false caso contrário.
	 */
	private boolean matriculaIsValid(String matricula) {
		if(matricula.length() != 6) return false;
		String first = matricula.substring(0, 2);
		String second = matricula.substring(2, 4);
		String third = matricula.substring(4, 6);
		if(Character.isAlphabetic(matricula.charAt(0))) {
			try {
				Integer.parseInt(second);
				return Character.isAlphabetic(first.charAt(0)) && Character.isAlphabetic(first.charAt(1))
						&& Character.isAlphabetic(third.charAt(0)) && Character.isAlphabetic(third.charAt(1));
			}
			catch(NumberFormatException ex) {
				return false;
			}
		}
		else {
			try {
				Integer.parseInt(first);
				Integer.parseInt(third);
				return Character.isAlphabetic(second.charAt(0)) && Character.isAlphabetic(second.charAt(1));
			}
			catch(NumberFormatException ex) {
				return false;
			}
		}
	}

	/**
	 * Verifica se o cartão de cidadão é valido
	 * @param cc Cartão de cidadão a validar
	 * @return true se for valido, false caso contrário
	 */
	private boolean citizenCardValid(String cc) {
		if(cc.length() != 12) return false;
		String firstNumbers = cc.substring(0, 9);
		String letters = cc.substring(9, 11);
		String lastNumber = cc.substring(11);
		try {
			Integer.parseInt(firstNumbers);
			Integer.parseInt(lastNumber);
			return Character.isAlphabetic(letters.charAt(0)) && Character.isAlphabetic(letters.charAt(1));
		}
		catch(NumberFormatException nferr) {
			return false;
		}
	}

	/**
	 * Verifica se o passaporte é valido
	 * @param passaport Passaporte a validar
	 * @return true se for valido, false caso contrário
	 */
	private boolean passaportValid(String passaport) {
		if(passaport.length() != 9) return false;
		String letters = passaport.substring(0, 2);
		String numbers = passaport.substring(2);
		try {
			Integer.parseInt(numbers);
			return Character.isAlphabetic(letters.charAt(0)) && Character.isAlphabetic(letters.charAt(1));
		}
		catch(NumberFormatException nferr) {
			return false;
		}
	}

	/**
	 * Verifica se o nif é válido
	 * @param nif Nif a validar
	 * @return true se for válido, false caso contrário
	 */
	private boolean nifValid(String nif) {
		if(nif.length() != 9) return false;
		try {
			Integer.parseInt(nif);
			return true;
		}
		catch(NumberFormatException nferr) {
			return false;
		}
	}

	/**
	 * Verifica se a pessoa tem mais de 18 anos
	 * @param dtnascimento Data de nascimento da pessoa
	 * @return true se tiver mais que 18 anos, false caso contrário
	 */
	private boolean isOlderThan18(LocalDate dtnascimento) {
		LocalDate currentDate = LocalDate.now();
		int yearDifference = currentDate.getYear() - dtnascimento.getYear();
		if(yearDifference < 18) return false;
		if(yearDifference > 18) return true;
		int monthDifference = currentDate.getMonthValue() - dtnascimento.getMonthValue();
		if(monthDifference < 0) return false;
		if(monthDifference > 0) return true;
		return currentDate.getDayOfMonth() >= dtnascimento.getDayOfMonth();
	}

	/**
	 * Calcula a distância entre dois pontos, utilizando latitude e longitude
	 * @param lat1 Latitude do ponto 1
	 * @param lon1 Longitude do ponto 1
	 * @param lat2 Latitude do ponto 2
	 * @param lon2 Longitude do ponto 2
	 * @param unit Unidade da resposta: M para milhas, K para kilometros, N para milhas nauticas.
	 * @return Distancia entre os dois pontos.
	 */
	static double distance(double lat1, double lon1, double lat2, double lon2, String unit) {
		if ((lat1 == lat2) && (lon1 == lon2)) {
			return 0;
		}
		else {
			double theta = lon1 - lon2;
			double dist = Math.sin(Math.toRadians(lat1)) * Math.sin(Math.toRadians(lat2)) + Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) * Math.cos(Math.toRadians(theta));
			dist = Math.acos(dist);
			dist = Math.toDegrees(dist);
			dist = dist * 60 * 1.1515;
			if (unit.equals("K")) {
				dist = dist * 1.609344;
			} else if (unit.equals("N")) {
				dist = dist * 0.8684;
			}
			return (dist);
		}
	}

}


public class DBMS
{
	public static void main(String[] args) throws Exception
	{
		String ip = "10.62.73.73:5432";
		String username = "mp16";
		String password = "isi32dgrupo16";
		String url =  "jdbc:postgresql://" +
				ip +
				"/?user=" +
				username +
				"&password=" +
				password +
				"&ssl=false";
		App.getInstance().setConnectionString(url);
		App.getInstance().Run();
	}
}