#' Cria um Dicionário de Dados
#'
#' Cria um resumo das variáveis de um data frame, listando os primeiros
#' valores únicos e o total de valores distintos.
#'
#' @param banco Data frame a ser analisado.
#' @param max_valores Número máximo de valores únicos a serem listados (padrão: 50).
#'
#' @return Um \code{tibble} com o nome da variável, os valores concatenados
#'         e o total de valores únicos.
#' @export
#'
#' @examples
#' \dontrun{
#'   dic <- criar_dicionario(banco)
#'   print(dic)
#' }
criar_dicionario <- function(banco, max_valores = 50) {
  dicionario <- purrr::map_dfr(names(banco), function(var) {
    valores <- unique(banco[[var]])
    tibble::tibble(
      Variável = var,
      Valores = paste(head(valores, max_valores), collapse = ", "),
      Total_valores = length(valores)
    )
  })
  return(dicionario)
}
