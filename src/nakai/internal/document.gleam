import gleam/list
import gleam/option.{type Option}
import gleam/string_tree.{type StringTree}

pub const encoding = "
<meta charset=\"utf-8\" />
<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" />
"

pub type Document {
  Document(
    doctype: Option(String),
    html_attrs: StringTree,
    body_attrs: StringTree,
    head: StringTree,
    body: StringTree,
    scripts: List(StringTree),
  )
}

pub fn new() {
  Document(
    doctype: option.None,
    html_attrs: string_tree.new(),
    body_attrs: string_tree.new(),
    head: string_tree.new(),
    body: string_tree.new(),
    scripts: [],
  )
}

pub fn merge(self: Document, new: Document) -> Document {
  Document(
    // Overwrite the doctype with a newer one, unless the newer one is `None`
    doctype: option.or(new.doctype, self.doctype),
    html_attrs: string_tree.append_tree(self.html_attrs, new.html_attrs),
    body_attrs: string_tree.append_tree(self.body_attrs, new.body_attrs),
    head: string_tree.append_tree(self.head, new.head),
    body: string_tree.append_tree(self.body, new.body),
    scripts: list.append(self.scripts, new.scripts),
  )
}

pub fn concat(docs: List(Document)) -> Document {
  docs
  |> list.fold(new(), merge)
}

pub fn from_doctype(doctype: String) -> Document {
  Document(..new(), doctype: option.Some(doctype))
}

pub fn append_html_attrs(self: Document, html_attrs: StringTree) -> Document {
  Document(
    ..self,
    html_attrs: string_tree.append_tree(self.html_attrs, html_attrs),
  )
}

pub fn append_body_attrs(self: Document, body_attrs: StringTree) -> Document {
  Document(
    ..self,
    body_attrs: string_tree.append_tree(self.body_attrs, body_attrs),
  )
}

pub fn from_head(head: StringTree) -> Document {
  Document(..new(), head: head)
}

pub fn append_head(self: Document, head: StringTree) -> Document {
  Document(..self, head: string_tree.append_tree(self.head, head))
}

pub fn from_body(body: StringTree) -> Document {
  Document(..new(), body: body)
}

pub fn append_body(self: Document, body: StringTree) -> Document {
  Document(..self, body: string_tree.append_tree(self.body, body))
}

pub fn replace_body(self: Document, body: StringTree) -> Document {
  Document(..self, body: body)
}

pub fn from_script(script: StringTree) -> Document {
  Document(..new(), scripts: [script])
}

pub fn into_head(state: Document) -> Document {
  Document(
    ..state,
    head: string_tree.append_tree(state.head, state.body),
    body: string_tree.new(),
  )
}
