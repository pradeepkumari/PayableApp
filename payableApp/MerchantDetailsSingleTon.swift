//
//  MerchantDetailsSingleTon.swift
//  payableApp
//
//  Created by apple on 27/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class MerchantDetailsSingleTon {
//    var finalDataCount: Int!
//    var dataCount: Int!
    
    var username: String!
    var finalusername: String!
    
    var password: String!
    var finalpassword: String!
    
    var userid: String!
    var finaluserid: String!
    
    var email: String!
    var finalemail: String!
    
    var phonenumber: String!
    var finalphonenumber: String!
    
    var accountholdername: String!
    var finalaccountholdername: String!
    
    var chargeAmount: String!
    var finalChargeAmount: String!
    
    var DescriptonText: String!
    var finalDescriptonText: String!
    
    var isSimple: Bool!
    var finalisSimple: Bool!
    
    class var sharedInstance: MerchantDetailsSingleTon {
        struct Static
        {
            static let instance = MerchantDetailsSingleTon()
        }
        return Static.instance
    }
//    func setDataCount(dataCount:Int)
//    {
//        print(dataCount)
//        self.finalDataCount = dataCount
//    }
//    func getDataCount() ->Int
//    {
//        print("final count val==>>",finalDataCount)
//        return self.finalDataCount
//    }
    
    func setChargeAmount(chargeAmount:String)
    {
        print(chargeAmount)
        self.finalChargeAmount = chargeAmount
    }
    func getChargeAmount() -> String
    {
        print("finalChargeAmount val==>>",finalChargeAmount)
        return self.finalChargeAmount
    }
    
    func setDescriptonText(DescriptonText:String)
    {
        print(DescriptonText)
        self.finalDescriptonText = DescriptonText
    }
    func getDescriptonText() -> String
    {
        print("finalChargeAmount val==>>",finalDescriptonText)
        return self.finalDescriptonText
    }
    
    func setIsSimple(isSimple:Bool)
    {
        print(isSimple)
        self.finalisSimple = isSimple
    }
    func getIsSimple() -> Bool
    {
        print("finalChargeAmount val==>>",finalisSimple)
        return self.finalisSimple
    }
    
    
    func setUserId(password:String)
    {
        print(password)
        self.finalpassword = password
    }
    func getUserId() -> String
    {
        print("final count val==>>",finalpassword)
        return self.finalpassword
    }
    func setUsername(username:String)
    {
        print(username)
        self.finalusername = username
    }
    func getUsername() -> String
    {
        print("final count val==>>",finalusername)
        return self.finalusername
    }
    
    func setPassword(password:String)
    {
        print(password)
        self.finalpassword = password
    }
    func getPassword() -> String
    {
        print("final count val==>>",finalpassword)
        return self.finalpassword
    }
    
    
    func setEmail(email:String)
    {
        print(email)
        self.finalemail = email
    }
    func getEmail() -> String
    {
        print("final count val==>>",finalemail)
        return self.finalemail
    }
    
    func setPhonenumber(phonenumber:String)
    {
        print(phonenumber)
        self.finalphonenumber = phonenumber
    }
    func getPhonenumber() -> String
    {
        print("final count val==>>",finalphonenumber)
        return self.finalphonenumber
    }

    func setAccHoldername(accountholdername:String)
    {
        print(accountholdername)
        self.finalaccountholdername = accountholdername
    }
    func getAccHoldername() -> String
    {
        print("final count val==>>",finalaccountholdername)
        return self.finalaccountholdername
    }
    
    
    
    
}
