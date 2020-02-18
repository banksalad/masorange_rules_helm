load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load(":yq_deps.bzl", "yq_deps")

def repositories():
  """Download dependencies of container rules."""
  excludes = native.existing_rules().keys()

  native.register_toolchains(
    # Register the default docker toolchain that expects the 'docker'
    # executable to be in the PATH
    "@com_github_masmovil_bazel_rules//toolchains/yq:yq_linux_toolchain",
    "@com_github_masmovil_bazel_rules//toolchains/yq:yq_osx_toolchain",
    "@com_github_masmovil_bazel_rules//toolchains/yq:yq_windows_toolchain",
  )

  if "io_bazel_rules_docker" not in excludes:
    http_archive(
      name = "io_bazel_rules_docker",
      sha256 = "df13123c44b4a4ff2c2f337b906763879d94871d16411bf82dcfeba892b58607",
      strip_prefix = "rules_docker-0.13.0",
      urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.13.0/rules_docker-v0.13.0.tar.gz"],
    )

  yq_deps()