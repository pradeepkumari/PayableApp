//
//  MerchantBitcoin_CreateStripeBitcoinRequest.swift
//  payableApp
//
//  Created by apple on 21/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class MerchantBitcoin_CreateStripeBitcoinRequest {
    var IsSimple : Bool
    var MerchantID : String
    var amount : String
    var EMail : String
    var email : String
    var currency : String
    var description : String
    var PhoneNumber :String!
    
    
    init?(IsSimple : Bool, MerchantID : String, amount : String, EMail : String, email : String, currency: String, description : String,PhoneNumber : String)
    {
        self.IsSimple = IsSimple
        self.MerchantID = MerchantID
        self.amount = amount
        self.EMail = EMail
        self.email = email
        self.currency = currency
        self.description = description
        self.PhoneNumber = PhoneNumber
        
        
    }
}
