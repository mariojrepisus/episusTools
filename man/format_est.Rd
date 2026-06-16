\name{format_est}
\alias{format_est}
\title{Formata estimativas com 2 casas decimais}
\description{Função interna usada por `format_est_ic95()`. Para uso direto, prefira `format_estimate()`.}
\usage{format_est(n)}
\arguments{
  \item{n}{Número a ser formatado.}
}
\value{String formatada com 2 casas decimais.}
\examples{

format_est(1.2345)
}
