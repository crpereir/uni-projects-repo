
import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.Base64;
import java.util.Random;

/**
 * Main component that ciphers text in JWE format.
 */
public class JWECipher {

    private final int markSize = 128;

    /**
     * Encrypt message with recipient's public key in certificate.
     * @param text message to cipher.
     * @param certificateName name of recipient's certificate.
     * @return ciphered text in JWE format.
     * @throws Exception if an IO error occurs.
     */
    public String encrypt(String text, String certificateName) throws Exception {

        // Generating a header and IV.
        Random rd = new Random();

        byte[] addBytes = new byte[16];
        rd.nextBytes(addBytes);
        byte[] ivBytes = new byte[16];
        rd.nextBytes(ivBytes);

        // Obtaining components for cipher and public key.
        SymmetricCipher symmetricCipher = new SymmetricCipher();
        AsymmetricKeyCipher asymmetricKeyCipher = new AsymmetricKeyCipher();
        KeyGetter keyGetter = new KeyGetter();

        PublicKey publicKey = keyGetter.getPublicKey(certificateName);

        // Generating secret key.
        byte[] keyBytes = new byte[16];
        rd.nextBytes(keyBytes);

        // Encrypting secret key.
        byte[] encryptKeyBytes = asymmetricKeyCipher.encrypt(keyBytes, publicKey);

        // Encrypting text.
        CipheredAuthenticatedMessage cam = symmetricCipher.encrypt(text, addBytes, keyBytes, ivBytes, markSize);

        // Encoding byte arrays to a Base64 format.
        Base64.Encoder base64Encoder = Base64.getEncoder();

        String addString = base64Encoder.encodeToString(addBytes);
        String encryptKeyString = base64Encoder.encodeToString(encryptKeyBytes);
        String ivString = base64Encoder.encodeToString(ivBytes);
        String cipheredString = base64Encoder.encodeToString(cam.msg);
        String markString = base64Encoder.encodeToString(cam.mark);

        // Joining to make JWE format.
        return String.join(".", addString, encryptKeyString, ivString, cipheredString, markString);

    }

    /**
     * Decrypt message with recipient's private key in key store.
     * @param token message in JWE format.
     * @param pfx recipient's key store name.
     * @return Deciphered text.
     * @throws Exception if an IO error occurs.
     */
    public String decrypt(String token, String pfx) throws Exception {

        // Obtaining components for cipher and private key.
        SymmetricCipher symmetricCipher = new SymmetricCipher();
        AsymmetricKeyCipher asymmetricKeyCipher = new AsymmetricKeyCipher();
        KeyGetter keyGetter = new KeyGetter();

        PrivateKey privateKey = keyGetter.getPrivateKey(pfx, "changeit");

        // Splitting the JWE token to obtain the 5 components.
        String[] splitToken = token.split("\\.");
        if(splitToken.length != 5)
            throw new IllegalArgumentException("Token is not in JWE format.");

        // Decoding strings from a Base64 format.
        Base64.Decoder base64decoder = Base64.getDecoder();

        byte[] header = base64decoder.decode(splitToken[0]);
        byte[] encryptKey = base64decoder.decode(splitToken[1]);
        byte[] iv = base64decoder.decode(splitToken[2]);
        byte[] cipheredString = base64decoder.decode(splitToken[3]);
        byte[] mark = base64decoder.decode(splitToken[4]);

        // Decrypting private key.
        byte[] keyBytes = asymmetricKeyCipher.decrypt(encryptKey, privateKey);

        CipheredAuthenticatedMessage cam = new CipheredAuthenticatedMessage(cipheredString, mark);

        return symmetricCipher.decrypt(cam, header, keyBytes, iv, markSize);
    }
}
