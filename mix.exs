defmodule Carl.Mixfile do
  use Mix.Project

  def project do
    [app: :carl,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     dialyzer: [
       plt_add_deps: true,
       paths: [
         "_build/dev/lib/jsex/ebin"
         # "_build/dev/lib/jsx/ebin"
       ]
     ]
    ]
  end

  def application do
    [mod: {Carl, []},
     applications: [:cowboy, :ranch],
    ]
  end

  defp deps do
    [ {:cowboy, "1.0.0"},
      {:jsex, "~> 2.0.0"},
      {:dialyxir, "~> 0.3", only: [:dev]}
    ]
  end
end
