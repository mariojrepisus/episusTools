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
