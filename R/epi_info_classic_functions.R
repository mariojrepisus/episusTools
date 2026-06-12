# Epi Info Classic Functions in R
# Adapted from Epi Info Classic Functions
# R equivalents for classic Epi Info analysis functions

# -------------------------------
# 1. Analysis Functions
# -------------------------------

#' Tabela de frequências de uma variável
#'
#' @param data Data frame.
#' @param variable Nome da coluna (string).
#' @return Objeto `table` com as frequências.
#' @export
FREQ <- function(data, variable) {
  table(data[[variable]])
}

#' Tabulação cruzada com teste qui-quadrado
#'
#' @param data Data frame.
#' @param var1 Nome da primeira variável (string).
#' @param var2 Nome da segunda variável (string).
#' @return Lista com `table` (tabulação cruzada) e `chi_square` (resultado do
#'   teste qui-quadrado).
#' @export
CROSS_TAB <- function(data, var1, var2) {
  tbl <- table(data[[var1]], data[[var2]])
  chisq <- chisq.test(tbl)
  list(table = tbl, chi_square = chisq)
}

#' Estatísticas descritivas de uma variável numérica
#'
#' @param data Data frame.
#' @param variable Nome da coluna numérica (string).
#' @return Tibble com média, desvio padrão, mediana, mínimo e máximo.
#' @export
MEANS <- function(data, variable) {
  data |>
    dplyr::summarise(
      Mean   = mean(.data[[variable]], na.rm = TRUE),
      SD     = sd(.data[[variable]], na.rm = TRUE),
      Median = median(.data[[variable]], na.rm = TRUE),
      Min    = min(.data[[variable]], na.rm = TRUE),
      Max    = max(.data[[variable]], na.rm = TRUE)
    )
}

#' Gráfico de barras de uma variável
#'
#' @param data Data frame.
#' @param variable Nome da coluna (string).
#' @return Objeto ggplot2.
#' @export
PLOT <- function(data, variable) {
  ggplot2::ggplot(data, ggplot2::aes(x = .data[[variable]])) +
    ggplot2::geom_bar(fill = "steelblue") +
    ggplot2::theme_minimal() +
    ggplot2::labs(
      title = paste("Bar Plot of", variable),
      x = variable,
      y = "Count"
    )
}

#' Lista os primeiros registros do data frame
#'
#' @param data Data frame.
#' @return As primeiras linhas do data frame.
#' @export
LIST <- function(data) {
  head(data)
}

#' Ordena o data frame por uma variável
#'
#' @param data Data frame.
#' @param variable Nome da coluna para ordenar (string).
#' @return Data frame ordenado.
#' @export
SORT <- function(data, variable) {
  data |> dplyr::arrange(.data[[variable]])
}

#' Filtra registros por uma condição
#'
#' @param data Data frame.
#' @param condition String com a expressão de filtro (ex.: `"age > 18"`).
#' @return Data frame filtrado.
#' @export
SELECT <- function(data, condition) {
  data |> dplyr::filter(eval(parse(text = condition)))
}

#' Resumo de todas as variáveis do data frame
#'
#' @param data Data frame.
#' @return Resumo estatístico via `summary()`.
#' @export
SUMMARY <- function(data) {
  summary(data)
}

# -------------------------------
# 2. Análise epidemiológica (epiR)
# -------------------------------

#' Análise de tabela 2x2 para caso-controle
#'
#' Wrapper de `epiR::epi.2by2()` configurado para estudo de caso-controle.
#'
#' @param case Contagem de casos expostos e não expostos.
#' @param control Contagem de controles expostos e não expostos.
#' @return Resultado de `epiR::epi.2by2()`.
#' @export
MATCH <- function(case, control) {
  epiR::epi.2by2(
    dat    = matrix(c(case, control), nrow = 2, byrow = TRUE),
    method = "case.control"
  )
}

#' Tabela 2x2 com OR/RR via epiR
#'
#' @param a Célula (exposto, doente).
#' @param b Célula (exposto, não doente).
#' @param c Célula (não exposto, doente).
#' @param d Célula (não exposto, não doente).
#' @return Resultado de `epiR::epi.2by2()`.
#' @export
TABLE <- function(a, b, c, d) {
  epiR::epi.2by2(
    matrix(c(a, b, c, d), nrow = 2, byrow = TRUE),
    method = "cohort.count"
  )
}

# -------------------------------
# 3. Check Code Logic
# -------------------------------

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

#' Lógica condicional IF/THEN/ELSE
#'
#' @param value Valor numérico a ser avaliado.
#' @return `"High"` se `value > 10`, caso contrário `"Low"`.
#' @export
CHECK_IF_THEN <- function(value) {
  if (value > 10) "High" else "Low"
}

#' Gera sequência numérica automática
#'
#' @param n Número de IDs a gerar.
#' @return Vetor inteiro de 1 até `n`.
#' @export
AUTONUMBER <- function(n) {
  seq(1, n)
}

#' Valida se um valor está entre os valores permitidos
#'
#' @param value Valor a ser verificado.
#' @param legal_values Vetor de valores válidos.
#' @return Lógico: `TRUE` se o valor for permitido.
#' @export
COMMENT_LEGAL <- function(value, legal_values) {
  value %in% legal_values
}

#' Verifica se um valor não é NA
#'
#' @param value Valor a ser verificado.
#' @return Lógico: `TRUE` se não for `NA`.
#' @export
IS_REQUIRED <- function(value) {
  !is.na(value)
}

#' Atribui e retorna um valor
#'
#' @param x Valor de entrada.
#' @return O mesmo valor `x`.
#' @export
ASSIGN <- function(x) {
  x
}

# -------------------------------
# 4. Utilities
# -------------------------------

#' Calcula OR e RR para tabela 2x2
#'
#' Wrapper de `epiR::epi.2by2()`.
#'
#' @param a Célula (exposto, doente).
#' @param b Célula (exposto, não doente).
#' @param c Célula (não exposto, doente).
#' @param d Célula (não exposto, não doente).
#' @return Resultado de `epiR::epi.2by2()`.
#' @export
STATCALC <- function(a, b, c, d) {
  epiR::epi.2by2(
    matrix(c(a, b, c, d), nrow = 2, byrow = TRUE),
    method = "cohort.count"
  )
}

#' Cálculo do tamanho amostral para comparação de duas proporções
#'
#' Wrapper de `epiR::epi.sscompb()` (desfecho binário).
#'
#' @param p1 Proporção no grupo de tratamento.
#' @param p2 Proporção no grupo controle.
#' @param power Poder estatístico desejado (padrão: 0.8).
#' @param alpha Nível de significância (padrão: 0.05).
#' @return Resultado de `epiR::epi.sscompb()`.
#' @export
SAMPLE_SIZE <- function(p1, p2, power = 0.8, alpha = 0.05) {
  epiR::epi.sscompb(
    treat      = p1,
    control    = p2,
    n          = NA,
    power      = power,
    r          = 1,
    design     = 1,
    sided.test = 2,
    conf.level = 1 - alpha
  )
}
