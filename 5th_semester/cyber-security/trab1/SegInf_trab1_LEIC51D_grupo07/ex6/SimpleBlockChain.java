
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Objects;
import java.io.*;

/*+
* Block chain in the form of a list of blocks.
 */
public class SimpleBlockChain {

    // List representing the chain.
    private final ArrayList<Block> blockchain = new ArrayList<>();

    /**
     * Generates a new chain.
     * @param generateGenesis if genesis block is to be created.
     */
    public SimpleBlockChain(boolean generateGenesis) {
        if (generateGenesis) {
            Block genesis = new Block(-1, -1, -1.0F, "0x0");
            blockchain.add(genesis);
        }
    }

    /**
     * Reading and generating the blockchain from file.
     * @param filename name of file where chain is stored.
     * @return the blockchain read.
     * @throws FileNotFoundException if file indicated does not exist.
     */
    public final SimpleBlockChain readChainFromFile(String filename) throws FileNotFoundException {
        try {
            BufferedReader reader = new BufferedReader(new FileReader(filename));
            String line = reader.readLine();
            while (line != null) {
                Block newBlock = new Block(line);
                blockchain.add(newBlock);
                line = reader.readLine();
            }
            reader.close();
            return this;
        } catch (IOException e) {
            throw new FileNotFoundException("File " + filename + " not found.");
        }
    }

    /**
     * Storing the chain into a file.
     * @param filename name of file where chain will be stored.
     */
    public final void storeChainInFile(String filename) throws Exception {
            FileWriter writer = new FileWriter(filename);
            for (Block block : blockchain) {
                writer.write(block.toString());
                writer.write("\n");
            }
            writer.flush();
            writer.close();
    }

    public final void addToChain(Block block) {
        blockchain.add(block);
    }

    public final Block getLastBlock() {
        return blockchain.get(blockchain.size() - 1);
    }

    /**
     * Validates the chain through hash calculation.
     * @return true if valid, false if not.
     */
    public final boolean validateChain() throws NoSuchAlgorithmException {
        int idx = blockchain.size() - 1;
        while (idx > 0) {
            Block currentBlock = blockchain.get(idx);
            Block previewBlock = blockchain.get(idx - 1);
            String previewBlockHash = HashUtils.buildHash(previewBlock);
            if (!Objects.equals(currentBlock.hash, previewBlockHash)) return false;
            idx--;
        }
        return true;
    }

    public final void writeChainToStandardOutput() {
        for (Block block : blockchain) {
            System.out.println("  " + block.toString());
        }
    }
}
