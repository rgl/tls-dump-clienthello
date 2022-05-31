# Notes

* The NW.js application manifest [can contains additional trust anchor certificates](https://docs.nwjs.io/en/latest/References/Manifest%20Format/#additional_trust_anchors).
  * Chromium will also [look for certificates in a directory somewhere in your machine](https://chromium.googlesource.com/chromium/src/+/master/docs/linux/cert_management.md).
* NW.js will create [a settings directory somewhere in your machine](https://docs.nwjs.io/en/latest/References/Command%20Line%20Options/#-user-data-dir).
  * For example, in Linux, the Chromium profile will be saved in `~/.config/tls-dump-clienthello-nwjs-example-client/Default/`.
  * This location can be changed with the [`--user-data-dir` command line argument](https://docs.nwjs.io/en/latest/References/Command%20Line%20Options/#-user-data-dir).

# Reference

* [NW.js Changes to Node](https://docs.nwjs.io/en/latest/References/Changes%20to%20Node/#changes-to-node)
* [NW.js Changes to DOM](https://docs.nwjs.io/en/latest/References/Changes%20to%20DOM/)
