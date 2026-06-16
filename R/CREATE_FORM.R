#' Cria formulário de entrada de dados vazio
#'
#' @return Data frame vazio com colunas padrão: ID, Name, Age, Gender, Date.
#' @export
CREATE_FORM <- function() {
  data.frame(
    ID     = integer(),
    Name   = character(),
    Age    = numeric(),
    Gender = factor(levels = c("Male", "Female")),
    Date   = as.Date(character()),
    stringsAsFactors = FALSE
  )
}

