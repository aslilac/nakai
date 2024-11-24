import gleeunit/should
import nakai
import nakai/attr
import nakai/html
import snapshot

pub fn empty_test() {
  html.Nothing
  |> nakai.to_string_tree()
  |> snapshot.match("./test/testdata/empty.html")
}

pub fn head_test() {
  html.Head([html.title("Hi!")])
  |> nakai.to_string_tree()
  |> snapshot.match("./test/testdata/head_1.html")

  html.div([], [html.Head([html.title("Hi!")])])
  |> nakai.to_string_tree()
  |> snapshot.match("./test/testdata/head_2.html")

  html.Head([html.Head([html.Head([html.title("Hi!")])])])
  |> nakai.to_string_tree()
  |> snapshot.match("./test/testdata/head_3.html")
}

pub fn attrs_on_html_test() {
  html.Html([attr.lang("en-US")], [html.p_text([], "Hello!")])
  |> nakai.to_string_tree()
  |> snapshot.match("./test/testdata/attrs_on_html.html")
}

pub fn attrs_on_body_test() {
  html.Body([attr.class("dark-mode")], [html.p_text([], "Hello!")])
  |> nakai.to_string_tree()
  |> snapshot.match("./test/testdata/attrs_on_body.html")
}

const xhtml11 = "html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\" \"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\""

pub fn doctype_test() {
  html.Fragment([html.Doctype(xhtml11), html.div_text([], "Hi friend!")])
  |> nakai.to_string_tree()
  |> snapshot.match("./test/testdata/doctype.html")
}

pub fn text_sanitization_test() {
  html.div_text([], "<script>alert('pwned');</script>")
  |> nakai.to_string_tree()
  |> snapshot.match("./test/testdata/text_sanitization.html")
}

pub fn attr_sanitization_test() {
  html.div([attr.id("\"><script>alert('pwned');</script>")], [])
  |> nakai.to_string_tree()
  |> snapshot.match("./test/testdata/attr_sanitization_1.html")
}

pub fn attributes_that_are_gleam_keywords_test() {
  html.input([attr.type_("text")])
  |> nakai.to_string_tree()
  |> snapshot.match("./test/testdata/attributes_that_are_gleam_keywords.html")
}

pub fn attributes_with_hyphens_test() {
  html.Head([
    html.meta([
      attr.http_equiv("content-security-policy"),
      attr.content("default-src 'self';"),
    ]),
  ])
  |> nakai.to_string_tree()
  |> snapshot.match("./test/testdata/attributes_with_hyphens.html")
}

pub fn comment_sanitization_test() {
  html.Comment("--><script>alert('pwned');</script>")
  |> nakai.to_string_tree()
  |> snapshot.match("./test/testdata/comment_sanitization.html")
}

pub fn inline_test() {
  html.Nothing
  |> nakai.to_inline_string()
  |> should.equal("")

  html.p_text([], "hello, computer!")
  |> nakai.to_inline_string()
  |> should.equal("<p>hello, computer!</p>")

  html.div([], [
    html.h1_text([], "Bandit"),
    html.p_text([], "He's a really good boy!"),
  ])
  |> nakai.to_inline_string()
  |> should.equal("<div><h1>Bandit</h1><p>He's a really good boy!</p></div>")

  html.div([], [
    html.Body([attr.class("lol")], [
      html.Html([attr.lang("en-US")], [
        html.p_text([], "This is obviously a very silly thing to do"),
      ]),
    ]),
  ])
  |> nakai.to_inline_string
  |> should.equal(
    "<div><body class=\"lol\"><html lang=\"en-US\"><p>This is obviously a very silly thing to do</p></html></body></div>",
  )
}
