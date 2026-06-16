\name{calcula_periodo_anos}
\alias{calcula_periodo_anos}
\title{Calcula o Período de Anos em um Data Frame}
\description{ Dado um data frame e o nome da coluna que contém os anos, retorna uma string representando o período (ex.: `"2010-2023"` ou `"2015"` se houver apenas um ano).   }
\usage{calcula_periodo_anoscalcula_periodo_anos((banco, ano_col) {}
\arguments{
  \item{banco}{Data frame que contém a coluna de anos.}
  \item{ano_col}{Nome da coluna que contém os anos (sem aspas).}
}
\value{String com o período calculado.}
\examples{

\dontrun{
  periodo <- calcula_periodo_anos(banco, ano_col = ano)
  print(periodo)
}
}
