![Nakai](https://cdn.mckayla.cloud/-/2d8051c1ce2f4fbd91eaf07df5661e25/Nakai-Banner.svg)

## Getting started

```sh
gleam add nakai
```

```gleam
import nakai
import nakai/html.{type Node}
import nakai/attr.{type Attr}

pub fn header(attrs: List(Attr), text: String) -> Node {
  let attrs = [attr.class("text-xl weight-400"), ..attrs]
  html.h1_text(attrs, text)
}

pub fn app() -> String {
  header([], "Hello, from Nakai!")
  |> nakai.to_string()
}
```
