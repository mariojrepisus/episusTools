\name{tema_episus}
\alias{tema_episus}
\title{Tema Episus para ggplot2}
\description{Retorna um tema customizado baseado no \code{theme_minimal} para uso no \code{ggplot2}, conferindo um visual limpo e estilizado aos gráficos.}
\usage{tema_episus()}
\value{Um objeto de tema do ggplot2.}
\examples{

ggplot2::ggplot(mtcars, ggplot2::aes(x = wt, y = mpg)) +
  ggplot2::geom_point() +
  tema_episus()
}
