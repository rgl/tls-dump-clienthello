fn main() {
  // e.g. rustc 1.60.0 (7737e0b5c 2022-04-04)
  let rust_version = built_info::RUSTC_VERSION.splitn(3, ' ').nth(1).unwrap();

  let agent = build_agent();

  let body = agent
    .get("https://example.com:8888")
    .query("example-client", &format!("rust/{}", rust_version))
    .call().unwrap()
    .into_body()
    .read_to_string().unwrap();

  println!("Response Body: {}", body);
}

fn build_agent() -> ureq::Agent {
  return ureq::Agent::config_builder()
    .tls_config(
      ureq::tls::TlsConfig::builder()
        .root_certs(ureq::tls::RootCerts::PlatformVerifier)
        .build(),
    )
    .build()
    .new_agent();
}

mod built_info {
  include!(concat!(env!("OUT_DIR"), "/built.rs"));
}