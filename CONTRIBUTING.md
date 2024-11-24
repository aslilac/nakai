## Development

Parts of Nakai rely on code generation so that we don't have to write and update hundreds of identical functions by hand. The Gleam compiler does not provide a way for us to generate this code automatically when running things like `gleam build`, or `gleam test`. Instead, you should run `make`, `make test`, etc.

While Nakai itself is pure Gleam, and has no dependencies, the benchmarks require having Elixir installed, and building it requires that you have Rebar3 installed.
