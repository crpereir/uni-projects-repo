import java.io.FileInputStream;
import java.security.InvalidAlgorithmParameterException;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.cert.*;
import java.util.*;


/**
 * Component that validates certificates and obtains public and private keys.
 */
public class KeyGetter {

    // Where certificates and keys are located.
    private final String pathPrefix = "certificates-keys/";

    private final String[] intermediates = {
            pathPrefix + "intermediates/CA1-int.cer",
            pathPrefix + "intermediates/CA2-int.cer",
    };

    private final String[] trustAnchors = {
            pathPrefix + "trust-anchors/CA1.cer",
            pathPrefix + "trust-anchors/CA2.cer",
    };

    // Obtaining certificate.
    private X509Certificate getCertificateFromFile(String pathName) throws Exception {
        CertificateFactory factory = CertificateFactory.getInstance("X.509");

        FileInputStream fis = new FileInputStream(pathName);
        X509Certificate cert = (X509Certificate) factory.generateCertificate(fis);
        fis.close();

        return cert;
    }

    // Obtain public key from certificate while validating it.
    public PublicKey getPublicKey(String certificateName) throws Exception {

        X509Certificate leafCert = getCertificateFromFile(pathPrefix + "end-entities/" + certificateName);

        // Obtaining all the intermediates certificates
        ArrayList<X509Certificate> certList = new ArrayList<>(Arrays
                .stream(intermediates)
                .map(intermediate -> {
                    try {
                        return getCertificateFromFile(intermediate);
                    } catch (Exception e) {
                        throw new RuntimeException(e);
                    }
                })
                .toList());

        // Choosing leaf certificate for validation.
        X509CertSelector certSelector = new X509CertSelector();
        certSelector.setCertificate(leafCert);

        // Adding all intermediate certificates to Certificate Store.
        CertStore certStore = CertStore.getInstance("Collection",
                new CollectionCertStoreParameters(certList));

        // Adding all trust anchors.
        List<TrustAnchor> trustAnchorList =
                Arrays
                        .stream(trustAnchors)
                        .map(trustAnchor -> {
                            try {
                                X509Certificate cert = getCertificateFromFile(trustAnchor);
                                return new TrustAnchor(cert, null);
                            } catch (Exception e) {
                                throw new RuntimeException(e);
                            }
                        })
                        .toList();

        // Turning anchors into set.
        Set<TrustAnchor> trustAnchorSet = new HashSet<>(trustAnchorList);

        // Adding all certificates to PKIXBuilder.
        PKIXBuilderParameters params = new PKIXBuilderParameters(trustAnchorSet, certSelector);
        params.addCertStore(certStore);

        params.setRevocationEnabled(false);

        PublicKey publicKey;

        try {
            // Validating leaf certificates through CertPathBuilder
            CertPathBuilder certPathBuilder = CertPathBuilder.getInstance("PKIX");
            certPathBuilder.build(params);

            publicKey = leafCert.getPublicKey();

        } catch (InvalidAlgorithmParameterException e) {
            System.out.println(Arrays.toString(e.getStackTrace()));
            throw e;
        }

        return publicKey;
    }

    // Obtaining private key.
    public PrivateKey getPrivateKey(String keystoreName, String password) throws Exception {
        KeyStore ks = KeyStore.getInstance("PKCS12");
        ks.load(
                new FileInputStream(pathPrefix + "pfx/" + keystoreName),
                password.toCharArray()
        );

        // Obtaining alias where private key is stored.
        Enumeration<String> entries = ks.aliases();

        String alias = entries.nextElement();
        return (PrivateKey) ks.getKey(alias, password.toCharArray());
    }

}
