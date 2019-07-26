// also see https://github.com/rgl/test-ssl-connection

package net.example;

import java.io.BufferedInputStream;
import java.io.InputStream;
import java.net.URL;
import java.security.cert.Certificate;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Example {
    final static Logger log = LogManager.getLogger(Example.class);

    public static void main(String[] args) throws Exception {
        SSLContext context = SSLContext.getInstance("TLS");
        context.init(
            null,
            new TrustManager[] {
                new X509TrustManager() {
                    @Override
                    public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
                    }

                    @Override
                    public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
                        log.info("checkServerTrusted authType={}", authType);
                        dumpCertificates("checkServerTrusted", chain);
                    }

                    @Override
                    public X509Certificate[] getAcceptedIssuers() {
                        return new X509Certificate[0];
                    }
                }
            },
            null
        );

        check(context.getSocketFactory(), "https://example.com:8888");
    }

    private static void dumpCertificates(String prefix, Certificate[] certificates) {
        if (certificates == null || certificates.length == 0) {
            log.info("{} peer didn't sent any certificate!?", prefix);
        } else {
            for (int i = 0; i < certificates.length; ++i) {
                Certificate certificate = certificates[i];

                log.info("{} certificate #{} type={} class={}", prefix, i, certificate.getType(),
                        certificate.getClass());

                if (certificate instanceof X509Certificate) {
                    X509Certificate x509 = (X509Certificate) certificate;

                    log.info("{} certificate #{} subject={} issuer={} publicKey={}", prefix, i,
                            x509.getSubjectX500Principal(), x509.getIssuerX500Principal(), x509.getPublicKey());
                }
            }
        }
    }

    private static boolean check(SSLSocketFactory socketFactory, String checkUrl) throws Exception {
        URL url = new URL(checkUrl);

        log.info("connecting to {}...", url);
        HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
        log.info("connected");

        try {
            if (socketFactory != null) {
                connection.setSSLSocketFactory(socketFactory);
            }

            connection.setInstanceFollowRedirects(false);

            log.info("getting input stream...");

            InputStream in = new BufferedInputStream(connection.getInputStream());
            try {
                log.info("got input stream");
                log.info("response {} {}", connection.getResponseCode(), connection.getResponseMessage());
                log.info("Cipher Suite {}", connection.getCipherSuite());

                dumpCertificates(url.toString(), connection.getServerCertificates());
            } finally {
                in.close();
            }

            return true;
        } finally {
            connection.disconnect();
        }
    }
}
