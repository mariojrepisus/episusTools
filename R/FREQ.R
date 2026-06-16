#' Tabela de frequências de uma variável
#'
#' @param data Data frame.
#' @param variable Nome da coluna (string).
#' @return Objeto `table` com as frequências.
#' @export
FREQ <- function(data, variable) {
  table = data|>
    dplyr::count(!!sym(variable))|>
    dplyr::mutate(perc = base::round(n/sum(n)*100,2))
  return(table)
    
}

