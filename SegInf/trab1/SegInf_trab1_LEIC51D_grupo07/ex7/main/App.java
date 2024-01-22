import javax.crypto.BadPaddingException;
import java.io.FileNotFoundException;
import java.security.cert.CertPathBuilderException;
import java.util.Scanner;

public class App {

    // Entry point of application.
    public static void main(String[] args) {
        app:
        while (true) {
            try {
                writeAvailableCommands();
                Scanner scanner = new Scanner(System.in);
                String command = scanner.nextLine();
                String[] params = command.trim().split("\\s+");

                switch (params[0] + " " + params[1]) {
                    case Command.JWE_ENC:
                        Command.jweEnc(params);
                        break;
                    case Command.JWE_DEC:
                        Command.jweDec(params);
                        break;
                    case Command.EXIT:
                        break app;
                    default:
                        System.out.println("Command not found.");
                }
            } catch (Exception e) {
                if (e instanceof IllegalArgumentException) {
                    System.out.println("Error: " + e.getMessage());
                }
                else if (e instanceof FileNotFoundException) {
                    System.out.println("Error: Certificate with given name does not exist.");
                }
                else if (e instanceof CertPathBuilderException) {
                    System.out.println("Error: Certificate is not valid.");
                }
                else if (e instanceof BadPaddingException) {
                    System.out.println("Error: Public key of certificate does not match private key of keystore.");
                }
                else
                    System.out.println("Unexpected error processing the command. Try again.");
            }
        }
    }

    public static void writeAvailableCommands() {
        System.out.println("\nAvailable commands: ");
        System.out.println("   jwe enc <some string> <recipient certificate>");
        System.out.println("   jwe dec <jwe string> <recipient pfx>");
        System.out.print("> ");
    }
}