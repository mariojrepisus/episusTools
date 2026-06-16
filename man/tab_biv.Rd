\name{tab_biv}
\alias{tab_biv}
\title{Análise Bivariada com Múltiplas Combinações de Exposição e Desfecho}
\description{ Para cada par exposição × desfecho, calcula a razão de prevalência (RP) com IC 95% e p-valor via `epitools::riskratio()`, retornando os resultados em formato longo.    (ex.: `c("Sim", "Não")`).  }
\usage{tab_bivtab_biv((banco, expos, desf, valores) {}
\arguments{
  \item{banco}{Data frame com os dados.}
  \item{expos}{Vetor de nomes (strings) das variáveis de exposição.}
  \item{desf}{Vetor de nomes (strings) das variáveis de desfecho.}
  \item{valores}{Vetor com os dois níveis do fator, em ordem}
}
\value{Tibble em formato longo com as métricas para cada combinação   exposição × desfecho.}
\examples{

\dontrun{
  tab_biv(banco,
          expos  = c("expo1", "expo2"),
          desf   = c("desf1"),
          valores = c("Sim", "Não"))
}
}
