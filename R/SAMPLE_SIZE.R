#' Cálculo do tamanho amostral para comparação de duas proporções
#'
#' Wrapper de `stats::power.prop.test()` (desfecho binário).
#'
#' @param p1 Proporção no grupo de tratamento.
#' @param p2 Proporção no grupo controle.
#' @param power Poder estatístico desejado (padrão: 0.8).
#' @param alpha Nível de significância (padrão: 0.05).
#' @return Objeto retornado por `stats::power.prop.test()`.
#' @export
SAMPLE_SIZE <- function(p1, p2, power = 0.8, alpha = 0.05) {
  stats::power.prop.test(
    p1 = p1,
    p2 = p2,
    power = power,
    sig.level = alpha,
    alternative = "two.sided",
    ratio = 1
  )
}
