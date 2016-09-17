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
    var Password : String
    var ConfirmPassword : String
    var PhoneNumber : String
    var CPPAccountType : String
    var IsCompany:Bool
    var IsEmployee : Bool
    var IsIndividual : Bool
    var ISCharity : Bool
    var IsCharityEmployee: Bool
    var UserDeviceID : String
    var stripeCode : String
    //{"Username":"cppdineshindividual","Password":"Cpp@2593","ConfirmPassword":"Cpp@2593","email":"dineshkumar02051993@gmail.com","PhoneNumber":"9551702150","CPPAccountType":"Bank","IsCompany":false,"IsEmployee":false,"IsIndividual":true,"ISCharity":false,"IsCharityEmployee":false,"UserDeviceID":"GCMID for notification","stripeCode":"Code from stripe after stripe signup from webview"}
    
    
    
    init?( Username : String, Password : String, ConfirmPassword : String, email : String, PhoneNumber : String, CPPAccountType: String, IsCompany:Bool,IsEmployee : Bool, IsIndividual : Bool, ISCharity : Bool, IsCharityEmployee: Bool, UserDeviceID : String, stripeCode : String)
    {
        self.Username = Username
        self.Password = Password
        self.ConfirmPassword = ConfirmPassword
        self.PhoneNumber = PhoneNumber
        self.CPPAccountType = CPPAccountType
        self.IsCompany = IsCompany
        self.IsEmployee = IsEmployee
        self.IsIndividual = IsIndividual
        self.ISCharity = ISCharity
        self.IsCharityEmployee = IsCharityEmployee
        self.UserDeviceID = UserDeviceID
        self.stripeCode = stripeCode
        
    }
    
    
}


