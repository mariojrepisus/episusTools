#' Lógica condicional IF/THEN/ELSE
#'
#' @param value Valor numérico a ser avaliado.
#' @return `"High"` se `value > 10`, caso contrário `"Low"`.
#' @export
CHECK_IF_THEN <- function(value) {
  if (value > 10) "High" else "Low"
}

