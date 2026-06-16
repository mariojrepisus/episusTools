#' Análise de tabela 2x2 para caso-controle
#'
#' Wrapper de `epitools::oddsratio()` configurado para estudo de caso-controle.
#'
#' @param case Contagem de casos expostos e não expostos.
#' @param control Contagem de controles expostos e não expostos.
#' @return Objeto `oddsratio` retornado por `epitools::oddsratio()`.
#' @export
MATCH <- function(case, control) {
  tab <- matrix(c(case, control), nrow = 2, byrow = TRUE)
  epitools::oddsratio(tab, method = "wald")
}

