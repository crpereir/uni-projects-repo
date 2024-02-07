/**
 * Represents a single block in the blockchain.
 */
public class Block {
    public int origin;
    public int destiny;
    public float value;
    public String hash;

    public Block(int origin, int destiny, float value, String hash) {
        this.origin = origin;
        this.destiny = destiny;
        this.value = value;
        this.hash = hash;
    }

    /**
     * Parser that splits the message and generates a block.
     * @param format Comma separated text.
     */
    public Block(String format) {
        String[] params = format.split(",");
        this.origin = Integer.parseInt(params[0]);
        this.destiny = Integer.parseInt(params[1]);
        this.value = Float.parseFloat(params[2]);
        this.hash = params[3];
    }

    public String toString() {
        return String.format("%d,%d,%f,%s", origin, destiny, value, hash);
    }
}
