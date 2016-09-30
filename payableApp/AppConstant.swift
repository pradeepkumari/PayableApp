//
//  AppConstant.swift
//  payableApp
//
//  Created by apple on 15/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import Foundation
import UIKit

struct Appconstant
{
    static let WEB_API="https://cppstaging.azurewebsites.net/"
    static let SIGN_UP="/StripeConnectSignup"
    static var btnName = "Select Category"
    
    static let getCompanyList = "Employee/getCompanyList"
    static let getCharityNameList =  "Charity/charityNameList"
    
    static let employeeSignup="Employee/EmployeeSignup"
    static let charityemployeeSignup="Charity/CharityEmployeeSignup"
    static  let API_AuthenticateUser =  "api/Authenticate"
    static let forgot = "api/Forgot/";
    
    static let getCompanyEmployeeList = "Employee/CompanyEmployeeList"
    
    
    static let debitupdate = "/api/DebitUpdate"
    
    static let changepwd = "api/ChangePwd"
    
    static let UploadMerchantLogo="MerchantLogoUpload/UploadImage"
    
    static let API_GetHistory = "api/StripeConnectHistory/"
    
    static let StripebitcoinHistory="api/StripeHistory"
    
    static let UpdateBitcoinEnableStatus = "api/StripeConnectBitcoinEnabledStatus"
    
    static let SupportRequest = "api/SupportRequest"
    
    static let CurrentDevice = UIDevice.currentDevice().name
    
    static let CountryCode = NSLocale.currentLocale().objectForKey(NSLocaleCountryCode) as! String
    
    
    
    
    
}


