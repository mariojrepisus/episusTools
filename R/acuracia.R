#' Realiza análise de acuracia com base em exposições e desfechos binários
#'
#' Com desfechos binários tipo dummy ("Sim", "Não), faz a análise de acuracia
#' de desfechos com base em exposições. Usada primáriamente para 
#' definições de caso
#'
#' @export


analisando_acuracia <- function(banco, 
                                   exposicoes, 
                                   desfechos, 
                                   pasta_results = NULL, 
                                   nome_analise = NULL,
                                   valores = c("Sim", "Não")) {
  
  
  resultados <- data.frame(
    exposicao = character(),
    desfecho = character(),
    a = numeric(),
    b = numeric(),
    c = numeric(),
    d = numeric(),
    sensib = numeric(),
    ic_sensib = character(),
    p_sensib = numeric(),
    especif = numeric(),
    ic_especif = character(),
    p_especif = numeric(),
    vpp = numeric(),
    ic_vpp = character(),
    p_vpp = numeric(),
    vpn = numeric(),
    ic_vpn = character(),
    p_vpn = numeric(),
    acuracia = numeric(),
    ic_acuracia = character(),
    p_acuracia = numeric(),
    Youden = numeric(),
    n_validos = integer(),
    stringsAsFactors = FALSE
  )
  
  cat("\n\n#######  Análise de Acurácia  #######",
      "\n\nExposições: ", paste0(exposicoes,collapse = ", "),
      "\n\nDesfechos: ", paste0(desfechos,collapse = ", "))
  
  for (desf in desfechos) {
    for (expos in exposicoes) {
      
      bd = banco|>
        filter(.data[[expos]] %in% valores & 
                 .data[[desf]] %in% valores)|>
        mutate(!!expos := factor(.data[[expos]],
                               labels = valores,
                               levels = valores),
               !!desf := factor(.data[[desf]],
                               labels = valores,
                               levels = valores))
        
      
      ex <- bd[[expos]]
      de <- bd[[desf]]
      
      n_validos <- nrow(bd)
      # Tabulação
      tbl <- epitools::epitable(ex, de)
      a1 <- tbl[1,1]
      b1 <- tbl[1,2]
      c1 <- tbl[2,1]
      d1 <- tbl[2,2]
      
      a <- tbl[1,1]
      b <- tbl[1,2]
      c <- tbl[2,1]
      d <- tbl[2,2]
      
      if(a == 0|b == 0|c == 0|d == 0){
        a = a+1
        b = b+1
        c = c+1
        d = d+1
      }
      
      # Métricas
      sen <- (a/(a+c))
      esp <- (d/(b+d))
      vpp <- (a/(a+b))
      vpn <- (d/(c+d))
      acr <- ((a+d)/(a+b+c+d))
      j <- (sen + esp - 1)
      
      ic_sens_sup <- sen + ( 1.96 * sqrt( (sen * (1-sen)) / (a+c) ) )
      ic_sens_inf <- sen - ( 1.96 * sqrt( (sen * (1-sen)) / (a+c) ) )
      
      ic_esp_sup <- esp + ( 1.96 * sqrt( (esp * (1-esp)) / (b+d) ) )
      ic_esp_inf =  esp - ( 1.96 * sqrt( (esp * (1-esp)) / (b+d) ) )
      
      ic_vpp_sup <- vpp + ( 1.96 * sqrt( (vpp * (1-vpp)) / (a+b) ) )
      ic_vpp_inf =  vpp - ( 1.96 * sqrt( (vpp * (1-vpp)) / (a+b) ) )
      
      ic_vpn_sup <- vpn + ( 1.96 * sqrt( (vpn * (1-vpn)) / (c+d) ) )
      ic_vpn_inf =  vpn - ( 1.96 * sqrt( (vpn * (1-vpn)) / (c+d) ) )
        
      ic_acr_sup <- acr + ( 1.96 * sqrt( (acr * (1-acr)) / (a+b+c+d) ) )
      ic_acr_inf =  acr - ( 1.96 * sqrt( (acr * (1-acr)) / (a+b+c+d) ) )
      
      
      # IC para proporções
      ic_sens <- list(ic_sens_inf, ic_sens_sup)
      ic_esp <- list(ic_esp_inf, ic_esp_sup)
      ic_vpp <- list(ic_vpp_inf, ic_vpp_sup)
      ic_vpn <- list(ic_vpn_inf, ic_vpn_sup)
      ic_acr = list(ic_acr_inf, ic_acr_sup)

      
      # p-valor para proporções (teste binomial vs 0.5)
      p_sens <- p_valor_z(a, a+c)
      p_esp <- p_valor_z(d, b+d)
      p_vpp <- p_valor_z(a, a+b)
      p_vpn <- p_valor_z(d, c+d)
      p_acr <- p_valor_z(a+d, a+b+c+d)
      

      # Formatar IC e valores
      ic_sensib_fmt  <- paste0(" (", format_perc(ic_sens[[1]]*100), 
                               "-", format_perc(ic_sens[[2]]*100), ")")
      
      ic_especif_fmt <- paste0(" (", format_perc(ic_esp[[1]]*100), 
                               "-", format_perc(ic_esp[[2]]*100), ")")
      
      ic_vpp_fmt     <- paste0(" (", format_perc(ic_vpp[[1]]*100), 
                               "-", format_perc(ic_vpp[[2]]*100), ")")
      
      ic_vpn_fmt     <- paste0(" (", format_perc(ic_vpn[[1]]*100), 
                               "-", format_perc(ic_vpn[[2]]*100), ")")
      
      ic_acr_fmt     <- paste0(" (", format_perc(ic_acr[[1]]*100),
                               "-", format_perc(ic_acr[[2]]*100), ")")
      
      # Adicionar linha ao data frame
      resultados <- rbind(resultados, data.frame(
        exposicao = expos,
        desfecho = desf,    
        a = a1,
        b = b1,
        c = c1,
        d = d1,
        sensib = sen*100,
        ic_sensib = ic_sensib_fmt,
        p_sensib = p_sens,
        especif = esp*100,
        ic_especif = ic_especif_fmt,
        p_especif = p_esp,
        vpp = vpp*100,
        ic_vpp = ic_vpp_fmt,
        p_vpp = p_vpp,
        vpn = vpn*100,
        ic_vpn = ic_vpn_fmt,
        p_vpn = p_vpn,
        acuracia = acr*100,
        ic_acuracia = ic_acr_fmt,
        p_acuracia = p_acr,
        Youden = j*100,
        n_validos = n_validos
      ))
      
      # Mensagem no console
      cat("\n\n#####\n\nExposição ou resultado:",expos,"\nDesfecho ou definição:",desf,
          "\nCasos válidos:", n_validos,
          "\n\na:",a1," b:",b1," \nc:",c1," d:",d1,
          "\n\nsen:",format_perc(sen*100)," ",ic_sensib_fmt,
          "   esp:",format_perc(esp*100)," ",ic_especif_fmt,
          "\nYouden(j):",format_perc(j*100),
          "\nvpp:", format_perc(vpp*100)," ",ic_vpp_fmt,
          "   vpn:", format_perc(vpn*100)," ",ic_vpn_fmt,
          "\nacr:",format_perc(acr*100)," ",ic_acr_fmt, sep = "")
      
    }
  }
    
  if(!is.null(nome_analise) && !is.null(pasta_results)){
    write_csv2(resultados,paste0(pasta_results,
                                nome_analise,"-",
                                format(Sys.time(), "%Y-%m-%d_%H-%M-%S"),
                                ".csv") )
  }
  cat("\n\n")
  return(resultados)
}

p_valor_z = function(x, n, prop = 0.5){
  x = x; n = n; p0 <- prop
  p_obs <- x/n
  Z <- (p_obs - p0) / sqrt(p0 * (1 - p0) / n)
  p_valor <- 2 * (1 - pnorm(abs(Z)))
  return(p_valor)
}

