// Not actually a test, but having this file in test/ prevents it from being published :^)

import gleam/dynamic.{type Dynamic}
import gleam/json
import gleam/list
import gleam/result
import gleam/string
import simplifile

const html_prefix = "





// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * THIS FILE IS GENERATED. DO NOT EDIT IT.                                             *
// * You're probably looking for ./codegen/html_prelude.gleam, or ./codegen/html.json.   *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *





"

type ElementDescription {
  Element(name: String, leaf: Bool)
}

fn element_decoder(
  value: Dynamic,
) -> Result(ElementDescription, dynamic.DecodeErrors) {
  dynamic.decode2(
    Element,
    dynamic.field("name", of: dynamic.string),
    dynamic.field("leaf", of: dynamic.bool),
  )(value)
}

fn codegen_element(element: ElementDescription) -> String {
  case element {
    Element(name, leaf) if leaf == False ->
      "
/// The [HTML `<" <> name <> ">` element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/" <> name <> ")
pub fn " <> name <> "(attrs: List(Attr(a)), children: List(Node(a))) -> Node(a) {
  Element(tag: \"" <> name <> "\", attrs: attrs, children: children)
}

/// Shorthand for `html." <> name <> "(attrs, children: [html.Text(text)])`
pub fn " <> name <> "_text(attrs: List(Attr(a)), text: String) -> Node(a) {
  Element(tag: \"" <> name <> "\", attrs: attrs, children: [Text(text)])
}
"
    Element(name, leaf) if leaf == True ->
      "
/// The [HTML `<" <> name <> " />` element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/" <> name <> ")
pub fn " <> name <> "(attrs: List(Attr(a))) -> Node(a) {
  LeafElement(tag: \"" <> name <> "\", attrs: attrs)
}
"
    _ -> panic
  }
}

fn generate_nakai_html() {
  let assert Ok(html_prelude) = simplifile.read("./codegen/html_prelude.gleam")
  let assert Ok(html_json) = simplifile.read("./codegen/html.json")
  let assert Ok(html) =
    json.decode(from: html_json, using: dynamic.list(element_decoder))

  // Generate code from the defined attributes
  let code =
    html
    |> list.map(codegen_element)
    |> string.concat()

  // Produce nakai/html
  string.concat([html_prefix, html_prelude, code])
  |> simplifile.write("./src/nakai/html.gleam", _)
}

const attrs_prefix = "





// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * THIS FILE IS GENERATED. DO NOT EDIT IT.                                             *
// * You're probably looking for ./codegen/attrs_prelude.gleam, or ./codegen/attrs.json. *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *





"

type AttrDescription {
  Attr(name: String)
  ConstAttr(name: String, value: String)
}

fn attr_decoder(value: Dynamic) -> Result(AttrDescription, dynamic.DecodeErrors) {
  let attr_decoder =
    dynamic.decode1(Attr, dynamic.field("name", of: dynamic.string))
  let constattr_decoder =
    dynamic.decode2(
      ConstAttr,
      dynamic.field("name", of: dynamic.string),
      dynamic.field("value", of: dynamic.string),
    )

  constattr_decoder(value)
  |> result.lazy_or(fn() { attr_decoder(value) })
}

fn codegen_attr(attr: AttrDescription) -> String {
  let name = attr.name
  let func_name = case name {
    "type" -> "type_"
    name ->
      name
      |> string.replace("-", "_")
  }

  case attr {
    Attr(_) ->
      "
pub fn " <> func_name <> "(value: String) -> Attr(a) {
  Attr(name: \"" <> name <> "\", value: value)
}
"
    ConstAttr(_, value) ->
      "
pub fn " <> func_name <> "() -> Attr(a) {
  Attr(name: \"" <> name <> "\", value: \"" <> value <> "\")
}
"
  }
}

fn generate_nakai_html_attrs() {
  let assert Ok(attrs_prelude) =
    simplifile.read("./codegen/attrs_prelude.gleam")
  let assert Ok(attrs_json) = simplifile.read("./codegen/attrs.json")
  let assert Ok(attrs) =
    json.decode(from: attrs_json, using: dynamic.list(attr_decoder))

  // Generate code from the defined attributes
  let code =
    attrs
    |> list.map(codegen_attr)
    |> string.concat()

  // Produce nakai/html/attrs
  string.concat([attrs_prefix, attrs_prelude, code])
  |> simplifile.write("./src/nakai/html/attrs.gleam", _)
}

pub fn main() {
  let assert Ok(_) = generate_nakai_html()
  let assert Ok(_) = generate_nakai_html_attrs()
}
