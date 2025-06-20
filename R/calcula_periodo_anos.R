#' Calcula o Período de Anos em um Data Frame
#'
#' Dado um data frame e o nome da coluna que contém os anos,
#' esta função retorna um texto representando o período (ex.: "2010-2023"
#' ou "2015" se houver apenas um ano).
#'
#' @param banco Data frame que contém a coluna de anos.
#' @param ano_col Nome da coluna que contém os anos.
#'
#' @return Caractere com o período calculado.
#' @export
#'
#' @examples
#' \dontrun{
#'   periodo <- calcula_periodo_anos(banco, ano_col = "ano")
#'   print(periodo)
#' }
calcula_periodo_anos <- function(banco, ano_col) {
  ano_sym <- rlang::ensym(ano_col)
  anos_df <- banco %>%
    dplyr::filter(!is.na(!!ano_sym)) %>%
    dplyr::select(!!ano_sym) %>%
    dplyr::distinct() %>%
    dplyr::arrange(!!ano_sym) %>%
    dplyr::mutate(ano = as.double(!!ano_sym))

  ano_min <- min(anos_df$ano, na.rm = TRUE)
  ano_max <- max(anos_df$ano, na.rm = TRUE)

  if (ano_min == ano_max) {
    periodo <- as.character(ano_min)
  } else {
    periodo <- paste0(as.character(ano_min), "-", as.character(ano_max))
  }

  return(periodo)
}
