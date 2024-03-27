import java.io.File;
import java.io.FileNotFoundException;
import java.security.NoSuchAlgorithmException;

public class Command {

    static final String ADDBLOCK = "addblock";
    static final String VERIFYCHAIN = "verifychain";
    static final String EXIT = "exit";


    /**
     * Adding new block to chain.
     */
    public static void addBlock(String[] params) throws Exception {
        if (params.length != 5) {
            throw new IllegalArgumentException("Requires 4 parameters: origin, destiny, value, filename.");
        }
        int origin = Integer.parseInt(params[1]);
        int destiny = Integer.parseInt(params[2]);
        float value = Float.parseFloat(params[3]);
        String filename = params[4];

        // In case if chain already exists or not.
        SimpleBlockChain sbc;
        File file = new File(filename);
        if (file.exists()) {
            sbc = (new SimpleBlockChain(false)).readChainFromFile(file.getName());
        } else {
            sbc = new SimpleBlockChain(true);
        }

        // Making block and adding it to chain.
        Block lastBlock = sbc.getLastBlock();
        String hash = HashUtils.buildHash(lastBlock);
        Block newBlock = new Block(origin, destiny, value, hash);
        sbc.addToChain(newBlock);

        sbc.storeChainInFile(filename);

        System.out.println("Block added to chain successfully.");
    }

    /**
     * Verifies if chain is valid.
     * @param params Input that includes the file name.
     * @throws FileNotFoundException If file with given name could not be found.
     */
    public static void verifyChain(String[] params) throws FileNotFoundException, NoSuchAlgorithmException {
        if (params.length != 2) {
            throw new IllegalArgumentException("Requires exactly 1 parameter: filename.");
        }
        String filename = params[1];

        File file = new File(filename);
        if (file.exists()) {
            SimpleBlockChain sbc = (new SimpleBlockChain(false)).readChainFromFile(filename);
            if (sbc.validateChain()) {
                System.out.println("Chain valid: ");
                sbc.writeChainToStandardOutput();
            } else {
                System.out.println("Chain invalid.");
            }
        } else {
            throw new FileNotFoundException("File " + filename + " not found.");
        }
    }
}
