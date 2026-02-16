format_n_int = function(n){
  val_texto = formatC(n,format = "f", digits = 0, big.mark = ".", decimal.mark = ",")
  return(val_texto)
}

format_perc = function(n){
  val_texto = formatC(n,format = "f", digits = 1, big.mark = ".", decimal.mark = ",")
  return(val_texto)
}

format_est = function(n){
  val_texto = formatC(n,format = "f", digits = 2, big.mark = ".", decimal.mark = ",")
  return(val_texto)
}

format_pvalor = function(n){
  val_texto = formatC(n,format = "f", digits = 3, big.mark = ".", decimal.mark = ",")
  return(val_texto)
}

format_n_perc = function(n,perc){
  texto_n_perc = paste0(format_n_int(n),
                        ifelse(perc >= 10," ","  "),
                        "(",
                        format_perc(perc),
                        "%)")
  return(texto_n_perc)
}

format_est_ic95 = function(est,ici,ics){
  texto_n_perc = paste0(format_est(est),
                        " (",
                        format_est(ici),
                        " - ",
                        format_est(ics),
                        ")")
  return(texto_n_perc)
}
