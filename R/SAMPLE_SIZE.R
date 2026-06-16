#' Cálculo do tamanho amostral para comparação de duas proporções
#'
#' Wrapper de `epiR::epi.sscompb()` (desfecho binário).
#'
#' @param p1 Proporção no grupo de tratamento.
#' @param p2 Proporção no grupo controle.
#' @param power Poder estatístico desejado (padrão: 0.8).
#' @param alpha Nível de significância (padrão: 0.05).
#' @return Resultado de `epiR::epi.sscompb()`.
#' @export
SAMPLE_SIZE <- function(p1, p2, power = 0.8, alpha = 0.05) {
  epiR::epi.sscompb(
    treat      = p1,
    control    = p2,
    n          = NA,
    power      = power,
    r          = 1,
    design     = 1,
    sided.test = 2,
    conf.level = 1 - alpha
  )
}
