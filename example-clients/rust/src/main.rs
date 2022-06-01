fn main() {
  // e.g. rustc 1.60.0 (7737e0b5c 2022-04-04)
  let rust_version = built_info::RUSTC_VERSION.splitn(3, ' ').nth(1).unwrap();

  let agent = build_agent();

  let body = agent.get("https://example.com:8888")
    .query("example-client", format!("rust/{}", rust_version).as_str())
    .call().unwrap()
    .into_string().unwrap();

  println!("Response Body: {}", body);
}

fn build_agent() -> ureq::Agent {
  let mut root_store = rustls::RootCertStore::empty();

  // see https://github.com/rustls/rustls-native-certs
  for cert in rustls_native_certs::load_native_certs().expect("could not load platform certs") {
    root_store.add(&rustls::Certificate(cert.0)).unwrap();
  }

  let tls_config = rustls::ClientConfig::builder()
    .with_safe_defaults()
    .with_root_certificates(root_store)
    .with_no_client_auth();

  let agent = ureq::AgentBuilder::new()
    .tls_connector(std::sync::Arc::new(std::sync::Arc::new(tls_config)))
    .build();

  return agent;
}

mod built_info {
  include!(concat!(env!("OUT_DIR"), "/built.rs"));
}