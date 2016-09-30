//
//  ChangePasswordModel.swift
//  payableApp
//
//  Created by apple on 27/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class ChangePasswordModel {
    
    var Username : String
    var Password: String
    var newPassword : String
    init?( Username : String, Password : String, newPassword : String)
    {
        self.Username = Username
        self.Password = Password
        self.newPassword = newPassword
    }
}
