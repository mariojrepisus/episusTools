#' Estatísticas descritivas de uma variável numérica
#'
#' @param data Data frame.
#' @param variable Nome da coluna numérica (string).
#' @return Tibble com média, desvio padrão, mediana, mínimo e máximo.
#' @export
MEANS <- function(data, variable) {
  data |>
    dplyr::summarise(
      Mean   = mean(.data[[variable]], na.rm = TRUE),
      SD     = sd(.data[[variable]], na.rm = TRUE),
      Median = median(.data[[variable]], na.rm = TRUE),
      Min    = min(.data[[variable]], na.rm = TRUE),
      Max    = max(.data[[variable]], na.rm = TRUE)
    )
}

