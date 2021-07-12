## **Analysis of networks viewed by blog keyword crawling : Zero Waste**
#### 키워드 검색으로 보는 소셜 네트워크 분석 : 제로 웨이스트 
⠀
##### Package Used
```
library(httr)
library(rvest)
library(jsonlite)
library(stringr)
library(dplyr)
library(xml2)
library(tm)
library(readr)
library(utils)
library(rJava)
library(memoise)
library(multilinguer)
install_jdk()
install.packages(c("stringr","hash","Sejong","RSQLite","devtools"),type="binary")
library(remotes)
remotes::install_github("haven-jeon/KoNLP",upgrade="never",INSTALL_opts=c("--no-multiarch"))
library(KoNLP)
```
⠀
### **Crawling Data** 
```
blog <- c()

for (i in 1: 30) {
  GET(url = "https://section.blog.naver.com/ajax/SearchList.nhn",
      query = list("countPerPage" = "7",
                   "currentPage" = i,
                   "endDate" = "2020-12-31",
                   "keyword" = "제로웨이스트",
                   "orderBy" = "sim",
                   "startDate" = "2020-01-01",
                   "type" = "post"),
      add_headers("referer" = "https://section.blog.naver.com/Search/Post.nh")) %>% 
      httr::content(as = "text") %>% str_remove(pattern = '\\)\\]\\}\',') %>% fromJSON() -> naverBlog
  
  data <- naverBlog$result$searchList
  blog <- bind_rows(blog, data) 
  
  cat(i, "번째 페이지 크롤링 완료\n")
  Sys.sleep(time = 3)
}
```
<p align="center">
  <img src="https://user-images.githubusercontent.com/80669371/125240947-c39be100-e325-11eb-8faa-9a66ccd2d23a.png" alt="factorio thumbnail"/>
</p> 

### **Preprocess Data**
```
#데이터 구조 확인 후 타이틀 추출
glimpse(blog)
blog <- blog %>% select(1, 2, 6) %>% rename(id = blogId, no = logNo, title = noTagTitle) %>% 
mutate(url = str_glue("http://blog.naver.com/PostView.nhn?blogId={id}&logNo={no}"), contents = NA)
title <- blog[,3]


#불용어 삭제
title <- str_replace_all(title,"&#39;","")
title <- str_replace_all(title,"&amp;","")


#명사 추출하여 함께 사용된 단어끼리 묶어 matrix 형태로 객체 생성 후 csv 파일로 변환 및 저장
cps = Corpus(VectorSource(title))
tdm <- TermDocumentMatrix(cps,
                          contro=list(tokenize = extractNoun,
                                      removePuntuation = T,
                                      removeNumbers = T,
                                      wordLengths = c(2,10),
                                      weighting = weightBin))
tdm.matrix <- as.matrix(tdm)

word.count = rowSums(tdm.matrix)
word.order = order(word.count,decreasing = T)
freq.word = tdm.matrix[word.order[1:500],]
rownames(tdm.matrix)[word.order[1:500]]

co.matrix <- freq.word %*% t(freq.word)

write.csv(co.matrix,"result.csv")
```
<p align="center">
  <img src="https://user-images.githubusercontent.com/80669371/125241604-9ef43900-e326-11eb-810e-3434e3085eda.png" alt="factorio thumbnail"/>
</p> 

### **Social Network Visualization**
#### -Tool : Gephi
#### **① Form an entire network**
##### 근접한 노드들끼리 같은 색상을 부여시키고 다른 노드들과 연관성이 높은 노드들의 크기를 키운 뒤, Frunchterman Reingold Layout을 사용하여 네트워크 망 펼치기 
<p align="center">
  <img src="https://user-images.githubusercontent.com/80669371/125243082-8edd5900-e328-11eb-8c71-33cc924c80bb.png" alt="factorio thumbnail"/>
</p> 
##### -실천, 후기, 일상, 라이프, 만들기, 줄이기, 환경, 쓰레기 등의 단어가 추출됨
##### -제로웨이스트 검색시 자주 연관되어 검색되는 단어를 알 수 있었으며, 추출된 단어들 만으로도 제로 웨이스트의 의의를 추측할 수 있었음    

#### **② Detailed Network Analysis**
<p align="center">
  <img src="https://user-images.githubusercontent.com/80669371/125243472-1fb43480-e329-11eb-8413-f8d388a5163a.png" alt="factorio thumbnail"/>
</p> 
##### -제일 큰 네트워크는 '제로'라는 단어를 중심으로 형성되어 있었음
##### -'제로'를 중심으로 환경, 쓰레기, 재활용 줄이기, 나의, 일상, 도전, 등의 단어가 연결 지어짐
##### -일상생활 속에서 사람들이 환경과 지구르 지키기 위해 쓰레기를 줄이고 재활용을 실천하는 등 생활 습관의 변화에 노력을 기울이고 있다는 사실을 알 수 있었음
