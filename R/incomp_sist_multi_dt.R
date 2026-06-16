#' Avaliação de Completude de Variáveis de Data
#'
#' Avalia a completude de variáveis de data (aquelas cujo nome começa com
#' `"DT"`) em um data frame, convertendo as datas com `lubridate::dmy()` e
#' gerando um resumo.
#'
#' @param banco Data frame com os dados.
#' @param variavel Vetor de nomes das variáveis de data. Apenas variáveis cujo
#'   nome começa com `"DT"` são processadas.
#' @param nulo Valor considerado nulo (padrão: `NA`).
#' @param nivel_validos Percentual mínimo de observações válidas para ser
#'   considerado adequado (padrão: 90).
#'
#' @return Tibble com a avaliação da completude para cada variável de data.
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

    banco <- banco |>
      dplyr::mutate(!!var_sym := lubridate::dmy(!!var_sym))

    valores <- banco |>
      dplyr::filter(!is.na(!!var_sym)) |>
      dplyr::distinct(!!var_sym) |>
      dplyr::pull(!!var_sym)

    validos <- banco |> dplyr::filter(!!var_sym %in% valores) |> nrow()
    nulos   <- banco |> dplyr::filter(is.na(!!var_sym) | !!var_sym %in% nulo) |> nrow()

    tibble::tibble(
      "Variavel"         = as.character(var_sym),
      "N de obs."             = nrow(banco),
      "Validos"         = validos,
      "% validos"       = round(validos / nrow(banco) * 100, 2),
      "Nulos"                 = nulos,
      "% nulos"               = round(nulos   / nrow(banco) * 100, 1),
      "Avaliacao"  = dplyr::case_when(
        (validos / nrow(banco) * 100) >= nivel_validos ~ "Adequado",
        TRUE ~ "Inadequado"
      ),
      "Data minima"     = min(banco[[as.character(var_sym)]], na.rm = TRUE),
      "Data maxima"     = max(banco[[as.character(var_sym)]], na.rm = TRUE)
    )
  })

  print(resultados)
  return(resultados)
}
