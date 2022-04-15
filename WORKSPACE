# Declare the local Bazel workspace.
# This is *not* included in the published distribution.
workspace(
    name = "slamdev_rules_helmdocs",
)

load(":internal_deps.bzl", "rules_helmdocs_internal_deps")

# Fetch deps needed only locally for development
rules_helmdocs_internal_deps()

load("//helmdocs:repositories.bzl", "helmdocs_register_toolchains", "rules_helmdocs_dependencies")

# Fetch our "runtime" dependencies which users need as well
rules_helmdocs_dependencies()

helmdocs_register_toolchains(
    name = "helmdocs1_8_1",
    helmdocs_version = "1.8.1",
)

############################################
# Gazelle, for generating bzl_library targets
load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.17.2")

gazelle_dependencies()
