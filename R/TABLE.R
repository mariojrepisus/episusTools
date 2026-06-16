#' Tabela 2x2 com OR/RR via epiR
#'
#' @param a Célula (exposto, doente).
#' @param b Célula (exposto, não doente).
#' @param c Célula (não exposto, doente).
#' @param d Célula (não exposto, não doente).
#' @return Resultado de `epiR::epi.2by2()`.
#' @export
TABLE <- function(a, b, c, d) {
  epiR::epi.2by2(
    matrix(c(a, b, c, d), nrow = 2, byrow = TRUE),
    method = "cohort.count"
  )
}

# -------------------------------
# 3. Check Code Logic
# -------------------------------

