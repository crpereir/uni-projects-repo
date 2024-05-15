import javax.crypto.Cipher;
import java.security.PrivateKey;
import java.security.PublicKey;


/**
 * Component used to encrypt or decrypt secret key.
 */
public class AsymmetricKeyCipher {
    public byte[] encrypt(byte[] keyBytes, PublicKey publicKey) throws Exception {
        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.ENCRYPT_MODE, publicKey);

        return cipher.doFinal(keyBytes);
    }

    public byte[] decrypt(byte[] cipherKeyBytes, PrivateKey privateKey) throws Exception {
        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.DECRYPT_MODE, privateKey);

        return cipher.doFinal(cipherKeyBytes);
    }
}
