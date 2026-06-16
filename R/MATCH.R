#' Análise de tabela 2x2 para caso-controle
#'
#' Wrapper de `epiR::epi.2by2()` configurado para estudo de caso-controle.
#'
#' @param case Contagem de casos expostos e não expostos.
#' @param control Contagem de controles expostos e não expostos.
#' @return Resultado de `epiR::epi.2by2()`.
#' @export
MATCH <- function(case, control) {
  epiR::epi.2by2(
    dat    = matrix(c(case, control), nrow = 2, byrow = TRUE),
    method = "case.control"
  )
}

