defmodule Bloomfilter.Mixfile do
  use Mix.Project

  def project do
    [
      app: :bloomfilter,
      version: "0.1.0",
      elixir: "~> 1.4.4",
      start_permanent: Mix.env == :prod,
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
      {:bitmap, ">= 1.0.0"}

      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
