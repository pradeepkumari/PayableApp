//
//  MerchantBitcoin_CheckBitcoinPaid.swift
//  payableApp
//
//  Created by apple on 21/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class MerchantBitcoin_CheckBitcoinPaid {
    var ID : String
    var MerchantID : String
    var PhoneNumber : String
    
    
    init?( ID : String, MerchantID : String,PhoneNumber : String)
    {
        self.ID = ID
        self.MerchantID = MerchantID
        self.PhoneNumber = PhoneNumber
        
    }
}
