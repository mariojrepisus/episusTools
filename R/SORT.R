#' Ordena o data frame por uma variável
#'
#' @param data Data frame.
#' @param variable Nome da coluna para ordenar (string).
#' @return Data frame ordenado.
#' @export
SORT <- function(data, variable) {
  data |> dplyr::arrange(.data[[variable]])
}

