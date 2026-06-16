#' Calcula OR e RR para tabela 2x2
#'
#' Wrapper de `epiR::epi.2by2()`.
#'
#' @param a Célula (exposto, doente).
#' @param b Célula (exposto, não doente).
#' @param c Célula (não exposto, doente).
#' @param d Célula (não exposto, não doente).
#' @return Resultado de `epiR::epi.2by2()`.
#' @export
STATCALC <- function(a, b, c, d) {
  epiR::epi.2by2(
    matrix(c(a, b, c, d), nrow = 2, byrow = TRUE),
    method = "cohort.count"
  )
}

