#' Formata números inteiros com separador de milhar
#'
<<<<<<< HEAD
#' @param n Número a ser formatado.
#' @return String formatada com separador de milhar e sem casas decimais.
#' @export
#'
#' @examples
#' format_n_int(1234567)
format_n_int <- function(n) {
  formatC(n, format = "f", digits = 0, big.mark = ".", decimal.mark = ",")
=======
#' @param n Número a ser formatado
#' @return Texto formatado
#' @export
format_n_int <- function(n){
  val_texto <- formatC(n, format = "f", digits = 0,
                       big.mark = ".", decimal.mark = ",")
  return(val_texto)
>>>>>>> e01ebf36d7b5dde7c562d08f387101e897a981be
}

#' Formata percentual com 1 casa decimal
#'
<<<<<<< HEAD
#' @param n Número percentual a ser formatado.
#' @return String formatada com 1 casa decimal.
#' @export
#'
#' @examples
#' format_perc(45.678)
format_perc <- function(n) {
  formatC(n, format = "f", digits = 1, big.mark = ".", decimal.mark = ",")
=======
#' @param n Número percentual
#' @return Texto formatado
#' @export
format_perc <- function(n){
  val_texto <- formatC(n, format = "f", digits = 1,
                       big.mark = ".", decimal.mark = ",")
  return(val_texto)
>>>>>>> e01ebf36d7b5dde7c562d08f387101e897a981be
}

#' Formata estimativas com 2 casas decimais
#'
<<<<<<< HEAD
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

#' Formata estimativas com 2 casas decimais
#'
#' @param n Número a ser formatado.
#' @return String formatada com 2 casas decimais.
#' @export
#'
#' @examples
#' format_estimate(1.2345)
format_estimate <- function(n) {
  formatC(n, format = "f", digits = 2, big.mark = ".", decimal.mark = ",")
=======
#' @param n Número a ser formatado
#' @return Texto formatado
#' @export
format_est <- function(n){
  val_texto <- formatC(n, format = "f", digits = 2,
                       big.mark = ".", decimal.mark = ",")
  return(val_texto)
>>>>>>> e01ebf36d7b5dde7c562d08f387101e897a981be
}

#' Formata p-valor com 3 casas decimais
#'
<<<<<<< HEAD
#' @param n Número (p-valor) a ser formatado.
#' @return String formatada com 3 casas decimais.
#' @export
#'
#' @examples
#' format_pvalor(0.0456)
format_pvalor <- function(n) {
  formatC(n, format = "f", digits = 3, big.mark = ".", decimal.mark = ",")
=======
#' @param n Número (p-valor)
#' @return Texto formatado
#' @export
format_pvalor <- function(n){
  val_texto <- formatC(n, format = "f", digits = 3,
                       big.mark = ".", decimal.mark = ",")
  return(val_texto)
>>>>>>> e01ebf36d7b5dde7c562d08f387101e897a981be
}

#' Formata número com percentual entre parênteses
#'
<<<<<<< HEAD
#' @param n Número absoluto.
#' @param perc Percentual correspondente.
#' @return String no estilo `"n (x%)"`.
#' @export
#'
#' @examples
#' format_n_perc(250, 45.6)
format_n_perc <- function(n, perc) {
  paste0(
=======
#' @param n Número absoluto
#' @param perc Percentual
#' @return Texto formatado no estilo "n (x%)"
#' @export
format_n_perc <- function(n, perc){
  texto_n_perc <- paste0(
>>>>>>> e01ebf36d7b5dde7c562d08f387101e897a981be
    format_n_int(n),
    ifelse(perc >= 10, " ", "  "),
    "(",
    format_perc(perc),
    "%)"
  )
<<<<<<< HEAD
=======
  return(texto_n_perc)
>>>>>>> e01ebf36d7b5dde7c562d08f387101e897a981be
}

#' Formata estimativa com intervalo de confiança 95%
#'
<<<<<<< HEAD
#' @param est Estimativa central.
#' @param ici Limite inferior do IC 95%.
#' @param ics Limite superior do IC 95%.
#' @return String no estilo `"est (ici - ics)"`.
#' @export
#'
#' @examples
#' format_est_ic95(1.5, 1.1, 2.1)
format_est_ic95 <- function(est, ici, ics) {
  paste0(
=======
#' @param est Estimativa central
#' @param ici Limite inferior
#' @param ics Limite superior
#' @return Texto formatado "est (ici - ics)"
#' @export
format_est_ic95 <- function(est, ici, ics){
  texto <- paste0(
>>>>>>> e01ebf36d7b5dde7c562d08f387101e897a981be
    format_est(est),
    " (",
    format_est(ici),
    " - ",
    format_est(ics),
    ")"
  )
<<<<<<< HEAD
=======
  return(texto)
>>>>>>> e01ebf36d7b5dde7c562d08f387101e897a981be
}
