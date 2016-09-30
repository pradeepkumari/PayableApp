//
//  supportRequestModel.swift
//  payableApp
//
//  Created by apple on 27/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class supportRequestModel {
    var UserID : String
    var MerchantEmail: String
    var Phone : String
    var SupportMessage : String
    var SupportStatus : String
    var DateandTime: String
    var DeviceLocation : String
    var DeviceName: String
    
    
    init?( UserID : String, MerchantEmail : String, Phone : String, SupportMessage : String,SupportStatus: String,DateandTime: String,DeviceLocation : String,DeviceName : String)
    {
        self.UserID = UserID
        self.MerchantEmail = MerchantEmail
        self.Phone = Phone
        self.SupportMessage = SupportMessage
        self.SupportStatus = SupportStatus
        self.DateandTime = DateandTime
        self.DeviceLocation = DeviceLocation
        self.DeviceName = DeviceName
    }

    
}
