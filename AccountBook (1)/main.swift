struct Tag {
    var tag_num : Int
    var tag_name : String
    
    
    init(tag_num : Int, tag_name : String){
        self.tag_num = tag_num
        self.tag_name = tag_name
        
    } // 구조체 초기화
    
} //구조체 선언

var tags : [Tag] = 
[Tag (tag_num: 0, tag_name: " 없습니다." ), Tag (tag_num: 1, tag_name: "식비" ), Tag (tag_num: 2, tag_name: "주거/통신" ), Tag (tag_num: 3, tag_name: "의복/미용" ), Tag (tag_num: 4, tag_name: "건강/문화" ), Tag (tag_num: 5, tag_name: "교육/육아" ), Tag (tag_num: 6, tag_name: "교통/차량" ), Tag (tag_num: 7, tag_name: "기타" )]
//구조체를 사용하여 분류별 정보

class AccountBook {
    var date = ""  
    var tag_num = ""
    var note = ""
    var money = ""

    var income=[""] // 수입정보 저장하는 배열
    var incomelist=[[""]]  //이중 배열을 통해 수입을 리스트에 배열로 저장

    var expend=[""] // 지출 정보 저장하는 배열
    var expendlist=[[""]]  // 이중배열로 지출 리스트를 배열로 저장
    
    init(date: String, tag_num: String,note:String, money: String){
      self.date = date
      self.tag_num = tag_num
      self.note = note
      self.money = money
      
      self.income = [date,tag_num,note,money]
      self.incomelist[0] = self.income
      self.expend = [date,tag_num,note,money]
      self.expendlist[0] = self.expend
    } //초기화
    
    func add_income(date: String, tag_num: String,note:String, money: String) {
      self.income = [date,tag_num,note,money] //income 배열에 받아온 정보를 저장
      print("-------[날짜,분류,상세정보,금액]--------")
      print("[수입]:\(self.income)")
      print("\n저장하시겠습니까?")
      print("      1.예 2.아니요")
      //저장 유무 묻기
      let input = readLine()!
      if input == "1"{
      self.incomelist.append(self.income) //income 배열을 list에 저장 
         print("\n[입력완료]\n")
      }else if input == "2"{
        print("      [취소완료]")
      }
    } //수입저장기능
  
 func add_expend(date: String, tag_num: String,note:String, money: String) {
      self.expend = [date,tag_num,note,money] //배열에 저장
   
      print("\n-------[날짜,분류,상세정보,금액]--------")
      print("[지출]:\(self.expend)")
      print("\n저장하시겠습니까?")
      print("      1.예 2.아니요")
      //저장 유무 묻기
      let input = readLine()!
      if input == "1"{
      self.expendlist.append(self.expend)   
        print("\n[입력완료]\n")
      }else if input == "2"{
       print("      [취소완료]")
      }
    } //지출저장기능
    
    func choice()-> String {
      print("[분류]")
      print("1.식비 2주거통신 3.의복미용 4.건강문화 5.교육육아 6.교통차량 7.기타")
      let input = readLine()!
      let select2 = Int(input)
      var selecttags = ""

      for selecttag in tags {
        if selecttag.tag_num == select2{
          selecttags = selecttag.tag_name
        }
      }// 선택한 분류의 번호를 통해 구조체에 있는 정보를 찾음
      return selecttags //해당정보의 번호를 반환
    } // 분류 tag 선택함수

    func bill() {
      print("-------[날짜,분류,상세정보,금액]--------")
            var sum = 0 //총 수입금을 위한 변수
      for i in stride(from:0,to:incomelist.count, by:1) {
        print("수입\(i+1) \(self.incomelist[i])")
        sum = sum+Int(self.incomelist[i][3])!
      } // 수입에 관한 배열의 정보탐색 및 출력 & 총 수입금 계산
         print("\n총 수입:\(sum)")
       print("-----------------------------------\n")

      var sum1 = 0 // 총 지출금
      for i in stride(from:1,to:expendlist.count, by:1) { 
        //지출의 경우 첫번째 배열에 초기 입력정보가 입력 되어있으므로 두번째 배열인 [1]부터 출력
        print("지출\(i) \(self.expendlist[i])")
        sum1 = sum1+Int(self.expendlist[i][3])!
      }// 지출에 관한 배열의 정보탐색 및 출력 & 총 수입금 계산
         print("\n총 지출:\(sum1)")  
      print("-----------------------------------")
      print("\n나의 총 자산: \(sum-sum1)")
       print("-----------------------------------")
    } // 가계부 전체 목록 보기
  
  func search(sdate: String){
    var sum = 0 // 총 금액 합산을 위한 변수
    print("\n 검색날짜[\(sdate)]\n")
     print("-------[날짜,분류,상세정보,금액]--------")
    for i in stride(from:0,to:incomelist.count, by:1) {
      if self.incomelist[i][0] == sdate{
        print("수입\(i+1) \(self.incomelist[i])")
        sum = sum+Int(self.incomelist[i][3])!
      } // 입력받은 날짜를 찾기위한 조건문if
      } // 수입에 관한 배열의 정보탐색 및 출력 & 총 수입금 계산
    print("\n총 수입액:\(sum)")
      sum = 0
    print("-------[날짜,분류,상세정보,금액]--------")
    for i in stride(from:1,to:expendlist.count, by:1) {
    if self.expendlist[i][0] == sdate{
        print("지출\(i) \(self.expendlist[i])")
      sum = sum+Int(self.expendlist[i][3])!
      }// 입력받은 날짜를 찾기위한 조건문if
    }// 수입에 관한 배열의 정보탐색 및 출력 & 총 수입금 계산
    print("\n총 지출액:\(sum)")
  } //검색기능( 변수만 바꾸면 날짜 분류 상세정보로 검색가능)
  
}

print("[초기 정보 입력]")
print("\n[날짜]")
var idate = readLine()!
var inum = ""
var inote = ""

print("\n [금액]")
var imoney = readLine()!
  // 초기정보를 위한 날짜와 금액 입력받음
var accbook = AccountBook(date:idate, tag_num: "초기자본", note: "기본정보", money: imoney)
 // 인스턴스 생성 및 이니셜라이즈 통해 초기화.

while true {
 print("==========================================")
  print("\n====== 원하시는 메뉴을 선택하세요 ======\n")
  print("|====== 1. 수입 =======|")
  print("|====== 2. 지출 =======|")
  print("|====== 3. 조회 =======|")
 
  let select1 = readLine()! //메뉴 선택변수

  var selecttags = "" // 구조체의 tag정보 받아 저장하기 위한 변수


  if select1 == "1" {
    print("[날짜]")
    idate = readLine()!
    print("[상세정보]")
    inote = readLine()!
    
    selecttags = accbook.choice() 
    
    print("금액")
    imoney = readLine()!
    // 수입 정보 입력
    accbook.add_income(date:idate, tag_num: selecttags, note: inote, money: imoney) // 수입 정보 추가 함수 호출

  } else if select1 == "2" {
   print("[날짜]")
    idate = readLine()!
    print("[상세정보]")
    inote = readLine()!
    
    selecttags = accbook.choice()
    
    print("[금액]")
    imoney = readLine()!
    //지출 정보 입력
    accbook.add_expend(date:idate, tag_num: selecttags, note: inote, money: imoney)// 지출 정보 추가 함수 호출


  } else if select1 == "3"{    
  print("")
  accbook.bill()   // 모든 가계부 출력함수 호출
    while true{ // 여러번 검색을 위한 무한루프 while문
    print("\n검색을 원하시면 1번을 입력.")
    print("메뉴로 돌아가려면 2번을 입력.\n")
    let qsearch = readLine()!
    //조건문을 통해 검색할지 말지.
    if qsearch == "1"{
      print("날짜 선택")
     let sdate = readLine()!
      accbook.search(sdate:sdate) // 검색 함수 호출
      
    }else if qsearch == "2"{
      break; // 검색을 위한 while문 종료
    }
    }
  }
}
