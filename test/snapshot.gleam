import envoy as env
import gleam/string_builder.{type StringBuilder}
import gleeunit/should
import simplifile as file

pub fn match(result: StringBuilder, snapshot_file: String) {
  string_builder.to_string(result)
  |> match_string(snapshot_file)
}

pub fn match_string(result: String, snapshot_file: String) {
  case env.get("SNAPSHOT") {
    // Check against existing snapshots!
    Error(Nil) | Ok("0") | Ok("false") ->
      should.equal(Ok(result), file.read(snapshot_file))
    // Update all of the result snapshots
    _ -> {
      let _ = file.write(snapshot_file, result)
      Nil
    }
  }
}
