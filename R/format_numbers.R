#' Formata números inteiros com separador de milhar
#'
#' @param n Número a ser formatado
#' @return Texto formatado
#' @export
format_n_int <- function(n){
  val_texto <- formatC(n, format = "f", digits = 0,
                       big.mark = ".", decimal.mark = ",")
  return(val_texto)
}

#' Formata percentual com 1 casa decimal
#'
#' @param n Número percentual
#' @return Texto formatado
#' @export
format_perc <- function(n){
  val_texto <- formatC(n, format = "f", digits = 1,
                       big.mark = ".", decimal.mark = ",")
  return(val_texto)
}

#' Formata estimativas com 2 casas decimais
#'
#' @param n Número a ser formatado
#' @return Texto formatado
#' @export
format_est <- function(n){
  val_texto <- formatC(n, format = "f", digits = 2,
                       big.mark = ".", decimal.mark = ",")
  return(val_texto)
}

#' Formata p-valor com 3 casas decimais
#'
#' @param n Número (p-valor)
#' @return Texto formatado
#' @export
format_pvalor <- function(n){
  val_texto <- formatC(n, format = "f", digits = 3,
                       big.mark = ".", decimal.mark = ",")
  return(val_texto)
}

#' Formata número com percentual entre parênteses
#'
#' @param n Número absoluto
#' @param perc Percentual
#' @return Texto formatado no estilo "n (x%)"
#' @export
format_n_perc <- function(n, perc){
  texto_n_perc <- paste0(
    format_n_int(n),
    ifelse(perc >= 10, " ", "  "),
    "(",
    format_perc(perc),
    "%)"
  )
  return(texto_n_perc)
}

#' Formata estimativa com intervalo de confiança 95%
#'
#' @param est Estimativa central
#' @param ici Limite inferior
#' @param ics Limite superior
#' @return Texto formatado "est (ici - ics)"
#' @export
format_est_ic95 <- function(est, ici, ics){
  texto <- paste0(
    format_est(est),
    " (",
    format_est(ici),
    " - ",
    format_est(ics),
    ")"
  )
  return(texto)
}
