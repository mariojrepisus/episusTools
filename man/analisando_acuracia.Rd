\name{analisando_acuracia}
\alias{analisando_acuracia}
\title{Análise de Acurácia com Base em Exposições e Desfechos Binários}
\description{Para desfechos binários tipo dummy (ex.: "Sim", "Não"), calcula sensibilidade, especificidade, VPP, VPN e acurácia com IC 95% e p-valores.}
\usage{analisando_acuracia(banco, exposicoes, desfechos, pasta_results = NULL, nome_analise = NULL, valores = c("Sim", "Nao"))}
\arguments{
  \item{banco}{Data frame com os dados.}
  \item{exposicoes}{Vetor de nomes das variáveis de exposição.}
  \item{desfechos}{Vetor de nomes das variáveis de desfecho.}
  \item{pasta_results}{Caminho da pasta para salvar o resultado em CSV (opcional).}
  \item{nome_analise}{Nome do arquivo de saída, sem extensão (opcional).}
  \item{valores}{Vetor com os dois níveis do fator (padrão: c("Sim", "Nao")).}
}
\value{Data frame com as métricas de acurácia para cada par exposição × desfecho.}
