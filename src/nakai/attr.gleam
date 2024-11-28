





// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// * THIS FILE IS GENERATED. DO NOT EDIT IT.                                             *
// * You're probably looking for ./codegen/attr_prelude.gleam, or ./codegen/attr.json.   *
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *





pub type Attr {
  Attr(name: String, value: String)
}

pub fn data(name: String, value: String) -> Attr {
  Attr(name: "data-" <> name, value: value)
}

pub fn accept(value: String) -> Attr {
  Attr(name: "accept", value: value)
}

pub fn accept_charset(value: String) -> Attr {
  Attr(name: "accept-charset", value: value)
}

pub fn action(value: String) -> Attr {
  Attr(name: "action", value: value)
}

pub fn alt(value: String) -> Attr {
  Attr(name: "alt", value: value)
}

pub fn aria_checked(value: String) -> Attr {
  Attr(name: "aria-checked", value: value)
}

pub fn aria_current(value: String) -> Attr {
  Attr(name: "aria-current", value: value)
}

pub fn aria_disabled() -> Attr {
  Attr(name: "aria-disabled", value: "true")
}

pub fn aria_hidden() -> Attr {
  Attr(name: "aria-hidden", value: "true")
}

pub fn aria_invalid() -> Attr {
  Attr(name: "aria-invalid", value: "true")
}

pub fn aria_label(value: String) -> Attr {
  Attr(name: "aria-label", value: value)
}

pub fn aria_labelledby(value: String) -> Attr {
  Attr(name: "aria-labelledby", value: value)
}

pub fn aria_placeholder(value: String) -> Attr {
  Attr(name: "aria-placeholder", value: value)
}

pub fn aria_readonly(value: String) -> Attr {
  Attr(name: "aria-readonly", value: value)
}

pub fn aria_required(value: String) -> Attr {
  Attr(name: "aria-required", value: value)
}

pub fn as_(value: String) -> Attr {
  Attr(name: "as", value: value)
}

pub fn async() -> Attr {
  Attr(name: "async", value: "true")
}

pub fn autocapitalize(value: String) -> Attr {
  Attr(name: "autocapitalize", value: value)
}

pub fn autocomplete(value: String) -> Attr {
  Attr(name: "autocomplete", value: value)
}

pub fn autofocus() -> Attr {
  Attr(name: "autofocus", value: "true")
}

pub fn autoplay() -> Attr {
  Attr(name: "autoplay", value: "true")
}

pub fn capture(value: String) -> Attr {
  Attr(name: "capture", value: value)
}

pub fn charset(value: String) -> Attr {
  Attr(name: "charset", value: value)
}

pub fn checked() -> Attr {
  Attr(name: "checked", value: "true")
}

pub fn cite(value: String) -> Attr {
  Attr(name: "cite", value: value)
}

pub fn class(value: String) -> Attr {
  Attr(name: "class", value: value)
}

pub fn content(value: String) -> Attr {
  Attr(name: "content", value: value)
}

pub fn contenteditable() -> Attr {
  Attr(name: "contenteditable", value: "true")
}

pub fn crossorigin(value: String) -> Attr {
  Attr(name: "crossorigin", value: value)
}

pub fn defer() -> Attr {
  Attr(name: "defer", value: "true")
}

pub fn disabled() -> Attr {
  Attr(name: "disabled", value: "true")
}

pub fn draggable() -> Attr {
  Attr(name: "draggable", value: "true")
}

pub fn enctype(value: String) -> Attr {
  Attr(name: "enctype", value: value)
}

pub fn for(value: String) -> Attr {
  Attr(name: "for", value: value)
}

pub fn formaction(value: String) -> Attr {
  Attr(name: "formaction", value: value)
}

pub fn height(value: String) -> Attr {
  Attr(name: "height", value: value)
}

pub fn href(value: String) -> Attr {
  Attr(name: "href", value: value)
}

pub fn http_equiv(value: String) -> Attr {
  Attr(name: "http-equiv", value: value)
}

pub fn id(value: String) -> Attr {
  Attr(name: "id", value: value)
}

pub fn integrity(value: String) -> Attr {
  Attr(name: "integrity", value: value)
}

pub fn lang(value: String) -> Attr {
  Attr(name: "lang", value: value)
}

pub fn loop() -> Attr {
  Attr(name: "loop", value: "true")
}

pub fn maxlength(value: String) -> Attr {
  Attr(name: "maxlength", value: value)
}

pub fn method(value: String) -> Attr {
  Attr(name: "method", value: value)
}

pub fn minlength(value: String) -> Attr {
  Attr(name: "minlength", value: value)
}

pub fn name(value: String) -> Attr {
  Attr(name: "name", value: value)
}

pub fn placeholder(value: String) -> Attr {
  Attr(name: "placeholder", value: value)
}

pub fn preload() -> Attr {
  Attr(name: "preload", value: "true")
}

pub fn property(value: String) -> Attr {
  Attr(name: "property", value: value)
}

pub fn readonly() -> Attr {
  Attr(name: "readonly", value: "true")
}

pub fn rel(value: String) -> Attr {
  Attr(name: "rel", value: value)
}

pub fn required(value: String) -> Attr {
  Attr(name: "required", value: value)
}

pub fn role(value: String) -> Attr {
  Attr(name: "role", value: value)
}

pub fn selected() -> Attr {
  Attr(name: "selected", value: "true")
}

pub fn src(value: String) -> Attr {
  Attr(name: "src", value: value)
}

pub fn style(value: String) -> Attr {
  Attr(name: "style", value: value)
}

pub fn tabindex(value: String) -> Attr {
  Attr(name: "tabindex", value: value)
}

pub fn target(value: String) -> Attr {
  Attr(name: "target", value: value)
}

pub fn title(value: String) -> Attr {
  Attr(name: "title", value: value)
}

pub fn type_(value: String) -> Attr {
  Attr(name: "type", value: value)
}

pub fn value(value: String) -> Attr {
  Attr(name: "value", value: value)
}

pub fn width(value: String) -> Attr {
  Attr(name: "width", value: value)
}
