import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html

pub fn layout(elements: List(Element(t))) -> Element(t) {
  html.html([], [
    html.head([], [
      html.title([], "Remmi"),
      html.meta([
        attribute.name("viewport"),
        attribute.attribute("content", "width=device-width, initial-scale=1"),
      ]),
      html.link([
        attribute.rel("stylesheet"),
        attribute.href("/static/output.css"),
        attribute.src(""),
      ]),
      html.script(
        [
          attribute.attribute("crossorigin", "anonymous"),
          attribute.attribute(
            "integrity",
            "sha384-0895/pl2MU10Hqc6jd4RvrthNlDiE9U1tWmX7WRESftEDRosgxNsQG/Ze9YMRzHq",
          ),
          attribute.src("https://unpkg.com/htmx.org@2.0.3"),
        ],
        "",
      ),
    ]),
    html.body([attribute.class("bg-base-300 min-h-screen")], [
      html.div([attribute.class("min-h-screen flex flex-col bg-base-300")], [
        html.nav([attribute.class("navbar bg-base-100 justify-between")], [
          html.a(
            [
              attribute.class("btn btn-ghost text-2xl"),
              attribute.href("/dashboard"),
            ],
            [html.text("Remmi")],
          ),
        ]),
        html.main(
          [attribute.class("card p-6 flex-1 bg-base-100 m-6 flex flex-col")],
          elements,
        ),
      ]),
    ]),
  ])
}
