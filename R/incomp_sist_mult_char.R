#' Avaliação de Completude de Variáveis (Não Datas)
#'
#' Avalia a completude de variáveis não referentes a datas em um data frame,
#' informando percentuais de observações válidas, nulas e ignoradas.
#'
#' @param banco Data frame com os dados.
#' @param variavel Vetor de nomes (strings) das variáveis a serem avaliadas (exceto aquelas
#'        que começam com "DT").
#' @param ignorado Vetor de valores considerados ignorados.
#' @param nulo Valor (ou vetor) considerado nulo (padrão: \code{NA}).
#' @param nivel_validos Percentual mínimo de observações válidas para avaliar como adequado (padrão 90).
#' @param nivel_ign Percentual máximo de observações ignoradas permitido (padrão 5).
#'
#' @return Um \code{tibble} com a avaliação de completude para cada variável.
#' @export
#'
#' @examples
#' \dontrun{
#'   resultados <- incomp_sist_multi_char(banco, c("var1", "var2"), ignorado = c("NA", ""))
#' }
incomp_sist_multi_char <- function(banco, variavel, ignorado, nulo = NA, nivel_validos = 90, nivel_ign = 5) {
  variaveis <- stringr::str_subset(variavel, "^DT", negate = TRUE)

  resultados <- purrr::map_dfr(variaveis, function(var) {
    var_sym <- rlang::ensym(var)

    valores <- banco %>%
      dplyr::filter(!is.na(!!var_sym), !(!!var_sym %in% ignorado), !(!!var_sym %in% nulo)) %>%
      dplyr::distinct(!!var_sym) %>%
      dplyr::pull(!!var_sym)

    ignorados_encontrados <- banco %>%
      dplyr::filter(!!var_sym %in% ignorado) %>%
      dplyr::distinct(!!var_sym) %>%
      dplyr::pull(!!var_sym)

    validos <- banco %>%
      dplyr::filter(!!var_sym %in% valores) %>%
      nrow()

    nulos <- banco %>%
      dplyr::filter(is.na(!!var_sym) | !!var_sym %in% nulo) %>%
      nrow()

    ignorados <- banco %>%
      dplyr::filter(!!var_sym %in% ignorado) %>%
      nrow()

    tibble::tibble(
      Variável = as.character(var_sym),
      `N de obs.` = nrow(banco),
      Válidos = validos,
      `% válidos` = round(validos / nrow(banco) * 100, 2),
      Nulos = nulos,
      `% nulos` = round(nulos / nrow(banco) * 100, 1),
      Ignorados = ignorados,
      `% ignorados` = round(ignorados / nrow(banco) * 100, 2),
      Avaliação = dplyr::case_when(
        (validos / nrow(banco) * 100) >= nivel_validos &
          (ignorados / nrow(banco) * 100) <= nivel_ign ~ "Adequado",
        TRUE ~ "Inadequado"
      ),
      `Resp válidas` = paste(sort(head(valores, 50)), collapse = ", "),
      `Ignorados encontrados` = paste(ignorados_encontrados, collapse = ", ")
    )
  })

  print(resultados)
  return(resultados)
}
