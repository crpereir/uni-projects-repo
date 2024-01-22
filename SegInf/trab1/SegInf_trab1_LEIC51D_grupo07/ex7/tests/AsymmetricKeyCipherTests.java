import junit.framework.TestCase;

import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.Arrays;

public class AsymmetricKeyCipherTests extends TestCase {

    public void test() throws Exception {
        byte[] keyBytes = {0x01, 0x23, 0x45, 0x67, (byte) 0x89, (byte) 0xab, (byte) 0xcd, (byte) 0xef, 0x01, 0x23, 0x45, 0x67, (byte) 0x89, (byte) 0xab, (byte) 0xcd, (byte) 0xef};

        KeyPairGenerator keyPairGen = KeyPairGenerator.getInstance("RSA");
        keyPairGen.initialize(2048);
        KeyPair pair = keyPairGen.generateKeyPair();
        PrivateKey privateKey = pair.getPrivate();
        PublicKey publicKey = pair.getPublic();

        AsymmetricKeyCipher asymmetricKeyCipher = new AsymmetricKeyCipher();
        byte[] cipherKeyBytes = asymmetricKeyCipher.encrypt(keyBytes, publicKey);



        byte[] decipherKeyBytes = asymmetricKeyCipher.decrypt(cipherKeyBytes, privateKey);

        assertEquals(Arrays.toString(keyBytes), Arrays.toString(decipherKeyBytes));
    }
}