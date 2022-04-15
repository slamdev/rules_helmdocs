<!-- Generated with Stardoc: http://skydoc.bazel.build -->

# Helmdocs Rules

<a id="#helmdocs_generate"></a>

## helmdocs_generate

<pre>
helmdocs_generate(<a href="#helmdocs_generate-name">name</a>, <a href="#helmdocs_generate-badge_style">badge_style</a>, <a href="#helmdocs_generate-chart_file">chart_file</a>, <a href="#helmdocs_generate-log_level">log_level</a>, <a href="#helmdocs_generate-output_file">output_file</a>, <a href="#helmdocs_generate-sort_values_order">sort_values_order</a>,
                  <a href="#helmdocs_generate-template_files">template_files</a>, <a href="#helmdocs_generate-values_file">values_file</a>)
</pre>

Defines a helmdocs generate execution.

**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="helmdocs_generate-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/docs/build-ref.html#name">Name</a> | required |  |
| <a id="helmdocs_generate-badge_style"></a>badge_style |  Badge style to use for charts   | String | optional | "flat-square" |
| <a id="helmdocs_generate-chart_file"></a>chart_file |  Chart.yaml file   | <a href="https://bazel.build/docs/build-ref.html#labels">Label</a> | required |  |
| <a id="helmdocs_generate-log_level"></a>log_level |  Level of logs that should printed   | String | optional | "warning" |
| <a id="helmdocs_generate-output_file"></a>output_file |  Markdown file to which rendered documentation will be written   | String | optional | "README.md" |
| <a id="helmdocs_generate-sort_values_order"></a>sort_values_order |  Order in which to sort the values table   | String | optional | "alphanum" |
| <a id="helmdocs_generate-template_files"></a>template_files |  GoTemplate files from which documentation will be generated   | <a href="https://bazel.build/docs/build-ref.html#labels">List of labels</a> | optional | [] |
| <a id="helmdocs_generate-values_file"></a>values_file |  Values file   | <a href="https://bazel.build/docs/build-ref.html#labels">Label</a> | required |  |


