
struct account{
  var name : String
  var account : String
  var balance : Int
// 기존 설정된 계좌 스트럭쳐
    init(name : String, account : String, balance: Int){
        self.name = name
        self.account = account
        self.balance = balance
    }
}

var existing_account : [account] = 
[account (name: "김규영", account: "123456789" , balance: 1000), account (name: "장정우", account: "987654321" , balance: 1000), account (name: "권택원", account: "333333333" , balance: 1000), account (name: "최진명", account: "444444444" , balance: 1000),  account (name: "김두연", account: "555555555" , balance: 1000), account (name: "홍길동", account: "666666666" , balance: 1000), account (name: "홍길순", account: "777777777" , balance: 1000)]
  


class Bank {
  // 새로 계좌 개설
  var name : String
  var account : String
  var balance : Int 

  
  

    init(name : String, account : String, balance: Int){
        self.name = name
        self.account = account
        self.balance = balance
       
    }
  
  

  func save(save_money:Int, index_num:Int ) {
    self.balance = self.balance + save_money
    existing_account[index_num].balance = self.balance
     print("\n[입금완료]")
    print("\n[계좌번호]: \(self.account)")
          
  }
   func nsave(save_money:Int) {
    self.balance = self.balance + save_money
     print("\n[입금완료]")
    print("\n[계좌번호]: \(self.account)")
    print("[계좌잔고]: \(self.balance) ")        
  }

  func take_out(takeout_money:Int,index_num:Int ) {
    self.balance = self.balance - takeout_money
    existing_account[index_num].balance = self.balance
     print("[출금완료]")
        print("\n[계좌번호]: \(self.account)")
  }
  func ntake_out(takeout_money:Int) {
    self.balance = self.balance - takeout_money
     print("\n[출금완료]")
    print("\n[계좌번호]: \(self.account)")
    print("[계좌잔고]: \(self.balance) ") 
  }
  

  func tbank(tmoney:Int,index_num:Int,index_num2:Int){
    existing_account[index_num].balance = existing_account[index_num].balance - tmoney
    existing_account[index_num2].balance = existing_account[index_num2].balance + tmoney
  }
  func ntbank(tmoney:Int,index_num2:Int){
   self.balance = self.balance - tmoney
    existing_account[index_num2].balance = existing_account[index_num2].balance + tmoney
  }
 
      
  
      }
  

  


// 사용자 기본 메뉴 출력 횟수를 줄이기 위해 외부 함수 사용
func start(){
    print("\n|==========================================|")
    print("|======= 원하시는 옵션을 선택하세요 =======|\n")
    print("|====== 1. 입금 ===============|")
    print("|====== 2. 출금 ===============|")
    print("|====== 3. 계좌 이체 ==========|")
    print("|====== 4. 계좌 정보 출력 =====|")
    print("|====== 5. 종료 ===============|")
}


while true{
print("\n|===   어서오세요 ECC은행 입니다.     ==|")
print("\n|==   기존 고객님은 1번을 눌러주세요. ==|")
print("\n|==  신규 고객님은 2번을 눌러주세요.  ==|\n")

let cnum = readLine()!
// 고객 넘버
if cnum == "1" {// 기존 고객

  print("\n계좌번호를 입력해주세요\n")
 let input_account = readLine()!
 
  for i in stride(from:0,to:existing_account.count, by:1) { //기존 계좌 확인
     if existing_account[i].account == input_account{
    
     let bank = Bank(name: existing_account[i].name, account: existing_account[i].account, balance: existing_account[i].balance)
  
    while true {
    start()

    let select1 = readLine()!
      
    if select1 == "1"{
      print("\n입금하실 금액을 입력하세요")
      let money = readLine()!
      let money2 = Int(money)!
      bank.save(save_money:money2, index_num:i)
      
      print("입금후 잔고:\(existing_account[i].balance)")
    
    } else if select1 == "2"{
      print("\n출금하실 금액을 입력하세요")
      let money = readLine()!
      let money2 = Int(money)!
      bank.take_out(takeout_money:money2,index_num:i)
   
       print("출금후 잔고:\(existing_account[i].balance)")
    } else if select1 == "3"{
      print("\n계좌이체할 계좌를 입력하세요")
      let input_account2 = readLine()!
      print("\n계좌이체할 금액을 입력하세요")
      let money = readLine()!
      let money2 = Int(money)!

       for n in stride(from:0,to:existing_account.count, by:1) { //기존 계좌 확인
       if existing_account[n].account == input_account2{
         bank.tbank(tmoney:money2,index_num:i, index_num2:n)
                  print("계좌[\(existing_account[n].account)] 잔고: \(existing_account[n].balance)")
         
         }

       }
       print("계좌[\(existing_account[i].account)] 잔고::\(existing_account[i].balance)")
      
    
    } else if select1 == "4"{
      print("\n 계좌번호를 입력하시오.")
      let input_account2 = readLine()!
      
      for n in stride(from:0,to:existing_account.count, by:1) { //기존 계좌 확인
       if existing_account[n].account == input_account2{
         
         print("\n[이름]:\(existing_account[n].name)")
         print("[계좌번호]:\(existing_account[n].account)")
         print("[계좌잔고]:\(existing_account[n].balance)")
       }
         }
    }else if select1 == "5"{
      print("\n종료 되었습니다.")
      print("\n다른 업무 수행.")
      break;
      //기존 고객 업무 종료
    } 
    }
    
     }

  }

  print("재시도 해주세요")

  //신규고객
  }else if cnum == "2"{
    
    // 신규 고객 일시 상품 가입 후 메뉴얼 수행
    print("==========================================")
    print("|====== 계좌 생성 =======|")
    print("\n[신규계좌 생성]")
    print("\n이름을 입력하시오")
    let user_name = readLine()!
    print("\n계좌를 입력하시오")
    let user_acc = readLine()!
    print("\n초기 입금 금액을 입력하시오")
  
    let money = readLine()!
    let money2 = Int(money)!
      // 형변환
    let bank = Bank(name: user_name, account: user_acc, balance: money2)
      print("\n*계좌 생성 완료*\n")
     
  // 신규 계좌 생성 완료
    while true {
    start()
    let select1 = readLine()!
      
    if select1 == "1"{
      print("\n입금하실 금액을 입력하세요")
      let money = readLine()!
      let money2 = Int(money)!
      bank.nsave(save_money:money2 )
      
    } else if select1 == "2"{
      print("\n출금하실 금액을 입력하세요")
      let money = readLine()!
      let money2 = Int(money)!
      bank.ntake_out(takeout_money:money2)
      
    } else if select1 == "3"{
      print("\n계좌이체할 계좌를 입력하세요")
      let input_account2 = readLine()!
      print("\n계좌이체할 금액을 입력하세요")
      let money = readLine()!
      let money2 = Int(money)!
    
       for n in stride(from:0,to:existing_account.count, by:1) { //기존 계좌 확인
       if existing_account[n].account == input_account2{
         bank.ntbank(tmoney:money2, index_num2:n)
                  print("계좌[\(existing_account[n].account)] 잔고: \(existing_account[n].balance)")
         }

       }
      print("계좌[\(bank.self.account)] 잔고: \(bank.self.balance)")
    
      
    } else if select1 == "4"{
      print("\n 계좌번호를 입력하시오.")
      let input_account2 = readLine()!
      
      for n in stride(from:0,to:existing_account.count, by:1) { //기존 계좌 확인
       if existing_account[n].account == input_account2{
         
         print("\n[이름]:\(existing_account[n].name)")
         print("[계좌번호]:\(existing_account[n].account)")
         print("[계좌잔고]:\(existing_account[n].balance)")
       }
        
         }
      if bank.self.account == input_account2{
         print("\n[이름]:\(bank.self.name)")
        print("[계좌번호]:\(bank.self.account)")
        print("[계좌잔고]\(bank.self.balance)")
       }
    
    } else if select1 == "5"{
      print("\n종료 되었습니다.")
      print("\n다른 업무 수행.")
      break;
      //신규 고객 업무 종료

    }
    
  }
  }
}