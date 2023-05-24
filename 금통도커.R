system('docker run -d -p 4445:4444 selenium/standalone-firefox-debug')

remDr <- remoteDriver(
  remoteServerAddr = "localhost", 
  port = 4448, 
  browserName = "firefox"
)

remDr$getStatus()

remDr$close()
remDr$open()

remDr$navigate("https://finance.naver.com/sise/sise_market_sum.naver")
remDr$screenshot(display = TRUE)

#remDr$getTitle()

# 웹 페이지에서 HTML 가져오기
page_source <- remDr$getPageSource()[[1]]
library(rvest)
# HTML 파싱 및 필요한 데이터 추출
page <- read_html(page_source)

# 예시: 종목명 추출
stock_names <- page %>%
  html_nodes("table.type_2 tr td:nth-child(2) a.tltle") %>%
  html_text()

stock_names

webElem<-remDr$findElements(using="css",value="input[checked]")
for ( i in 1:length(webElem))webElem[[1]]$clickElement
option<-paste("option",1:27,sep="")

for ( i in 1:length(webElem)) {
  webElem<-remDr$findElements(using="css",i)
  webElem$clickElement()
}

