import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Arrays;


/**
 * Container that holds the ciphered text and its authentication tag.
 */
public class CipheredAuthenticatedMessage {

    public byte[] msg;

    public byte[] mark;


    public CipheredAuthenticatedMessage(byte[] msg, byte[] mark) {
        this.msg = msg;
        this.mark = mark;
    }

    /**
     * Parser that splits the ciphered bytes into the message and its tag.
     * @param message ciphered text with tag.
     * @param markSizeInBytes size of tag.
     */
    public CipheredAuthenticatedMessage(byte[] message, int markSizeInBytes) {
        this.msg = Arrays.copyOfRange(message, 0, message.length - markSizeInBytes);
        this.mark = Arrays.copyOfRange(message, message.length - markSizeInBytes, message.length);
    }

    /**
     * Joins message and tag into single byte array.
     * @return byte array containing message and tag.
     * @throws IOException if an IO error occurs.
     */
    public byte[] joinToByteArray() throws IOException {
        ByteArrayOutputStream stream = new ByteArrayOutputStream();
        stream.write(msg);
        stream.write(mark);
        return stream.toByteArray();
    }

}
