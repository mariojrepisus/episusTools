#' Tabulação cruzada com teste qui-quadrado
#'
#' @param data Data frame.
#' @param var1 Nome da primeira variável (string).
#' @param var2 Nome da segunda variável (string).
#' @return Lista com `table` (tabulação cruzada) e `chi_square` (resultado do
#'   teste qui-quadrado).
#' @export
CROSS_TAB <- function(data, var1, var2) {
  tbl <- table(data[[var1]], data[[var2]])
  chisq <- chisq.test(tbl)
  list(table = tbl, chi_square = chisq)
}

