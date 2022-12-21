import UIKit

class PersonDescription{
    
    var firstName : String
    var surname : String
    var age : Int
    
    
    init(firstName : String, surname : String, age : Int){
        
        self.firstName = firstName
        self.surname = surname
        self.age = age
    }
    
    
    
    func hasBirthday(){
        
        age+=1
        
    }
    
    
    
    func description(){
        
        print(firstName + " " + surname + " (\(age))")
        
    }
}
    



var person1 = PersonDescription(firstName: "Inga", surname: "Rakete", age: 24)
    
var person2 = PersonDescription(firstName: "Hansi", surname: "Hinterseher", age: 28)
    
    
person1.hasBirthday()
print(person1.age)

person1.description()
person2.description()
    




class BankAccount{
    
    
    var accounHolder : PersonDescription
    var accountNumber : Int
    var bankCode : Int
    var balance : Double = 0
    var limit:Double
   
 //   var moneyAmount : Double
    
    init(accounHolder : PersonDescription,
         accountNumber : Int,
         bankCode : Int,
         
         limit : Double
         //moneyAmount : Double
    )
    {
        self.accounHolder = accounHolder
        self.accountNumber = accountNumber
        self.bankCode = bankCode
       
        self.limit = limit
        //self.moneyAmount = moneyAmount
    }
    
    
    
    func setLimit(){
        
        if (accounHolder.age < 18){
            
        limit = 0
        
        }else{
            limit = -2000
        }
    }
    
  
    
    func payIn(moneyAmount : Double){
        
        balance = balance + moneyAmount
        
    }
    
    
    
    func payOut(moneyAmount : Double){
        
        balance = balance - moneyAmount
        
    }
    
    
    func bankTransfer(targetKonto: BankAccount, moneyAmount : Double ){
        
        if(balance-moneyAmount > limit) {
            
        balance -= moneyAmount
        targetKonto.balance += moneyAmount
           print("money was transferred")
            
       } else {
           print("you have exceeded your money limit")
       }

    }
        
}



var konto1 = BankAccount(accounHolder: person1, accountNumber: 243255, bankCode: 666, limit: 0)
    
konto1.setLimit()
konto1.payIn(moneyAmount: 5000.0)


var konto2 = BankAccount(accounHolder: person2, accountNumber: 876533, bankCode: 555, limit: 0)

konto2.setLimit()

konto1.bankTransfer(targetKonto: konto2, moneyAmount: 3000.0)




class SavingsAccount:BankAccount{
    
    override func payOut(moneyAmount: Double) {
        if (moneyAmount < 2001){
            balance = balance - moneyAmount
            print("money was paid")
        }else {
            print("it can not be paid out more than 2000€")
        }
    }
    
    
    
    func receiveInterest(rate : Double){
        
        balance =  (rate * balance / 100) + balance
        
    }
}

var test1 = SavingsAccount(accounHolder: person2, accountNumber: 424, bankCode: 420807, limit: 2000)

test1.payOut(moneyAmount:1999)
print(test1.balance)

test1.receiveInterest(rate: 19)
print(test1.balance)


