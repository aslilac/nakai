import nakai
import nakai/attr
import nakai/html
import snapshot

pub fn navigation() {
  html.nav([], [
    html.ul([], [
      html.li([], [html.a_text([attr.href("/home")], "home")]),
      html.li([], [html.a_text([attr.href("/about")], "about")]),
    ]),
  ])
}

pub fn app() {
  html.div([], [
    html.Html([attr.lang("en-US")], [navigation()]),
    html.Head([html.title("hello, computer!")]),
    html.Body([attr.class("post")], []),
    html.h1_text([], "hello, computer!"),
    html.p_text([], "this is a paragraph"),
  ])
}

pub fn app_test() {
  app()
  |> nakai.to_string_tree()
  |> snapshot.match("./test/testdata/integration/info.html")
}
