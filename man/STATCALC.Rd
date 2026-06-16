\name{STATCALC}
\alias{STATCALC}
\title{Calcula OR e RR para tabela 2x2}
\description{Wrapper de `epitools::oddsratio()` e `epitools::riskratio()`.}
\usage{STATCALC(a, b, c, d)}
\arguments{
  \item{a}{Célula (exposto, doente).}
  \item{b}{Célula (exposto, não doente).}
  \item{c}{Célula (não exposto, doente).}
  \item{d}{Célula (não exposto, não doente).}
}
\value{Lista com resultados de `epitools::oddsratio()` e `epitools::riskratio()`.}
