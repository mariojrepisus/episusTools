
#' Análise Bivariada com Múltiplas Combinações de Exposição e Desfecho
#'
#' Para cada par exposição × desfecho, calcula a razão de prevalência (RP)
#' com IC 95% e p-valor via `epitools::riskratio()`, retornando os resultados
#' em formato longo.
#'
#' @param banco Data frame com os dados.
#' @param expos Vetor de nomes (strings) das variáveis de exposição.
#' @param desf Vetor de nomes (strings) das variáveis de desfecho.
#' @param valores Vetor com os dois níveis do fator, em ordem
#'   (ex.: `c("Sim", "Não")`).
#'
#' @return Tibble em formato longo com as métricas para cada combinação
#'   exposição × desfecho.
#' @export
#'
#' @examples
#' \dontrun{
#'   tab_biv(banco,
#'           expos  = c("expo1", "expo2"),
#'           desf   = c("desf1"),
#'           valores = c("Sim", "Não"))
#' }

tab_biv <- function(banco, expos, desf, valores){
  results <- vector("list", length(expos))
  names(results) <- expos
  
  cat(
    "\n\n####   Análise bivariada com várias combinações   ####\n\nAnalisando",
    length(expos), "exposições e", length(desf), "desfechos\n\n"
  )
  
  for(i in seq_along(expos)){
    exp <- expos[i]
    linha <- list(expo = exp)
    
    for(des in desf){
      
      data = banco|>
        filter(.data[[exp]] %in% valores & 
                 .data[[des]] %in% valores)|>
        mutate(!!exp := factor(.data[[exp]],
                               labels = valores,
                               levels = valores),
               !!des := factor(.data[[des]],
                               labels = valores,
                               levels = valores))
      
      res = epitab(data[[exp]], data[[des]],
             method = "riskratio", pvalue = "fisher.exact")
      
      tab = table(data[[exp]], data[[des]])
      
      a      = as.numeric(tab[2, 2])
      b      = as.numeric(tab[2, 1])
      c      = as.numeric(tab[1, 2])
      d      = as.numeric(tab[1, 1])
      


      if(a == 0 | b == 0 | c == 0 | d == 0){ tab = tab + 1 }
      
      res1 <- epitools::riskratio(tab)
      
      
      # Ajuste conforme a estrutura de res$tab na sua versão do epitools
      n      = nrow(data)
      a      = as.numeric(res$tab[2, 3])
      b      = as.numeric(res$tab[2, 1])
      c      = as.numeric(res$tab[1, 3])
      d      = as.numeric(res$tab[1, 1])
      pa      = as.numeric(res$tab[2, 4])
      pb      = as.numeric(res$tab[2, 2])
      pc      = as.numeric(res$tab[1, 4])
      pd      = as.numeric(res$tab[1, 2])
      rr     <- as.numeric(res1$measure[2, 1])
      inf95  <- as.numeric(res1$measure[2, 2])
      sup95  <- as.numeric(res1$measure[2, 3])
      pvalor <- as.numeric(res1$p.value[2, 2])
      

      # Armazena já com nomes "desfecho_medida"
      linha[[paste0(des, "_-n")]]       <- n
      linha[[paste0(des, "_-a")]]       <- a
      linha[[paste0(des, "_-b")]]       <- b
      linha[[paste0(des, "_-c")]]       <- c
      linha[[paste0(des, "_-d")]]       <- d
      linha[[paste0(des, "_-Pa")]]      <- round(pa*100,1)
      linha[[paste0(des, "_-Pb")]]      <- round(pb*100,1)
      linha[[paste0(des, "_-Pc")]]      <- round(pc*100,1)
      linha[[paste0(des, "_-Pd")]]      <- round(pd*100,1)
      linha[[paste0(des, "_-rp")]]      <- round(rr,    3)
      linha[[paste0(des, "_-infic95")]] <- round(inf95, 3)
      linha[[paste0(des, "_-supic95")]] <- round(sup95, 3)
      linha[[paste0(des, "_-pvalor")]]  <- round(pvalor,3)
      
      cat("\nAnálise de ",
          exp, " x ", des,
          " realizado. N =",
          formatC(n,    format = "f", digits = 0, big.mark = ".", decimal.mark = ","),
          "\nRP =",
          formatC(rr,    format = "f", digits = 2),
          " (",
          formatC(inf95, format = "f", digits = 2),
          "-",
          formatC(sup95, format = "f", digits = 2),
          ")  p =",
          formatC(pvalor, format = "f", digits = 3),
          "\n"
      )
    }
    
    results[[i]] <- tibble::as_tibble(linha) |>
      tidyr::pivot_longer(
        cols = -expo,                # todas as colunas menos 'expo'
        names_to = c("desf", "medida"),
        names_sep = "_-",
        values_to = "valor"
      )|>
      pivot_wider(
        names_from = medida,
        values_from = valor
      )

  }
  
  final <- dplyr::bind_rows(results)
  cat("\n\nAnálise finalizada\n")
  return(final)
}
