#' Tabela 2x2 com OR/RR via epitools
#'
#' @param a Célula (exposto, doente).
#' @param b Célula (exposto, não doente).
#' @param c Célula (não exposto, doente).
#' @param d Célula (não exposto, não doente).
#' @return Lista com resultados de odds ratio e risk ratio.
#' @export
TABLE <- function(a, b, c, d) {
  tab <- matrix(c(a, b, c, d), nrow = 2, byrow = TRUE)
  list(
    oddsratio = epitools::oddsratio(tab, method = "wald"),
    riskratio = epitools::riskratio(tab, method = "wald"),
    table = tab
  )
}

# -------------------------------
# 3. Check Code Logic
# -------------------------------

