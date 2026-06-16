#' Instala e Carrega Pacotes Úteis para Análise de Dados
#'
#' Instala o pacote `pacman` e o usa para carregar uma seleção de pacotes
#' úteis para análise de dados em epidemiologia. Também instala pacotes
#' específicos do Ministério da Saúde via GitHub.
#'
#' @return Invisível. Executada pelos efeitos colaterais de instalação e
#'   carregamento de pacotes.
#' @export
#'
#' @examples
#' \dontrun{
#'   pacotes_uteis()
#' }


  cat("Instalando vários pacotes legais...\n\n")
  pacman::p_load(
    tidyverse,
    rlang,
    DataExplorer,
    gtsummary,
    shiny,
    janitor,
    gt,
    skimr,
    patchwork,
    RColorBrewer,
    ggpmisc,
    epitools,
    openxlsx,
    hablar,
    foreign,
    plotly,
    sf,
    ggspatial,
    geobr,
    leaflet,
    renv,
    cowplot,
    flexdashboard,
    rio,
    here,
    devtools,
    read.dbc,
    scales,
    classInt,
    readxl,
    writexl,
    reticulate,
    webshot,
    arrow,
    abjutils,
    sysfonts,
    showtext,
    ggchicklet,
    DescTools,
    AER,
    MuMIn,
    broom,
    pROC,
    performance,
    DHARMa,
    treemapify,
    tidytext,
    conflicted
  )

  cat("Retirando alguns conflitos de funções comuns \n\n")
  conflict_prefer("select", "dplyr")
  conflict_prefer("filter", "dplyr")
  conflict_prefer("recode", "dplyr")
  conflict_prefer("rename", "dplyr")

  cat("Instalando pacotes para ler bases de dados do Ministério da Saúde (precisa ter Rtools instalado) \n\n")
  remotes::install_github("danicat/read.dbc")
  remotes::install_github("rfsaldanha/microdatasus")

}
