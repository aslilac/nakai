import nakai/attr.{type Attr}

pub type Node {
  /// Can be used anywhere in the document, and will set the doctype of the
  /// document being rendered. Usually not necessary, as documents have a
  /// default of `<!DOCTYPE html>`.
  ///
  /// ## Example
  /// ```gleam
  /// html.Doctype("html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\" \"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\"")
  /// ```
  Doctype(content: String)
  /// Used for setting attributes on the root `<html>` element of the document.
  /// Children will be rendered in-place, equivalent to using
  /// `html.Fragment(children)`.
  ///
  /// ## Example
  /// ```gleam
  /// html.Html([attr.lang("en-US")], [
  ///   ...
  /// ])
  /// ```
  Html(attrs: List(Attr), children: List(Node))
  /// Used for placing content in the `<head>` of the document. Useful for
  /// elements like `<meta>`, `<title>`, `<link>`, etc.
  ///
  /// ## Example
  /// ```gleam
  /// html.Fragment([
  ///   html.Head([
  ///     html.title("List of puppies")
  ///   ]),
  ///   html.div([], [
  ///     ...
  ///   ])
  /// ])
  /// ```
  Head(children: List(Node))
  /// Used for setting attributes on the `<body>` element of the document.
  /// Children will be rendered in-place, equivalent to using
  /// `html.Fragment(children)`.
  ///
  /// ## Example
  /// ```gleam
  /// html.Body([attr.class("dark-mode")], [
  ///   ...
  /// ])
  /// ```
  Body(attrs: List(Attr), children: List(Node))
  /// An "transparent" container that will render it's children, but does not
  /// add anything itself to the document. If you've ever used `React.Fragment`
  /// or `<>` and `</>` in JSX/React, this is that.
  ///
  /// ## Example
  /// ```gleam
  /// html.ul([], [
  ///   // some puppies are hard-coded
  ///   html.li_text([], "August"),
  ///   // some are loaded from a server
  ///   html.Fragment(puppies_fetched_from_api |> list.map(html.li_text([], _)))
  /// ])
  /// // <ul>
  /// //   <li>August</li>
  /// //   <li>Dot</li>
  /// //   <li>Mody</li>
  /// //   <li>Spot</li>
  /// //   <li>Toby</li>
  /// // </ul>
  /// ```
  Fragment(children: List(Node))
  /// An HTML element. You shouldn't need to reach for this very often, but it
  /// can be a handy escape hatch if there isn't a shorthand function for the
  /// element type you need.
  ///
  /// ## Example
  /// ```gleam
  /// // bad example, pls use `html.div`
  /// html.Element("div", [], [html.Text("hello, lucy!")])
  /// ```
  Element(tag: String, attrs: List(Attr), children: List(Node))
  /// An HTML element, but that does not have any children, and should be self
  /// closing. Similarly to `Element`, you shouldn't really need this, except as
  /// an escape hatch if there isn't a shorthand function for the element type
  /// you need.
  ///
  /// ## Example
  /// ```gleam
  /// // bad example, pls use `html.link`
  /// html.LeafElement("link", [attr.rel("stylesheet"), attr.href(...)])
  /// ```
  LeafElement(tag: String, attrs: List(Attr))
  /// An HTML comment, which will be included in the document.
  ///
  /// ## Example
  /// ```gleam
  /// html.Comment("You've uncovered my secrets!")
  /// // <!-- You've uncovered my secrets! -->
  /// ```
  Comment(content: String)
  /// Some plain text to include in the document. The provided text will be
  /// escaped, to make it safe to include in the document.
  ///
  /// ## Example
  /// ```gleam
  /// html.Text("hello, lucy!")
  /// // hello, lucy!
  /// ```
  /// ```gleam
  /// // Time to trust some unvalidated user input! :^)
  /// html.div_text([], "<script>alert('pwned');</script>")
  /// // <div>&lt;script&gt;alert('pwned');&lt;/script&gt;</div>
  /// ```
  Text(content: String)
  /// The dangerous cousin of `Text`. This will render the provided text as-is,
  /// without any santization. Good for things like including some HTML you just
  /// generated from a Markdown file. Bad for things like `$_GET['search']`.
  ///
  /// ## Example
  /// ```gleam
  /// html.Text("hello, lucy!")
  /// // hello, lucy!
  /// ```
  /// ```gleam
  /// // Time to trust some unvalidated user input! :^)
  /// html.div([], [html.UnsafeInlineHtml("<script>alert('pwned');</script>")])
  /// // <div><script>alert('pwned');</script></div>
  /// // Oh no, we just got got! D:
  /// ```
  UnsafeInlineHtml(content: String)
  /// Add some JavaScript to your page! When using the document renderer,
  /// scripts will always be inserted at the end of the page, regardless of
  /// where in the document the `Script` node is, so that your content loads
  /// first. If you're using the inline renderer, the script will just be
  /// placed as is.
  ///
  /// Nakai does not do any validation of the script content! If it contains a
  /// `</script>`, weird things will happen. It's also, naturally, a script,
  /// with full access to everything, just like any other script, so **do not
  /// use any untrusted input**.
  ///
  /// ## Example
  /// ```gleam
  /// html.Script([], "alert('hello, lucy!')")
  /// ```
  /// ```gleam
  /// html.Script([attr.type_("module"), attr.src(...)], "")
  /// ```
  Script(attrs: List(Attr), content: String)
  /// Renders absolutely nothing. For when you may or may not have something to
  /// render, and need a way to say "I've got nothing."
  /// ## Example
  /// ```gleam
  /// html.div([], [
  ///   case my_cool_feature {
  ///     Enabled -> super_cool_stuff()
  ///     Disabled -> html.Nothing
  ///   }
  /// ])
  Nothing
}

/// The HTML [`<title>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/title).
/// element
pub fn title(text: String) -> Node {
  Element("title", [], [Text(text)])
}
