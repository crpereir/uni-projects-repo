import java.io.FileNotFoundException;
import java.util.Scanner;

/**
 * Entry point of application.
 */
public class App {

    public static void main(String[] args) {
        app:
        while (true) {
            try {
                writeAvailableCommands();
                Scanner scanner = new Scanner(System.in);
                String command = scanner.nextLine();
                String[] params = command.trim().split("\\s+");

                switch (params[0]) {
                    case Command.ADDBLOCK:
                        Command.addBlock(params);
                        break;
                    case Command.VERIFYCHAIN:
                        Command.verifyChain(params);
                        break;
                    case Command.EXIT:
                        break app;
                    default:
                        System.out.println("Command not found.");
                }
            } catch (Exception e) {
                if (e instanceof NumberFormatException) {
                    System.out.println("Error: Invalid format " + e.getMessage().toLowerCase());
                }
                else if (e instanceof IllegalArgumentException || e instanceof FileNotFoundException) {
                    System.out.println("Error: " + e.getMessage());
                } else {
                    System.out.println("Unexpected error processing the command, try again.");
                }
            }
        }
    }

    public static void writeAvailableCommands() {
        System.out.println("\nAvailable commands: ");
        System.out.println("    addblock <origin> <destiny> <value> <filename>");
        System.out.println("    verifychain <filename>");
        System.out.print("> ");
    }
}