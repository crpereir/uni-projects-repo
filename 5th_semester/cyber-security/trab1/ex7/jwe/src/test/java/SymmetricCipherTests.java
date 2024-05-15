import junit.framework.*;

import javax.crypto.AEADBadTagException;
import java.util.Arrays;

public class SymmetricCipherTests extends TestCase {

    public void test_can_encrypt_and_decrypt_correctly() throws Exception {
        String text = "Hello World!";
        byte[] additional = {0x01};
        byte[] keyBytes = {0x01, 0x23, 0x45, 0x67, (byte) 0x89, (byte) 0xab, (byte) 0xcd, (byte) 0xef, 0x01, 0x23, 0x45, 0x67, (byte) 0x89, (byte) 0xab, (byte) 0xcd, (byte) 0xef};
        byte[] ivBytes = {(byte) 0xef, (byte) 0xcd, (byte) 0xab, (byte) 0x89, 0x67, 0x45, 0x23, 0x01, (byte) 0xef, (byte) 0xcd, (byte) 0xab, (byte) 0x89, 0x67, 0x45, 0x23, 0x01};
        int markSizeInBits = 128;

        SymmetricCipher symmetricCipher = new SymmetricCipher();
        CipheredAuthenticatedMessage cipheredAuthenticatedMessage = symmetricCipher.encrypt(text, additional, keyBytes, ivBytes, markSizeInBits);
        String decipherText = symmetricCipher.decrypt(cipheredAuthenticatedMessage, additional, keyBytes, ivBytes, markSizeInBits);

        assertEquals(text, decipherText);
    }

    public void test_can_detect_error_between_encrypt_and_decrypt() throws Exception {
        String text = "Hello World!";
        byte[] additional = {0x01};
        byte[] keyBytes = {0x01, 0x23, 0x45, 0x67, (byte) 0x89, (byte) 0xab, (byte) 0xcd, (byte) 0xef, 0x01, 0x23, 0x45, 0x67, (byte) 0x89, (byte) 0xab, (byte) 0xcd, (byte) 0xef};
        byte[] ivBytes = {(byte) 0xef, (byte) 0xcd, (byte) 0xab, (byte) 0x89, 0x67, 0x45, 0x23, 0x01, (byte) 0xef, (byte) 0xcd, (byte) 0xab, (byte) 0x89, 0x67, 0x45, 0x23, 0x01};
        int markSizeInBits = 128;

        SymmetricCipher symmetricCipher = new SymmetricCipher();
        CipheredAuthenticatedMessage cipheredAuthenticatedMessage = symmetricCipher.encrypt(text, additional, keyBytes, ivBytes, markSizeInBits);

        byte[] wrongMsg = Arrays.copyOf(cipheredAuthenticatedMessage.msg, cipheredAuthenticatedMessage.msg.length);
        wrongMsg[1] |= (byte) (1 << 5);

        assertFalse(Arrays.equals(wrongMsg, cipheredAuthenticatedMessage.msg));

        CipheredAuthenticatedMessage wrongCipheredAuthenticatedMessage = new CipheredAuthenticatedMessage(wrongMsg, cipheredAuthenticatedMessage.mark);

        try {
            symmetricCipher.decrypt(wrongCipheredAuthenticatedMessage, additional, keyBytes, ivBytes, markSizeInBits);
            fail("Message still was valid.");
        } catch(Exception e) {
            assertTrue( e instanceof AEADBadTagException );
        }

    }

    public void test_can_detect_error_between_encrypt_and_decrypt_2() throws Exception {
        String text = "Hello World!";
        byte[] additional = {0x01};
        byte[] additional2 = {0x02};
        byte[] keyBytes = {0x01, 0x23, 0x45, 0x67, (byte) 0x89, (byte) 0xab, (byte) 0xcd, (byte) 0xef, 0x01, 0x23, 0x45, 0x67, (byte) 0x89, (byte) 0xab, (byte) 0xcd, (byte) 0xef};
        byte[] ivBytes = {(byte) 0xef, (byte) 0xcd, (byte) 0xab, (byte) 0x89, 0x67, 0x45, 0x23, 0x01, (byte) 0xef, (byte) 0xcd, (byte) 0xab, (byte) 0x89, 0x67, 0x45, 0x23, 0x01};
        int markSizeInBits = 128;

        SymmetricCipher symmetricCipher = new SymmetricCipher();
        CipheredAuthenticatedMessage cipheredAuthenticatedMessage = symmetricCipher.encrypt(text, additional, keyBytes, ivBytes, markSizeInBits);

        try {
            symmetricCipher.decrypt(cipheredAuthenticatedMessage, additional2, keyBytes, ivBytes, markSizeInBits);
            fail("Message still was valid.");
        } catch(Exception e) {
            assertTrue( e instanceof AEADBadTagException );
        }
    }
}