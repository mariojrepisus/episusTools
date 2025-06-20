#' Instala e Carrega Pacotes Úteis
#'
#' Esta função instala o pacote \code{pacman} e, em seguida, utiliza-o para
#' carregar diversos pacotes úteis para análise de dados. Também instala
#' pacotes específicos do Ministério da Saúde via GitHub.
#'
#' @export
#'
#' @examples
#' \dontrun{
#'   pacotes_uteis()
#' }
pacotes_uteis <- function() {
  cat("Instalando pacman \n\n")
  install.packages("pacman")

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
    gtsummary,
    flexdashboard,
    rio,
    here,
    devtools
  )

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
    gtsummary,
    flexdashboard,
    rio,
    here,
    devtools
  )

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
    gtsummary,
    flexdashboard,
    rio,
    here,
    devtools
  )


  cat("Instalando pacotes para ler bases de dados do Ministério da Saúde (precisa ter Rtools instalado) \n\n")
  remotes::install_github("danicat/read.dbc")
  remotes::install_github("rfsaldanha/microdatasus")
}
