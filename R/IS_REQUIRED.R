#' Verifica se um valor não é NA
#'
#' @param value Valor a ser verificado.
#' @return Lógico: `TRUE` se não for `NA`.
#' @export
IS_REQUIRED <- function(value) {
  !is.na(value)
}

