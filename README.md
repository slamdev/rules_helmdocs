# Bazel rules for helmdocs

## Installation

Include this in your WORKSPACE file:

```starlark
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "slamdev_rules_helmdocs",
    url = "https://github.com/slamdev/rules_helmdocs/releases/download/0.0.0/slamdev_rules_helmdocs-v0.0.0.tar.gz",
    sha256 = "",
)

load("@slamdev_rules_helmdocs//helmdocs:deps.bzl", "helmdocs_register_toolchains", "rules_helmdocs_dependencies")

rules_helmdocs_dependencies()

helmdocs_register_toolchains(
    name = "helmdocs1_8_1",
    helmdocs_version = "1.8.1",
)
```

> note, in the above, replace the version and sha256 with the one indicated
> in the release notes for rules_helmdocs.
