\name{incomp_sist_multi_char}
\alias{incomp_sist_multi_char}
\title{Avaliação de Completude de Variáveis Categóricas}
\description{Avalia a completude de variáveis não-data em um data frame, informando percentuais de observações válidas, nulas e ignoradas.}
\usage{incomp_sist_multi_char(banco, variavel, ignorado, nulo = NA, nivel_validos = 90, nivel_ign = 5)}
\arguments{
  \item{banco}{Data frame com os dados.}
  \item{variavel}{Vetor de nomes (strings) das variáveis a avaliar. Variáveis   cujo nome começa com `"DT"` são automaticamente excluídas.}
  \item{ignorado}{Vetor de valores considerados ignorados.}
  \item{nulo}{Valor (ou vetor) considerado nulo (padrão: `NA`).}
  \item{nivel_validos}{Percentual mínimo de observações válidas para ser   considerado adequado (padrão: 90).}
  \item{nivel_ign}{Percentual máximo de observações ignoradas permitido   (padrão: 5).}
}
\value{Tibble com a avaliação de completude para cada variável.}
\examples{

\dontrun{
  resultados <- incomp_sist_multi_char(banco, c("var1", "var2"),
                                       ignorado = c("9", "99"))
}
}
