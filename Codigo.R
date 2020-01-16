library(readxl)
library(forecast)
for (i in 121:133){
  varEspaço = i
  varRange = paste("A1:B",varEspaço, sep="")
  varRange
  rec_xls <- read_excel("V:/03. Estudos em ESTATISTICOS/01. Estudo Previsão Receita/Receita Bruta Acumulada.xls",
                        range = varRange, col_types = c("date", "numeric"))
  rec=rec_xls[,-1]
  rec_ts = ts(rec, start = 2009, freq=12)
  #arima_rec = auto.arima(rec_ts)
  arima_manual = arima(rec_ts, order=c(2,1,0), seasonal = list(order = c(0,0,1), period = 12))
  #RESULTADO ARIMA
  #prevarima_rec    = forecast(arima_rec,    h=1, level = c(45, 55, 65, 75))
  prevarima_manual = forecast(arima_manual, h=1, level = c(45, 55, 65, 75))
  ##print(rec_ts)
  #print("###########################################################################################################")
  write.csv2(prevarima_manual)
  ##print("###########################################################################################################") 
  #print("###########################################################################################################")
  #print("###########################################################################################################")
}