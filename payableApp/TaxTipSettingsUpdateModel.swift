//
//  TaxTipSettingsUpdateModel.swift
//  payableApp
//
//  Created by apple on 28/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class TaxTipSettingsUpdateModel: NSObject {

    var IsTaxApplicable:String!
    var IsTipApplicable:String!
    
    var taxPercentage:String
    var ColumnID: Int
    
    init?( IsTaxApplicable : String, IsTipApplicable : String, taxPercentage : String,ColumnID:Int)
    {
        self.IsTaxApplicable = IsTaxApplicable
        self.IsTipApplicable = IsTipApplicable
        self.taxPercentage = taxPercentage
        self.ColumnID = ColumnID
    }
    
//    var columnID: Int!
//    var finalcolumnID: Int!
//    var isTaxApplicable: Bool!
//    var finalisTaxApplicable: Bool!
//    var isTipApplicable: Bool!
//    var finalisTipApplicable: Bool!
//    var taxPercentage: Double!
//    var finaltaxPercentage: Double!
//    
//    
//    
//    func setColumnID(columnID:Int)
//    {
//        print(columnID)
//        self.finalcolumnID = columnID
//    }
//    func getColumnID() -> Int
//    {
//        print("final count val==>>",finalcolumnID)
//        return self.finalcolumnID
//    }
//    
//    func setIsTaxApplicable(isTaxApplicable:Bool)
//    {
//        print(isTaxApplicable)
//        self.finalisTaxApplicable = isTaxApplicable
//    }
//    func getIsTipApplicable() -> Bool
//    {
//        print("final count val==>>",finalisTaxApplicable)
//        return self.finalisTaxApplicable
//    }
//    
//    func setIsTipApplicable(isTipApplicable:Bool)
//    {
//        print(isTipApplicable)
//        self.finalisTipApplicable = isTipApplicable
//    }
//    func getIsTaxApplicable() -> Bool
//    {
//        print("final count val==>>",finalisTipApplicable)
//        return self.finalisTipApplicable
//    }
//
//    func setTaxPercentage(taxPercentage:Double)
//    {
//        print(taxPercentage)
//        self.finaltaxPercentage = taxPercentage
//    }
//    func getTaxPercentage() -> Double
//    {
//        print("final count val==>>",finaltaxPercentage)
//        return self.finaltaxPercentage
//    }

  
    
}
