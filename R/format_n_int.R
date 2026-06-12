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
