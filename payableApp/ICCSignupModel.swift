//
//  ICCSignupModel.swift
//  payableApp
//
//  Created by apple on 29/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class ICCSignupModel
{
    var Username : String
    var Password : String
    var ConfirmPassword : String
    var email: String
    var PhoneNumber : String
    var CPPAccountType : String
    var IsCompany:Bool
    var IsEmployee : Bool
    var IsIndividual : Bool
    var ISCharity : Bool
    var IsCharityEmployee: Bool
    var UserDeviceID : String
  
    
        init?( Username : String, Password : String, ConfirmPassword : String, email : String, PhoneNumber : String, CPPAccountType: String, IsCompany:Bool,IsEmployee : Bool, IsIndividual : Bool, ISCharity : Bool, IsCharityEmployee: Bool, UserDeviceID : String)
        {
            self.Username = Username
            self.Password = Password
            self.ConfirmPassword = ConfirmPassword
            self.email = email
            self.PhoneNumber = PhoneNumber
            self.CPPAccountType = CPPAccountType
            self.IsCompany = IsCompany
            self.IsEmployee = IsEmployee
            self.IsIndividual = IsIndividual
            self.ISCharity = ISCharity
            self.IsCharityEmployee = IsCharityEmployee
            self.UserDeviceID = UserDeviceID
            
            
        }

}
