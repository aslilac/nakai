import gleam/list
import nakai
import nakai/attr
import nakai/html
import snapshot

type Puppy {
  Puppy(name: String, good: Bool, soft: Bool)
}

const puppies = [
  Puppy("August", good: True, soft: True),
  Puppy("Dot", good: True, soft: True),
  Puppy("Mady", good: True, soft: True),
  Puppy("Spot", good: True, soft: True),
  Puppy("Toby", good: True, soft: True),
]

fn puppy_description(puppy: Puppy) {
  html.li([], [html.Text(puppy.name), html.Text(" is a good and soft puppy")])
}

fn puppies_list() {
  html.ul([], list.map(puppies, puppy_description))
}

pub fn app() {
  html.Html([attr.lang("en-US")], [
    html.Head([html.title("List of puppies!")]),
    html.div([], [puppies_list()]),
  ])
}

pub fn app_test() {
  app()
  |> nakai.to_string_tree()
  |> snapshot.match("./test/testdata/integration/puppies.html")
}
