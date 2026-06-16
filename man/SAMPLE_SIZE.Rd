\name{SAMPLE_SIZE}
\alias{SAMPLE_SIZE}
\title{Cálculo do tamanho amostral para comparação de duas proporções}
\description{Wrapper de `epiR::epi.sscompb()` (desfecho binário).}
\usage{SAMPLE_SIZE(p1, p2, power = 0.8, alpha = 0.05)}
\arguments{
  \item{p1}{Proporção no grupo de tratamento.}
  \item{p2}{Proporção no grupo controle.}
  \item{power}{Poder estatístico desejado (padrão: 0.8).}
  \item{alpha}{Nível de significância (padrão: 0.05).}
}
\value{Resultado de `epiR::epi.sscompb()`.}
