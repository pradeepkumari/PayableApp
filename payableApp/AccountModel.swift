//
//  AccountModel.swift
//  payableApp
//
//  Created by apple on 26/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class AccountModel {
    var Username : String
    var Password : String
    var Email: String    
    var PhoneNumber : String
    var AccountHolderName : String
    var AccountToken: String
    
    
    init?( Username : String, Password : String, Email : String, PhoneNumber : String,AccountHolderName: String,AccountToken: String)
    {
        self.Username = Username
        self.Password = Password
        self.Email = Email
        self.PhoneNumber = PhoneNumber
        self.AccountHolderName = AccountHolderName
        self.AccountToken = AccountToken
    }
}
