#' Cria Infraestrutura Mínima de Pastas para um Projeto
#'
#' Cria uma estrutura de diretórios padronizada dentro do diretório raiz do
#' projeto R (detectado via `here::here()`). As pastas criadas organizam os
#' dados brutos, auxiliares, tratados, intermediários e os resultados
#' (descritivo, bivariada, multivariada e acurácia).
#'
#' @return Invisível (`NULL`). As pastas são criadas como efeito colateral.
#' @export
#'
#' @examples
#' \dontrun{
#'   criar_pastas()
#' }
criar_pastas <- function() {
  pasta_geral <- paste0(here::here(), "/")

  criar_se_nao_existe <- function(caminho) {
    if (!dir.exists(caminho)) dir.create(caminho)
    caminho
  }

  pasta_resultados <- criar_se_nao_existe(paste0(pasta_geral, "resultados/"))

  criar_se_nao_existe(paste0(pasta_geral, "bancos_brutos/"))
  criar_se_nao_existe(paste0(pasta_geral, "dados auxiliares/"))
  criar_se_nao_existe(paste0(pasta_geral, "dados_tratados/"))
  criar_se_nao_existe(paste0(pasta_geral, "dados_inter/"))
  criar_se_nao_existe(paste0(pasta_resultados, "descritivo/"))
  criar_se_nao_existe(paste0(pasta_resultados, "bivariada/"))
  criar_se_nao_existe(paste0(pasta_resultados, "multivariada/"))
  criar_se_nao_existe(paste0(pasta_resultados, "acuracia/"))

  invisible(NULL)
}
