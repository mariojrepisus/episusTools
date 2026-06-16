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
