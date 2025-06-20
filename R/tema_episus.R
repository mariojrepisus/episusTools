#' Tema Episus para ggplot2
#'
#' Retorna um tema customizado baseado no \code{theme_minimal} para uso no
#' \code{ggplot2}, conferindo um visual limpo e estilizado aos gráficos.
#'
#' @return Um objeto de tema do ggplot2.
#' @export
#'
#' @examples
#' ggplot(data) + geom_point(aes(x, y)) + tema_episus()
tema_episus <- function() {
  ggplot2::theme_minimal() +
    ggplot2::theme(
      plot.title = ggplot2::element_text(size = 20, face = "bold"),
      plot.subtitle = ggplot2::element_text(size = 16, face = "italic"),
      axis.title = ggplot2::element_text(size = 14, face = "bold"),
      axis.text = ggplot2::element_text(size = 12),
      legend.title = ggplot2::element_text(size = 14, face = "bold"),
      legend.text = ggplot2::element_text(size = 12),
      panel.grid.major = ggplot2::element_line(color = "#D5DBDB"),
      panel.grid.minor = ggplot2::element_line(color = "#D5DBDB", linetype = "dashed"),
      panel.background = ggplot2::element_rect(fill = "#EBF5FB")
    )
}
