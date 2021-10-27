## :herb:키워드 검색으로 보는 소셜 네트워크 분석 : 제로 웨이스트 
### **Analysis of networks viewed by blog keyword crawling : Zero Waste**
##### ⠀
## **Crawling Data** 
<p align="center">
  <img src="https://user-images.githubusercontent.com/80669371/125240947-c39be100-e325-11eb-8faa-9a66ccd2d23a.png" alt="factorio thumbnail"/>
</p> 

##### ⠀
## **Data Preprocessing**
#### 데이터 구조 확인 후 타이틀 추출, 불용어 삭제 후 함께 사용된 단어들끼리 묶어 matrix 형태로 객체 생성
<p align="center">
  <img src="https://user-images.githubusercontent.com/80669371/125241604-9ef43900-e326-11eb-810e-3434e3085eda.png" alt="factorio thumbnail"/>
</p> 

## **Social Network Visualization**
#### -Tool : Gephi
### **① Form an entire network**
##### 근접한 노드들끼리 같은 색상을 부여시키고 다른 노드들과 연관성이 높은 노드들의 크기를 키운 뒤, Frunchterman Reingold Layout을 사용하여 네트워크 망 펼치기 
<p align="center">
  <img src="https://user-images.githubusercontent.com/80669371/125243082-8edd5900-e328-11eb-8c71-33cc924c80bb.png" alt="factorio thumbnail"/>
</p> 

##### -실천, 후기, 일상, 라이프, 만들기, 줄이기, 환경, 쓰레기 등의 단어가 추출됨
##### -제로웨이스트 검색시 자주 연관되어 검색되는 단어를 알 수 있었으며, 추출된 단어들 만으로도 제로 웨이스트의 의의를 추측할 수 있었음    
##### ⠀
### **② Detailed Network Analysis**
<p align="center">
  <img src="https://user-images.githubusercontent.com/80669371/125243472-1fb43480-e329-11eb-8413-f8d388a5163a.png" alt="factorio thumbnail"/>
</p> 

##### -제일 큰 네트워크는 '제로'라는 단어를 중심으로 형성되어 있었음
##### -'제로'를 중심으로 환경, 쓰레기, 재활용 줄이기, 나의, 일상, 도전, 등의 단어가 연결 지어짐
##### -일상생활 속에서 사람들이 환경과 지구르 지키기 위해 쓰레기를 줄이고 재활용을 실천하는 등 생활 습관의 변화에 노력을 기울이고 있다는 사실을 알 수 있었음
##### ⠀
<p align="center">
  <img src="https://user-images.githubusercontent.com/80669371/125247075-83406100-e32d-11eb-9f89-12523f59a654.png" alt="factorio thumbnail"/>
</p> 

##### -두번째로 큰 네트워크는 ‘후기’라는 단어를 중심으로 형성되어 있었음
##### -‘후기’를 중심으로 방문, 울산, 대구, 직접, 가게, 구매, 사용, 구입, 카페 등의 단어가 연결 지어짐
##### -실제로 사람들이 소비를 할 때, 생활용품 뿐만 아니라 생활반경 전 범위에 걸쳐 환경에 주의를 기울인다는 사실을 알 수 있었음
##### ⠀
![image](https://user-images.githubusercontent.com/80669371/125246184-66eff480-e32c-11eb-8857-b1c7e3f26008.png)

##### -기존의 플라스틱을 대체하는 친환경 제품들을 직접 만들거나 구매하여 사용하기 시작했다는 사실을 알 수 있었음
##### -각자 환경 관련 DIY 아이템을 만들어 사용하는 것과, 이익을 창출하는 것이 목적인 기업에서 친환경 제품들을 출시하기 시작한 것을 보아 개인과 사회가 모두 환경에 대한 관심이 높아졌음을 알 수 있음
