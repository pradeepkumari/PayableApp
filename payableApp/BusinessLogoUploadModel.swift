//
//  BusinessLogoUploadModel.swift
//  payableApp
//
//  Created by apple on 27/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class BusinessLogoUploadModel {
    var tempBuffer : String
    var UserID: String
    
    init?( tempBuffer : String, UserID : String)
    {
        self.tempBuffer = tempBuffer
        self.UserID = UserID
    }
}
