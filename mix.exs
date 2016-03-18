defmodule Carl.Mixfile do
  use Mix.Project

  def project do
    [app: :carl,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps
    ]
  end

  def application do
    [mod: {Carl, []},
     applications: [:cowboy, :ranch],
    ]
  end

  defp deps do
    [ {:cowboy, "1.0.0"},
      {:exrm, "~> 1.0.2"},
    ]
  end
end
