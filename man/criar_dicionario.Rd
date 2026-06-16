\name{criar_dicionario}
\alias{criar_dicionario}
\title{Cria um Dicionário de Dados}
\description{Cria um resumo das variáveis de um data frame, listando os primeiros valores únicos e o total de valores distintos.}
\usage{criar_dicionario(banco, max_valores = 50)}
\arguments{
  \item{banco}{Data frame a ser analisado.}
  \item{max_valores}{Número máximo de valores únicos a serem listados (padrão: 50).}
}
\value{Um \code{tibble} com o nome da variável, os valores concatenados         e o total de valores únicos.}
\examples{

\dontrun{
  dic <- criar_dicionario(banco)
  print(dic)
}
}
