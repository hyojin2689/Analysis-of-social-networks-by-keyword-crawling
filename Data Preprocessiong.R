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
