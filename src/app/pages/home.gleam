import app/components/layout.{layout}
import app/components/search_bar.{search_bar}
import birl.{type Time}
import gleam/option
import lustre/attribute
import lustre/element.{type Element, text}
import lustre/element/html.{div, h2}

pub type RecipeType {
  Recipe(id: String, title: String, author: String, created_on: Time)
}

pub type HomePage {
  HomePage(recipes: List(RecipeType), search: option.Option(String))
}

pub fn home_page(props: HomePage) -> Element(t) {
  let content = case props.recipes {
    [] -> "No recipes"
    _ -> "recipes found"
  }

  [
    div([], [
      div(
        [
          attribute.class(
            "flex flex-col md:flex-row md:justify-between md:items-center w-full",
          ),
        ],
        [
          html.h2([attribute.class("text-lg bold")], [text("Your recipes")]),
          search_bar(search_bar.Props(
            props.search,
            option.None,
            option.None,
            option.None,
            option.None,
          )),
        ],
      ),
      text(content),
    ]),
  ]
  |> layout
}
