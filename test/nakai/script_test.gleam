import nakai
import nakai/html
import snapshot

const example_script = "let a = 4 > 3; let b = () => true; if (a && b()) { alert('hello!'); }"

pub fn scripts_test() {
  html.Script([], example_script)
  |> nakai.to_string_tree()
  |> snapshot.match("./test/testdata/scripts.html")
}

pub fn scripts_inline_test() {
  html.Script([], example_script)
  |> nakai.to_inline_string_tree()
  |> snapshot.match("./test/testdata/scripts_inline.html")
}

pub fn evil_scripts_test() {
  html.Script([], example_script <> "</script>")
  |> nakai.to_string_tree()
  |> snapshot.match("./test/testdata/evil_scripts.html")
}

pub fn evil_scripts_inline_test() {
  html.Script([], example_script <> "</script>")
  |> nakai.to_inline_string_tree()
  |> snapshot.match("./test/testdata/evil_scripts_inline.html")
}
