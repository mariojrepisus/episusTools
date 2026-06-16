#' Filtra registros por uma condição
#'
#' @param data Data frame.
#' @param condition String com a expressão de filtro (ex.: `"age > 18"`).
#' @return Data frame filtrado.
#' @export
SELECT <- function(data, condition) {
  data |> dplyr::filter(eval(parse(text = condition)))
}

