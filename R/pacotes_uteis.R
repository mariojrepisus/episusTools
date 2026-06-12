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
pacotes_uteis <- function() {
  cat("Instalando pacman \n\n")
  utils::install.packages("pacman")

  pkgs <- c(
    "tidyverse", "rlang", "DataExplorer", "gtsummary", "shiny", "janitor",
    "gt", "skimr", "patchwork", "RColorBrewer", "ggpmisc", "epitools",
    "openxlsx", "hablar", "foreign", "plotly", "sf", "ggspatial", "geobr",
    "leaflet", "renv", "cowplot", "flexdashboard", "rio", "here", "devtools",
    "read.dbc", "scales", "classInt", "readxl", "writexl", "reticulate",
    "webshot", "arrow", "abjutils", "sysfonts", "showtext", "ggchicklet",
    "DescTools", "AER", "MuMIn", "broom", "pROC", "performance", "DHARMa",
    "treemapify", "tidytext", "conflicted"
  )

  cat("Instalando v\u00e1rios pacotes legais...\n\n")
  pacman::p_load(char = pkgs)

  cat("Retirando alguns conflitos de funcoes comuns \n\n")
  conflicted::conflict_prefer("select", "dplyr")
  conflicted::conflict_prefer("filter", "dplyr")
  conflicted::conflict_prefer("recode", "dplyr")
  conflicted::conflict_prefer("rename", "dplyr")

  cat("Instalando pacotes para ler bases do Ministerio da Saude",
      "(requer Rtools) \n\n")
  remotes::install_github("danicat/read.dbc")
  remotes::install_github("rfsaldanha/microdatasus")

  invisible(NULL)
}
