import javax.net.ssl.*;
import java.io.*;
import java.security.*;
import java.security.cert.*;

public class App {
    public static void main(String[] args) throws IOException, CertificateException, NoSuchAlgorithmException, KeyStoreException, KeyManagementException {
        
        TrustManagerFactory tmf = TrustManagerFactory.getInstance(TrustManagerFactory.getDefaultAlgorithm());
        KeyStore ks = KeyStore.getInstance("JKS");
        ks.load(new FileInputStream("src/CA1.jks"), "changeit".toCharArray());
        tmf.init(ks);

        SSLContext sc = SSLContext.getInstance("TLSv1.2");
        sc.init(null, tmf.getTrustManagers(), null);
        SSLSocketFactory sslFactory = sc.getSocketFactory();

        // establish connection
        SSLSocket client = (SSLSocket) sslFactory.createSocket("www.secure-server.edu", 4433);
        try (client) {
            client.startHandshake();
            SSLSession session = client.getSession();
            System.out.println("Cipher suite: " + session.getCipherSuite());
            System.out.println("Protocol version: " + session.getProtocol());
            System.out.println(session.getPeerCertificates()[0]);
        }
    }
}
