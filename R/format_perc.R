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
