\name{incomp_sist_multi_dt}
\alias{incomp_sist_multi_dt}
\title{Avaliação de Completude de Variáveis de Data}
\description{Avalia a completude de variáveis de data (aquelas cujo nome começa com `"DT"`) em um data frame, convertendo as datas com `lubridate::dmy()` e gerando um resumo.}
\usage{incomp_sist_multi_dt(banco, variavel, nulo = NA, nivel_validos = 90)}
\arguments{
  \item{banco}{Data frame com os dados.}
  \item{variavel}{Vetor de nomes das variáveis de data. Apenas variáveis cujo   nome começa com `"DT"` são processadas.}
  \item{nulo}{Valor considerado nulo (padrão: `NA`).}
  \item{nivel_validos}{Percentual mínimo de observações válidas para ser   considerado adequado (padrão: 90).}
}
\value{Tibble com a avaliação da completude para cada variável de data.}
\examples{

\dontrun{
  resultados <- incomp_sist_multi_dt(banco, c("DT_DATA1", "DT_DATA2"))
}
}
