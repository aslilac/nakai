//// Nakai has several built-in "builders" that can be used.
////
//// - A `document` builder (the recommend one) that renders a full HTML
////   document, does anlittle magic to dedepulicate `<head>` elements, and some
////   other things that generally fit the theme of "rendering a full, valid,
////   HTML document". It will generate a document which is configured to use
////   UTF-8 encoding, as that is the encoding for all `String`s in Gleam.
////
//// - An `inline` builder that should mostly be used for snippets, and partial
////   bits of HTML that will be inlined into a full document; hence the name.
////   It renders things much more literally. For example, if you tell it to
////   give you a `<head>` element inside a `<p>`, it will. As a benefit for the
////   trade off, it can be much faster for certain use cases.

import gleam/string_tree.{type StringTree}
import nakai/html.{type Node}
import nakai/internal/render

/// Renders a full HTML document from the given tree, into a `StringTree`.
///
/// Since `String`s in Gleam are always UTF-8 encoded, Nakai will automatically
/// set `<meta charset="utf-8" />`, as it's the only option that makes sense,
/// and will prevent incorrect rendering of glyphs if you don't set it yourself.
///
/// ## Examples
/// ```gleam
/// html.div_text([], "hello, lucy!")
/// |> nakai.to_string_tree()
/// ```
pub fn to_string_tree(tree: Node) -> StringTree {
  render.render_document(tree)
}

/// Renders a full HTML document from the given tree, into a `String`.
///
/// Since `String`s in Gleam are always UTF-8 encoded, Nakai will automatically
/// set `<meta charset="utf-8" />`, as it's the only option that makes sense,
/// and will prevent incorrect rendering of glyphs if you don't set it yourself.
///
/// ## Examples
/// ```gleam
/// html.div_text([], "hello, lucy!")
/// |> nakai.to_string()
/// ```
pub fn to_string(tree: Node) -> String {
  render.render_document(tree)
  |> string_tree.to_string()
}

/// Renders only the provided HTML, exactly as provided (disables `<head>`
/// deduplication, etc.), into a `StringTree`. Useful for generating snippets
/// instead of whole pages.
///
/// ## Examples
/// ```gleam
/// html.div_text([], "hello, lucy!")
/// |> nakai.to_inline_string_tree()
/// ```
pub fn to_inline_string_tree(tree: Node) -> StringTree {
  render.render_inline(tree)
}

/// Renders only the provided HTML, exactly as provided (disables `<head>`
/// deduplication, etc.), into a `String`. Useful for generating snippets
/// instead of whole pages.
///
/// ## Examples
/// ```gleam
/// html.div_text([], "hello, lucy!")
/// |> nakai.to_inline_string()
/// ```
pub fn to_inline_string(tree: Node) -> String {
  render.render_inline(tree)
  |> string_tree.to_string()
}
