//
//  MerchantLoginViewModel.swift
//  payableApp
//
//  Created by apple on 24/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class MerchantLoginViewModel
{
    var Username : String
    var Password: String
    
    init?( Username : String, Password : String)
    {
        self.Username = Username
        self.Password = Password
    }
}
