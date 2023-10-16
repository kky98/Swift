struct Tag {
    var tag_num : Int
    var tag_name : String
    
    
    init(tag_num : Int, tag_name : String){
        self.tag_num = tag_num
        self.tag_name = tag_name
        
    }
    
}


var tags : [Tag] = [Tag (tag_num: 0, tag_name: " 없습니다." ), Tag (tag_num: 1, tag_name: "식비" ), Tag (tag_num: 2, tag_name: "주거/통신" ), Tag (tag_num: 3, tag_name: "의복/미용" ), Tag (tag_num: 4, tag_name: "건강/문화" ), Tag (tag_num: 5, tag_name: "교육/육아" ), Tag (tag_num: 6, tag_name: "교통/차량" ), Tag (tag_num: 7, tag_name: "기타" )]



class AccountBook {
    var date = ""  
    var tag_num = ""
    var note = ""
    var money = ""

    var income=[""]
    var incomelist=[[""]]

  var expend=[""]
  var expendlist=[[""]]
    
    init(date: String, tag_num: String,note:String, money: String){
      self.date = date
      self.tag_num = tag_num
      self.note = note
      self.money = money
      
      self.income = [date,tag_num,note,money]
      self.incomelist[0] = self.income
      
       self.expend = [date,tag_num,note,money]
      self.expendlist[0] = self.expend
    }
    
    func add_income(date: String, tag_num: String,note:String, money: String) {
      self.income = [date,tag_num,note,money]
      print("-------[날짜,분류,상세정보,금액]--------")
      print("[수입]:\(self.income)")
      print("\n입력하신 정보가 맞습니까?")
      print("      1.예 2.아니요")
      let input = readLine()!
      if input == "1"{
      self.incomelist.append(self.income)  
         print("\n[입력완료]\n")
      }else if input == "2"{
        print("      [취소완료]")
      }
    } //저장기능
 func add_expend(date: String, tag_num: String,note:String, money: String) {
      self.expend = [date,tag_num,note,money]
   
      print("\n-------[날짜,분류,상세정보,금액]--------")
      print("[지출]:\(self.expend)")
      print("\n입력하신 정보가 맞습니까?")
      print("      1.예 2.아니요")
      let input = readLine()!
      if input == "1"{
      self.expendlist.append(self.expend)   
        print("\n[입력완료]\n")
      }else if input == "2"{
       print("      [취소완료]")
      }
    } //저장기능
    

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
      }
      return selecttags
    }    


    func bill() {
      print("-------[날짜,분류,상세정보,금액]--------")
            var sum = 0
      for i in stride(from:0,to:incomelist.count, by:1) {
        print("수입\(i+1) \(self.incomelist[i])")
        sum = sum+Int(self.incomelist[i][3])!
      }
         print("\n총 수입액:\(sum)")
       print("-----------------------------------\n")

      var sum1 = 0
      for i in stride(from:1,to:expendlist.count, by:1) {
        print("지출\(i) \(self.expendlist[i])")
        sum1 = sum1+Int(self.expendlist[i][3])!
      }
         print("\n총 지출액:\(sum1)")  
      print("-----------------------------------")
      print("\n나의 총 자산: \(sum-sum1)")
    }
    


}
print("[초기 정보 입력]")
print("\n[날짜]")
var idate = readLine()!

var inum = ""

var inote = ""
print("\n [금액]")
var imoney = readLine()!
 
var accbook = AccountBook(date:idate, tag_num: "초기자본", note: "기본정보", money: imoney)
 


while true {
 print("==========================================")
  print("\n====== 원하시는 옵션을 선택하세요 ======\n")
  print("|====== 1. 수입 =======|")
  print("|====== 2. 지출 =======|")
  print("|====== 3. 조회 =======|")
 

  let select1 = readLine()!


  var selecttags = ""


  if select1 == "1" {
    print("[날짜]")
    idate = readLine()!
    print("[상세정보]")
    inote = readLine()!
    
    selecttags = accbook.choice()
    
    print("금액")
    imoney = readLine()!
    accbook.add_income(date:idate, tag_num: selecttags, note: inote, money: imoney)
   
    

  } else if select1 == "2" {
   print("[날짜]")
    idate = readLine()!
    print("[상세정보]")
    inote = readLine()!
    
    selecttags = accbook.choice()
    
    print("[금액]")
    imoney = readLine()!
    accbook.add_expend(date:idate, tag_num: selecttags, note: inote, money: imoney)
    print("\n[입력완료]\n")

  } else if select1 == "3"{
  print("")
  accbook.bill()    
  }
  

}