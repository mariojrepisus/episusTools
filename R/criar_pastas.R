#' Criação de uma infraestrutura de pastas mínimas, de facil referenciamento, dentro da pasta colocada como diretório de trabalho setwd()
#'
#' Criação de uma infraestrutura mínima de pastas, de facil referenciamento, 
#' dentro da pasta colocada como diretório de trabalho setwd() ou da pasta básica do
#' do projeto do R

criar_pastas = function(){
  library(here)
  ## separando pastas
  pasta_geral =  paste0(here(), "/")
  
  pasta_bancos = if (!dir.exists(paste0(pasta_geral, "bancos brutos/"))) {
    dir.create(paste0(pasta_geral, "bancos brutos/"))
    paste0(pasta_geral, "bancos brutos/")
  } else {
    paste0(pasta_geral, "bancos brutos/")
  }
  
  pasta_aux = if (!dir.exists(paste0(pasta_geral, "dados auxiliares/"))) {
    dir.create(paste0(pasta_geral, "dados auxiliares/"))
    paste0(pasta_geral, "dados auxiliares/")
  } else {
    paste0(pasta_geral, "dados auxiliares/")
  }  
  
  pasta_trat = if (!dir.exists(paste0(pasta_geral, "dados_tratados/"))) {
    dir.create(paste0(pasta_geral, "dados_tratados/"))
    paste0(pasta_geral, "dados_tratados/")
  } else {
    paste0(pasta_geral, "dados_tratados/")
  } 
  
  pasta_inter = if (!dir.exists(paste0(pasta_geral, "dados_inter/"))) {
    dir.create(paste0(pasta_geral, "dados_inter/"))
    paste0(pasta_geral, "dados_inter/")
  } else {
    paste0(pasta_geral, "dados_inter/")
  } 
  
  pasta_resultados = if (!dir.exists(paste0(pasta_geral, "resultados/"))) {
    dir.create(paste0(pasta_geral, "resultados/"))
    paste0(pasta_geral, "resultados/")
  } else {
    paste0(pasta_geral, "resultados/")
  }  
  
  pasta_desc = if (!dir.exists(paste0(pasta_resultados, "descritivo/"))) {
    dir.create(paste0(pasta_resultados, "descritivo/"))
    paste0(pasta_resultados, "descritivo/")
  } else {
    paste0(pasta_resultados, "descritivo/")
  } 
  
  pasta_biv = if (!dir.exists(paste0(pasta_resultados, "bivariada/"))) {
    dir.create(paste0(pasta_resultados, "bivariada/"))
    paste0(pasta_resultados, "bivariada/")
  } else {
    paste0(pasta_resultados, "bivariada/")
  } 
  
  pasta_mult = if (!dir.exists(paste0(pasta_resultados, "multivariada/"))) {
    dir.create(paste0(pasta_resultados, "multivariada/"))
    paste0(pasta_resultados, "multivariada/")
  } else {
    paste0(pasta_resultados, "multivariada/")
  } 
  
  pasta_acr = if (!dir.exists(paste0(pasta_resultados, "acuracia/"))) {
    dir.create(paste0(pasta_resultados, "acuracia/"))
    paste0(pasta_resultados, "acuracia/")
  } else {
    paste0(pasta_resultados, "acuracia/")
  } 

}
