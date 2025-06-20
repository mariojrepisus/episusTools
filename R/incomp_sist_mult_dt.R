#' Avaliação de Completude de Variáveis de Data
#'
#' Esta função avalia a completude de variáveis de data (aquelas que iniciam com "DT")
#' em um data frame, transformando as datas e gerando um resumo.
#'
#' @param banco Data frame com os dados.
#' @param variavel Vetor de nomes das variáveis de data.
#' @param nulo Valor considerado nulo (padrão: \code{NA}).
#' @param nivel_validos Percentual mínimo de observações válidas para ser considerado adequado (padrão 90).
#'
#' @return Um \code{tibble} com a avaliação da completude para cada variável de data.
#' @export
#'
#' @examples
#' \dontrun{
#'   resultados <- incomp_sist_multi_dt(banco, c("DT_DATA1", "DT_DATA2"))
#' }
incomp_sist_multi_dt <- function(banco, variavel, nulo = NA, nivel_validos = 90) {
  variaveis <- stringr::str_subset(variavel, "^DT")

  resultados <- purrr::map_dfr(variaveis, function(var) {
    var_sym <- rlang::ensym(var)

    banco <- banco %>%
      dplyr::mutate(!!var_sym := lubridate::dmy(!!var_sym))

    valores <- banco %>%
      dplyr::filter(!is.na(!!var_sym)) %>%
      dplyr::distinct(!!var_sym) %>%
      dplyr::pull(!!var_sym)

    validos <- banco %>%
      dplyr::filter(!!var_sym %in% valores) %>%
      nrow()

    nulos <- banco %>%
      dplyr::filter(is.na(!!var_sym) | !!var_sym %in% nulo) %>%
      nrow()

    tibble::tibble(
      Variável = as.character(var_sym),
      `N de obs.` = nrow(banco),
      Válidos = validos,
      `% válidos` = round(validos / nrow(banco) * 100, 2),
      Nulos = nulos,
      `% nulos` = round(nulos / nrow(banco) * 100, 1),
      Avaliação = dplyr::case_when(
        (validos / nrow(banco) * 100) >= nivel_validos ~ "Adequado",
        TRUE ~ "Inadequado"
      ),
      `Data mínima` = min(banco[[as.character(var_sym)]], na.rm = TRUE),
      `Data máxima` = max(banco[[as.character(var_sym)]], na.rm = TRUE)
    )
  })

  print(resultados)
  return(resultados)
}
