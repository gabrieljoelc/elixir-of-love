# Import all plugins from `rel/plugins`
# They can then be used by adding `plugin MyPlugin` to
# either an environment, or release definition, where
# `MyPlugin` is the name of the plugin module.
Path.join(["rel", "plugins", "*.exs"])
|> Path.wildcard()
|> Enum.map(&Code.eval_file(&1))

use Mix.Releases.Config,
    # This sets the default release built by `mix release`
    default_release: :default,
    # This sets the default environment used by `mix release`
    default_environment: Mix.env()

# For a full list of config options for both releases
# and environments, visit https://hexdocs.pm/distillery/configuration.html

# You may define one or more environments in this file,
# an environment's settings will override those of a release
# when building in that environment, this combination of release
# and environment configuration is called a profile

environment :dev do
  set dev_mode: true
  set include_erts: false
  set cookie: :"[56}&HqR`YtT;0e$;7<Q}u>O5,5wNrUw=ec8T`b|B`}LQBhLOp5>muJSS.y[|Qdd"
end

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"Pq`Vjz|0!TxK(H(40`Hj29_t%WOa3Rj_ziqN2l;{BswX,dR2S$</3Xv9PVD5ZA}e"
end

# You may define one or more releases in this file.
# If you have not set a default release, or selected one
# when running `mix release`, the first release in the file
# will be used by default

release :hello_world do
  set version: current_version(:hello_world)
  set applications: [
    :runtime_tools
  ]
end

