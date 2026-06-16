#' Formata estimativas com 2 casas decimais
#'
#' Função interna usada por `format_est_ic95()`. Para uso direto, prefira
#' `format_estimate()`.
#'
#' @param n Número a ser formatado.
#' @return String formatada com 2 casas decimais.
#' @export
#'
#' @examples
#' format_est(1.2345)
format_est <- function(n) {
  formatC(n, format = "f", digits = 2, big.mark = ".", decimal.mark = ",")
}
