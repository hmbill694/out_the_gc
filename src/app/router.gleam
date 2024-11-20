import app/pages/home
import app/web.{type Context}
import gleam/list
import gleam/option
import lustre/element
import wisp.{type Request, type Response}

pub fn handle_request(req: Request, ctx: Context) -> Response {
  use _req <- web.middleware(req, ctx)

  case wisp.path_segments(req) {
    // Homepage
    [] -> {
      let params = wisp.get_query(req)

      let search_query = list.key_find(params, "search") |> option.from_result

      home.home_page(home.HomePage([], search_query))
      |> element.to_document_string_builder
      |> wisp.html_response(200)
    }

    // All the empty responses
    ["internal-server-error"] -> wisp.internal_server_error()
    ["unprocessable-entity"] -> wisp.unprocessable_entity()
    ["method-not-allowed"] -> wisp.method_not_allowed([])
    ["entity-too-large"] -> wisp.entity_too_large()
    ["bad-request"] -> wisp.bad_request()
    _ -> wisp.not_found()
  }
}
