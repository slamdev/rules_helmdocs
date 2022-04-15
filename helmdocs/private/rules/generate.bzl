"helmdocs_generate rule"

load("@bazel_skylib//lib:paths.bzl", "paths")

_DOC = "Defines a helmdocs generate execution."

_ATTRS = {
    "badge_style": attr.string(
        doc = "Badge style to use for charts",
        default = "flat-square",
        values = ["plastic", "flat", "flat-square", "for-the-badge", "social"],
    ),
    "log_level": attr.string(
        doc = "Level of logs that should printed",
        default = "warning",
        values = ["panic", "fatal", "error", "warning", "info", "debug", "trace"],
    ),
    "sort_values_order": attr.string(
        doc = "Order in which to sort the values table",
        default = "alphanum",
        values = ["alphanum", "file"],
    ),
    "template_files": attr.label_list(
        doc = "GoTemplate files from which documentation will be generated",
        allow_files = True,
    ),
    "values_file": attr.label(
        doc = "Values file",
        allow_single_file = True,
        mandatory = True,
    ),
    "chart_file": attr.label(
        doc = "Chart.yaml file",
        allow_single_file = True,
        mandatory = True,
    ),
    "output_file": attr.string(
        doc = "Markdown file to which rendered documentation will be written",
        default = "README.md",
    ),
}

def _basename(f):
    return f.basename

def _impl(ctx):
    chart_yaml = ctx.actions.declare_file("Chart.yaml")
    ctx.actions.symlink(output = chart_yaml, target_file = ctx.file.chart_file)

    values_yaml = ctx.actions.declare_file("values.yaml")
    ctx.actions.symlink(output = values_yaml, target_file = ctx.file.values_file)

    template_files = []
    for i, f in enumerate(ctx.files.template_files):
        template_file = ctx.actions.declare_file("template-{}.gotmpl".format(i))
        ctx.actions.symlink(output = template_file, target_file = f)
        template_files.append(template_file)

    output_file = ctx.actions.declare_file(ctx.label.name + ".md")

    args = ctx.actions.args()
    args.add(ctx.attr.badge_style, format = "--badge-style=%s")
    args.add(ctx.attr.log_level, format = "--log-level=%s")
    args.add(ctx.attr.sort_values_order, format = "--sort-values-order=%s")
    args.add(output_file.basename, format = "--output-file=%s")
    args.add_all(template_files, format_each = "--template-files=%s", map_each = _basename)

    ctx.actions.run(
        inputs = [chart_yaml, values_yaml] + template_files,
        outputs = [output_file],
        arguments = [args],
        progress_message = "Generating docs for " + ctx.file.chart_file.short_path,
        tools = ctx.toolchains["@slamdev_rules_helmdocs//helmdocs:toolchain_type"].default.files,
        executable = ctx.var["HELMDOCS_BIN"],
    )

    package_build_file = "${BUILD_WORKSPACE_DIRECTORY}" + "/" + ctx.build_file_path
    workspace_output_file = paths.dirname(package_build_file) + "/" + ctx.attr.output_file

    executable = ctx.actions.declare_file(ctx.label.name + ".sh")
    ctx.actions.write(
        executable,
        "cat {} > {}".format(output_file.short_path, workspace_output_file),
        is_executable = True,
    )

    return [
        DefaultInfo(
            executable = executable,
            runfiles = ctx.runfiles(files = [output_file]),
            files = depset([output_file]),
        ),
    ]

generate = rule(
    doc = _DOC,
    implementation = _impl,
    attrs = _ATTRS,
    provides = [DefaultInfo],
    executable = True,
    toolchains = ["@slamdev_rules_helmdocs//helmdocs:toolchain_type"],
)
