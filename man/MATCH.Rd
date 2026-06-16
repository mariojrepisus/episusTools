\name{MATCH}
\alias{MATCH}
\title{Análise de tabela 2x2 para caso-controle}
\description{Wrapper de `epitools::oddsratio()` configurado para estudo de caso-controle.}
\usage{MATCH(case, control)}
\arguments{
  \item{case}{Contagem de casos expostos e não expostos.}
  \item{control}{Contagem de controles expostos e não expostos.}
}
\value{Objeto `oddsratio` retornado por `epitools::oddsratio()`.}
