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
