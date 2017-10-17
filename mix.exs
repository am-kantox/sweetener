defmodule Sweetener.MixProject do
  use Mix.Project

  @app :sweetener

  def project do
    [
      app: @app,
      version: "0.1.0",
      elixir: "~> 1.4",
      start_permanent: Mix.env == :prod,
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 0.8", only: [:dev, :test]},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.11", only: :dev}
    ]
  end

  defp description do
    """
    Set of nifty functions I missed in Elixir core.

    Currently it provides: [tap]. More coming soon.
    """
  end

  defp package do
    [
     name: @app,
     files: ~w|lib mix.exs README.md|,
     maintainers: ["Aleksei Matiushkin"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/am-kantox/#{@app}",
              "Docs" => "https://hexdocs.pm/#{@app}"}]
  end
end
