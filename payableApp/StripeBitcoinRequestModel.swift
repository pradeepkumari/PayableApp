//
//  StripeBitcoinRequestModel.swift
//  payableApp
//
//  Created by apple on 29/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class StripeBitcoinRequestModel
{
    var IsSimple : Bool
    var MerchantID: String
    var amount : String
    var email: String
    var currency: String
    var description: String
    var PhoneNumber: String
    
    init?( IsSimple : Bool, MerchantID : String, amount : String, email: String, currency: String, description: String, PhoneNumber: String)
    {
        self.IsSimple = IsSimple
        self.MerchantID = MerchantID
        self.amount = amount
        self.email = email
        self.currency = currency
        self.description = description
        self.PhoneNumber = PhoneNumber
    }
}
