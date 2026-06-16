#' Análise de Acurácia com Base em Exposições e Desfechos Binários
#'
#' Para desfechos binários tipo dummy (ex.: "Sim", "Não"), calcula
#' sensibilidade, especificidade, VPP, VPN e acurácia com IC 95% e p-valores.
#'
#' @param banco Data frame com os dados.
#' @param exposicoes Vetor de nomes das variáveis de exposição.
#' @param desfechos Vetor de nomes das variáveis de desfecho.
#' @param pasta_results Caminho da pasta para salvar o resultado em CSV (opcional).
#' @param nome_analise Nome do arquivo de saída, sem extensão (opcional).
#' @param valores Vetor com os dois níveis do fator (padrão: c("Sim", "Nao")).
#' @return Data frame com as métricas de acurácia para cada par exposição × desfecho.
#' @export
analisando_acuracia <- function(banco,
                                exposicoes,
                                desfechos,
                                pasta_results = NULL,
                                nome_analise  = NULL,
                                valores       = c("Sim", "Nao")) {
  resultados <- data.frame(
    exposicao    = character(),
    desfecho     = character(),
    a            = numeric(),
    b            = numeric(),
    c            = numeric(),
    d            = numeric(),
    sensib       = numeric(),
    ic_sensib    = character(),
    p_sensib     = numeric(),
    especif      = numeric(),
    ic_especif   = character(),
    p_especif    = numeric(),
    vpp          = numeric(),
    ic_vpp       = character(),
    p_vpp        = numeric(),
    vpn          = numeric(),
    ic_vpn       = character(),
    p_vpn        = numeric(),
    acuracia     = numeric(),
    ic_acuracia  = character(),
    p_acuracia   = numeric(),
    Youden       = numeric(),
    n_validos    = integer(),
    stringsAsFactors = FALSE
  )

  cat("

#######  Analise de Acuracia  #######",
      "

Exposicoes: ", paste0(exposicoes, collapse = ", "),
      "

Desfechos: ",  paste0(desfechos,  collapse = ", "))

  for (desf in desfechos) {
    for (expos in exposicoes) {
      bd <- banco |>
        dplyr::filter(
          .data[[expos]] %in% valores &
          .data[[desf]]  %in% valores
        ) |>
        dplyr::mutate(
          !!expos := factor(.data[[expos]], labels = valores, levels = valores),
          !!desf  := factor(.data[[desf]],  labels = valores, levels = valores)
        )

      ex <- bd[[expos]]
      de <- bd[[desf]]
      n_validos <- nrow(bd)
      tbl <- epitools::epitable(ex, de)

      a1 <- tbl[1, 1]; b1 <- tbl[1, 2]
      c1 <- tbl[2, 1]; d1 <- tbl[2, 2]
      a  <- a1; b <- b1; c <- c1; d <- d1

      if (a == 0 | b == 0 | c == 0 | d == 0) {
        a <- a + 1; b <- b + 1; c <- c + 1; d <- d + 1
      }

      sen <- a / (a + c)
      esp <- d / (b + d)
      vpp <- a / (a + b)
      vpn <- d / (c + d)
      acr <- (a + d) / (a + b + c + d)
      j   <- sen + esp - 1

      ic_format <- function(est, n) {
        inf <- est - 1.96 * sqrt(est * (1 - est) / n)
        sup <- est + 1.96 * sqrt(est * (1 - est) / n)
        paste0(" (", format_perc(inf * 100), "-", format_perc(sup * 100), ")")
      }

      ic_sensib_fmt  <- ic_format(sen, a + c)
      ic_especif_fmt <- ic_format(esp, b + d)
      ic_vpp_fmt     <- ic_format(vpp, a + b)
      ic_vpn_fmt     <- ic_format(vpn, c + d)
      ic_acr_fmt     <- ic_format(acr, a + b + c + d)

      p_sens <- p_valor_z(a, a + c)
      p_esp  <- p_valor_z(d, b + d)
      p_vpp  <- p_valor_z(a, a + b)
      p_vpn  <- p_valor_z(d, c + d)
      p_acr  <- p_valor_z(a + d, a + b + c + d)

      resultados <- rbind(resultados, data.frame(
        exposicao   = expos,
        desfecho    = desf,
        a = a1, b = b1, c = c1, d = d1,
        sensib      = sen * 100, ic_sensib    = ic_sensib_fmt,  p_sensib   = p_sens,
        especif     = esp * 100, ic_especif   = ic_especif_fmt, p_especif  = p_esp,
        vpp         = vpp * 100, ic_vpp       = ic_vpp_fmt,     p_vpp      = p_vpp,
        vpn         = vpn * 100, ic_vpn       = ic_vpn_fmt,     p_vpn      = p_vpn,
        acuracia    = acr * 100, ic_acuracia  = ic_acr_fmt,     p_acuracia = p_acr,
        Youden      = j   * 100,
        n_validos   = n_validos
      ))

      cat("

#####

Exposicao:", expos, "
Desfecho:", desf,
          "
Casos validos:", n_validos,
          "

a:", a1, " b:", b1, " 
c:", c1, " d:", d1,
          "

sen:", format_perc(sen * 100), ic_sensib_fmt,
          "   esp:", format_perc(esp * 100), ic_especif_fmt,
          "
Youden(j):", format_perc(j * 100),
          "
vpp:", format_perc(vpp * 100), ic_vpp_fmt,
          "   vpn:", format_perc(vpn * 100), ic_vpn_fmt,
          "
acr:", format_perc(acr * 100), ic_acr_fmt, sep = "")
    }
  }

  if (!is.null(nome_analise) && !is.null(pasta_results)) {
    readr::write_csv2(
      resultados,
      paste0(pasta_results, nome_analise, "-",
             format(Sys.time(), "%Y-%m-%d_%H-%M-%S"), ".csv")
    )
  }

  cat("

")
  return(resultados)
}
