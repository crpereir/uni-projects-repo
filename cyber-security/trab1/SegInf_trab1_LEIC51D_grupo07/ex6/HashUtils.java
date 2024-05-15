import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class HashUtils {

    // Hashing a block in SHA-256 format.
    public static String buildHash(Block block) throws NoSuchAlgorithmException {
        MessageDigest dg = MessageDigest.getInstance("SHA-256");
        return Base64.getUrlEncoder().encodeToString(
                dg.digest(
                        block.toString().getBytes(Charset.defaultCharset())
                )
        );
    }
}
