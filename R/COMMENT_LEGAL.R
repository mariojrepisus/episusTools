#' Valida se um valor está entre os valores permitidos
#'
#' @param value Valor a ser verificado.
#' @param legal_values Vetor de valores válidos.
#' @return Lógico: `TRUE` se o valor for permitido.
#' @export
COMMENT_LEGAL <- function(value, legal_values) {
  value %in% legal_values
}

