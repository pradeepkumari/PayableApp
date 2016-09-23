//
//  Signupviewmodel.swift
//  SankarSuperMarket
//
//  Created by Admin on 6/13/16.
//  Copyright © 2016 vertaceapp. All rights reserved.
//

import Foundation

class Signupviewmodel
{
    var Username : String
    var Email: String
    var Password : String
//    var ConfirmPassword : String
    var PhoneNumber : String
//    var CPPAccountType : String
//    var IsCompany:Bool
//    var IsEmployee : Bool
//    var IsIndividual : Bool
//    var ISCharity : Bool
//    var IsCharityEmployee: Bool
//    var stripeCode : String
    
//    var CharityCompanyID: String
    var UserDeviceID : String
    var CompanyID: String
  
    
    init?( Username : String, Password : String, Email : String, PhoneNumber : String,CompanyID: String,UserDeviceID: String)
    {
            self.Username = Username
            self.Password = Password
            self.Email = Email
            self.PhoneNumber = PhoneNumber
            self.CompanyID = CompanyID
            self.UserDeviceID = UserDeviceID
    }
//
//    init?( Username : String, Password : String, ConfirmPassword : String, Email : String, PhoneNumber : String, CPPAccountType: String, IsCompany:Bool,IsEmployee : Bool, IsIndividual : Bool, ISCharity : Bool, IsCharityEmployee: Bool, UserDeviceID : String, stripeCode : String)
//    {
//        self.Username = Username
//        self.Email =email
//        self.Password = Password
//        self.ConfirmPassword = ConfirmPassword
//        self.PhoneNumber = PhoneNumber
//        self.CPPAccountType = CPPAccountType
//        self.IsCompany = IsCompany
//        self.IsEmployee = IsEmployee
//        self.IsIndividual = IsIndividual
//        self.ISCharity = ISCharity
//        self.IsCharityEmployee = IsCharityEmployee
//        self.UserDeviceID = UserDeviceID
//        self.stripeCode = stripeCode
//        
//    }
    
//    func initForSignUp( Username : String, Password : String, email : String, PhoneNumber : String )
//    {
//        self.Username = Username
//        self.Password = Password
//        self.Email = email
//        self.PhoneNumber = PhoneNumber
//        
//        
//    }
}


