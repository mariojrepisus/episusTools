\name{STATCALC}
\alias{STATCALC}
\title{Calcula OR e RR para tabela 2x2}
\description{Wrapper de `epiR::epi.2by2()`.}
\usage{STATCALC(a, b, c, d)}
\arguments{
  \item{a}{Célula (exposto, doente).}
  \item{b}{Célula (exposto, não doente).}
  \item{c}{Célula (não exposto, doente).}
  \item{d}{Célula (não exposto, não doente).}
}
\value{Resultado de `epiR::epi.2by2()`.}
