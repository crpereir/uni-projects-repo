
public class Command {

    static final String JWE_ENC = "jwe enc";
    static final String JWE_DEC = "jwe dec";
    static final String EXIT = "exit";

    private static final JWECipher jweCipher = new JWECipher();

    public static void jweEnc(String[] params) throws Exception {
        if(params.length != 4) {
            throw new IllegalArgumentException("Requires 2 parameters: string to cipher, recipient certificate");
        }
        String string = params[2];
        String certificateName = params[3];
        String jweToken = jweCipher.encrypt(string, certificateName);
        System.out.println("JWE token = " + jweToken);
    }

    public static void jweDec(String[] params) throws Exception {
        if(params.length != 4) {
            throw new IllegalArgumentException("Requires 2 parameters: jwe token, recipient pfx");
        }
        String token = params[2];
        String pfx = params[3];
        String message = jweCipher.decrypt(token, pfx);
        System.out.println("Decrypted text = " + message);
    }
}
