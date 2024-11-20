import gleam/option.{type Option}
import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html
import lustre/element/svg

pub type FormAction {
  GET
  POST
}

fn form_action_to_string(action: FormAction) {
  case action {
    GET -> "get"
    POST -> "post"
  }
}

pub type SearchBar {
  Props(
    value: Option(String),
    name: Option(String),
    placeholder: Option(String),
    action: Option(String),
    method: Option(FormAction),
  )
}

pub fn search_bar(props: SearchBar) -> Element(t) {
  let value = props.value |> option.unwrap("")
  let input_name = props.name |> option.unwrap("search")
  let placeholder = props.placeholder |> option.unwrap("Search...")

  let method =
    props.method |> option.map(form_action_to_string) |> option.unwrap("get")

  let action = props.action |> option.unwrap("")

  html.form(
    [
      attribute.action(action),
      attribute.form_method(method),
      attribute.attribute("hx-boot", "true"),
    ],
    [
      html.label(
        [attribute.class("input input-bordered flex items-center gap-2")],
        [
          html.input([
            attribute.name(input_name),
            attribute.placeholder(placeholder),
            attribute.class("grow"),
            attribute.type_("text"),
            attribute.value(value),
          ]),
          html.button(
            [
              attribute.class("btn btn-ghost btn-round"),
              attribute.type_("submit"),
            ],
            [
              svg.svg(
                [
                  attribute.class("h-4 w-4 opacity-70"),
                  attribute.attribute("fill", "currentColor"),
                  attribute.attribute("viewBox", "0 0 16 16"),
                  attribute.attribute("xmlns", "http://www.w3.org/2000/svg"),
                ],
                [
                  svg.path([
                    attribute.attribute("clip-rule", "evenodd"),
                    attribute.attribute(
                      "d",
                      "M9.965 11.026a5 5 0 1 1 1.06-1.06l2.755 2.754a.75.75 0 1 1-1.06 1.06l-2.755-2.754ZM10.5 7a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0Z",
                    ),
                    attribute.attribute("fill-rule", "evenodd"),
                  ]),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  )
}
