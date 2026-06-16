#' Gráfico de barras de uma variável
#'
#' @param data Data frame.
#' @param variable Nome da coluna (string).
#' @return Objeto ggplot2.
#' @export
PLOT <- function(data, variable) {
  ggplot2::ggplot(data, ggplot2::aes(x = .data[[variable]])) +
    ggplot2::geom_bar(fill = "steelblue") +
    ggplot2::theme_minimal() +
    ggplot2::labs(
      title = paste("Bar Plot of", variable),
      x = variable,
      y = "Count"
    )
}

