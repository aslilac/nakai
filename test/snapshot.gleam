import simplifile
import gleam/erlang/os
import gleam/string_builder.{type StringBuilder}
import gleeunit/should

pub fn match(result: StringBuilder, snapshot_file: String) {
  string_builder.to_string(result)
  |> match_string(snapshot_file)
}

pub fn match_string(result: String, snapshot_file: String) {
  case os.get_env("SNAPSHOT") {
    // Check against existing snapshots!
    Error(Nil) | Ok("0") | Ok("false") ->
      should.equal(Ok(result), simplifile.read(snapshot_file))
    // Update all of the result snapshots
    _ -> {
      let _ = simplifile.write(snapshot_file, result)
      Nil
    }
  }
}
