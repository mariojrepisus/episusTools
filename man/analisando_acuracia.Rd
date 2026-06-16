\name{analisando_acuracia}
\alias{analisando_acuracia}
\title{Análise de Acurácia com Base em Exposições e Desfechos Binários}
\description{ Para desfechos binários tipo dummy (ex.: `"Sim"`, `"Não"`), calcula sensibilidade, especificidade, VPP, VPN e acurácia com seus respectivos intervalos de confiança 95% e p-valores.    (opcional).   (padrão: `c("Sim", "Não")`).  }
\usage{analisando_acuraciaanalisando_acuracia((banco,}
\arguments{
  \item{banco}{Data frame com os dados.}
  \item{exposicoes}{Vetor de nomes (strings) das variáveis de exposição.}
  \item{desfechos}{Vetor de nomes (strings) das variáveis de desfecho.}
  \item{pasta_results}{Caminho da pasta para salvar o resultado em CSV}
  \item{nome_analise}{Nome do arquivo de saída, sem extensão (opcional).}
  \item{valores}{Vetor com os dois níveis do fator, em ordem}
}
\value{Data frame com as métricas de acurácia para cada par   exposição × desfecho.}
\examples{

\dontrun{
  analisando_acuracia(banco,
                      exposicoes = c("expo1", "expo2"),
                      desfechos  = c("desf1"))
}
}
