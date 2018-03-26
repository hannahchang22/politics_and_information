install.packages('rvest')  #安裝rvest套件
library(rvest) #開啟rvest套件

#輸入你要爬取網頁的網址，爬取此網頁的html資訊
title=read_html("http://sports.ltn.com.tw/baseball")   
 
#函數首先代入剛剛的網頁資訊，逗號後就是很重要的輸入你前面使用Selector複製的程式碼，他會從此網頁中篩選出剛剛你想要爬的新聞標題。 
title=html_nodes(title,".boxTitle .listA .list_title")   

title=html_text(title)   # 只篩選出文字
title=iconv(title,"UTF-8")  #若是文字出現亂碼，將格式改成可以辨識的形式
title

url=read_html("http://sports.ltn.com.tw/baseball") #爬取同一個網頁
url=html_nodes(url,".boxTitle .listA a")  
#這裡要注意，使用Selector選區塊時不要按在標題上，要點在旁邊，框框會比點在標題上面大喔，
#所以所選出來的程式碼和剛剛的不一樣。

#選擇html頁面中的連結網址的部分(若使用剛剛爬標題的Selector碼會跑不出來，出現NA)
url=html_attr(url,"href")  
url

artDate=read_html("http://sports.ltn.com.tw/baseball")
artDate=html_nodes(artDate,".boxTitle .listA .date")
artDate=html_text(artDate)
artDate

artContent=read_html("http://sports.ltn.com.tw/news/breakingnews/2376583")
artContent=html_nodes(artContent, ".news_p")
artContent=html_text(artContent)
artContent=iconv(artContent, 'utf-8')
artContent

df <- data.frame(title, url, artDate)
View(df)
