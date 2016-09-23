//
//  Signupviewcharitymodel.swift
//  payableApp
//
//  Created by apple on 23/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class Signupviewcharitymodel: NSObject {
    var Username : String
    var Email: String
    var Password : String
    var PhoneNumber : String
    var UserDeviceID : String
    var CharityCompanyID: String
    
    
    init?( Username : String, Password : String, Email : String, PhoneNumber : String,CharityCompanyID: String,UserDeviceID: String)
    {
        self.Username = Username
        self.Password = Password
        self.Email = Email
        self.PhoneNumber = PhoneNumber
        self.CharityCompanyID = CharityCompanyID
        self.UserDeviceID = UserDeviceID
    }

}
