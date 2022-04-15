<!-- Generated with Stardoc: http://skydoc.bazel.build -->

Declare runtime dependencies

These are needed for local dev, and users must install them as well.
See https://docs.bazel.build/versions/main/skylark/deploying.html#dependencies


<a id="#helmdocs_repositories"></a>

## helmdocs_repositories

<pre>
helmdocs_repositories(<a href="#helmdocs_repositories-name">name</a>, <a href="#helmdocs_repositories-helmdocs_version">helmdocs_version</a>, <a href="#helmdocs_repositories-platform">platform</a>, <a href="#helmdocs_repositories-repo_mapping">repo_mapping</a>)
</pre>

TODO

**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="helmdocs_repositories-name"></a>name |  A unique name for this repository.   | <a href="https://bazel.build/docs/build-ref.html#name">Name</a> | required |  |
| <a id="helmdocs_repositories-helmdocs_version"></a>helmdocs_version |  -   | String | required |  |
| <a id="helmdocs_repositories-platform"></a>platform |  -   | String | required |  |
| <a id="helmdocs_repositories-repo_mapping"></a>repo_mapping |  A dictionary from local repository name to global repository name. This allows controls over workspace dependency resolution for dependencies of this repository.&lt;p&gt;For example, an entry <code>"@foo": "@bar"</code> declares that, for any time this repository depends on <code>@foo</code> (such as a dependency on <code>@foo//some:target</code>, it should actually resolve that dependency within globally-declared <code>@bar</code> (<code>@bar//some:target</code>).   | <a href="https://bazel.build/docs/skylark/lib/dict.html">Dictionary: String -> String</a> | required |  |


<a id="#helmdocs_register_toolchains"></a>

## helmdocs_register_toolchains

<pre>
helmdocs_register_toolchains(<a href="#helmdocs_register_toolchains-name">name</a>, <a href="#helmdocs_register_toolchains-kwargs">kwargs</a>)
</pre>

Convenience macro for users which does typical setup.

- create a repository for each built-in platform like "helmdocs_linux_amd64" -
  this repository is lazily fetched when helmdocs is needed for that platform.
- TODO: create a convenience repository for the host platform like "helmdocs_host"
- create a repository exposing toolchains for each platform like "helmdocs_platforms"
- register a toolchain pointing at each platform
Users can avoid this macro and do these steps themselves, if they want more control.


**PARAMETERS**


| Name  | Description | Default Value |
| :------------- | :------------- | :------------- |
| <a id="helmdocs_register_toolchains-name"></a>name |  base name for all created repos, like "helmdocs1_8_1"   |  none |
| <a id="helmdocs_register_toolchains-kwargs"></a>kwargs |  passed to each helmdocs_repositories call   |  none |


<a id="#rules_helmdocs_dependencies"></a>

## rules_helmdocs_dependencies

<pre>
rules_helmdocs_dependencies()
</pre>





