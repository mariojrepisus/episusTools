#' Formata estimativas com 2 casas decimais
#'
#' @param n Número a ser formatado
#' @return Texto formatado
#' @export
format_estimate <- function(n){
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
