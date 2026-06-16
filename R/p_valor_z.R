#' Teste Z para proporção contra 0.5
#'
#' Calcula o p-valor bilateral de um teste Z comparando uma proporção observada
#' contra a hipótese nula de `prop`.
#'
#' @param x Número de sucessos.
#' @param n Total de tentativas.
#' @param prop Proporção hipotética (padrão: 0.5).
#' @return P-valor bilateral (numérico).
#' @export
p_valor_z <- function(x, n, prop = 0.5) {
  p_obs <- x / n
  Z     <- (p_obs - prop) / sqrt(prop * (1 - prop) / n)
  2 * (1 - pnorm(abs(Z)))
}
