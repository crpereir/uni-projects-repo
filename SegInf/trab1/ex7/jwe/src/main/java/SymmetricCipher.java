import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;

/**
 * Component that ciphers with secret key
 */
public class SymmetricCipher {

    /**
     * Encrypting message while using header JWE format.
     * @param text message that will be encrypted.
     * @param additional header used with cipher.
     * @param keyBytes secret key used in cipher.
     * @param ivBytes iv used in cipher.
     * @param markSize mark of authentication.
     * @return message encrypted.
     * @throws Exception if an IO error occurs.
     */
    public CipheredAuthenticatedMessage encrypt(String text, byte[] additional, byte[] keyBytes, byte[] ivBytes, int markSize) throws Exception {

        SecretKey secretKey = new SecretKeySpec(keyBytes, "AES");

        GCMParameterSpec auth = new GCMParameterSpec(markSize, ivBytes);

        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        cipher.init(Cipher.ENCRYPT_MODE, secretKey, auth);

        // Used for additional info (header JWE).
        cipher.updateAAD(additional);

        byte[] cipheredText = cipher.doFinal(text.getBytes());

        return new CipheredAuthenticatedMessage(cipheredText, markSize / 8);
    }


    /**
     * Decrypting message while using JWE header.
     * @param msg message ciphered that will be decrypted.
     * @param additional header used with cipher.
     * @param keyBytes secret key used in cipher.
     * @param ivBytes iv used in cipher.
     * @param markSize mark of authentication.
     * @return message decrypted.
     * @throws Exception if an IO error occurs.
     */
    public String decrypt(CipheredAuthenticatedMessage msg, byte[] additional, byte[] keyBytes, byte[] ivBytes, int markSize) throws Exception {

        byte[] cipherBytes = msg.joinToByteArray();

        SecretKey secretKey = new SecretKeySpec(keyBytes, "AES");

        GCMParameterSpec auth = new GCMParameterSpec(markSize, ivBytes);

        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        cipher.init(Cipher.DECRYPT_MODE, secretKey, auth);

        // Used for additional info (header JWE).
        cipher.updateAAD(additional);

        byte[] decipherBytes = cipher.doFinal(cipherBytes);

        return new String(decipherBytes, StandardCharsets.UTF_8);
    }
}
