//
//  KeyChainItemWrapper.swift
//  payableApp
//
//  Created by apple on 24/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit
import Foundation
import Security

class KeychainItemWrapper {
    
    var genericPasswordQuery = [NSObject: AnyObject]()
    var keychainItemData = [NSObject: AnyObject]()
    
    var values = [String: AnyObject]()
    
    init(identifier: String, accessGroup: String?) {
        self.genericPasswordQuery[kSecClass] = kSecClassGenericPassword
        self.genericPasswordQuery[kSecAttrAccount] = identifier
        
        if (accessGroup != nil) {
            if TARGET_IPHONE_SIMULATOR != 1 {
                self.genericPasswordQuery[kSecAttrAccessGroup] = accessGroup
            }
        }
        
        self.genericPasswordQuery[kSecMatchLimit] = kSecMatchLimitOne
        self.genericPasswordQuery[kSecReturnAttributes] = kCFBooleanTrue
        
        var outDict: AnyObject?
        
        let copyMatchingResult = SecItemCopyMatching(genericPasswordQuery, &outDict)
        
        if copyMatchingResult != noErr {
            self.resetKeychain()
            
            self.keychainItemData[kSecAttrAccount] = identifier
            if (accessGroup != nil) {
                if TARGET_IPHONE_SIMULATOR != 1 {
                    self.keychainItemData[kSecAttrAccessGroup] = accessGroup
                }
            }
        } else {
            self.keychainItemData = self.secItemDataToDict(outDict as! [NSObject: AnyObject])
        }
    }
    
    subscript(key: String) -> AnyObject? {
        get {
            return self.values[key]
        }
        
        set(newValue) {
            self.values[key] = newValue
            self.writeKeychainData()
        }
    }
    
    func resetKeychain() {
        
        if !self.keychainItemData.isEmpty {
            let tempDict = self.dictToSecItemData(self.keychainItemData)
            var junk = noErr
            junk = SecItemDelete(tempDict as CFDictionary)
            
            assert(junk == noErr || junk == errSecItemNotFound, "Failed to delete current dict")
        }
        
        self.keychainItemData[kSecAttrAccount] = ""
        self.keychainItemData[kSecAttrLabel] = ""
        self.keychainItemData[kSecAttrDescription] = ""
        
        self.keychainItemData[kSecValueData] = ""
    }
    
    private func secItemDataToDict(data: [NSObject: AnyObject]) -> [NSObject: AnyObject] {
        var returnDict = [NSObject: AnyObject]()
        for (key, value) in data {
            returnDict[key] = value
        }
        
        returnDict[kSecReturnData] = kCFBooleanTrue
        returnDict[kSecClass] = kSecClassGenericPassword
        
        var passwordData: AnyObject?
        
        // We could use returnDict like the Apple example but this crashes the app with swift_unknownRelease
        // when we try to access returnDict again
        let queryDict = returnDict
        
        let copyMatchingResult = SecItemCopyMatching(queryDict as CFDictionary, &passwordData)
        
        if copyMatchingResult != noErr {
            assert(false, "No matching item found in keychain")
        } else {
            let retainedValuesData = passwordData as! NSData
            do {
                let val = try NSJSONSerialization.JSONObjectWithData(retainedValuesData, options: []) as! [String: AnyObject]
                
                returnDict.removeValueForKey(kSecReturnData)
                returnDict[kSecValueData] = val
                
                self.values = val
            } catch let error as NSError {
                assert(false, "Error parsing json value. \(error.localizedDescription)")
            }
        }
        
        return returnDict
    }
    
    private func dictToSecItemData(dict: [NSObject: AnyObject]) -> [NSObject: AnyObject] {
        var returnDict = [NSObject: AnyObject]()
        
        for (key, value) in self.keychainItemData {
            returnDict[key] = value
        }
        
        returnDict[kSecClass] = kSecClassGenericPassword
        
        do {
            returnDict[kSecValueData] = try NSJSONSerialization.dataWithJSONObject(self.values, options: [])
        } catch let error as NSError {
            assert(false, "Error paring json value. \(error.localizedDescription)")
        }
        
        return returnDict
    }
    
    private func writeKeychainData() {
        var attributes: AnyObject?
        var updateItem: [NSObject: AnyObject]?
        
        var result: OSStatus?
        
        let copyMatchingResult = SecItemCopyMatching(self.genericPasswordQuery, &attributes)
        
        if copyMatchingResult != noErr {
            result = SecItemAdd(self.dictToSecItemData(self.keychainItemData), nil)
            assert(result == noErr, "Failed to add keychain item")
        } else {
            updateItem = [String: AnyObject]()
            for (key, value) in attributes as! [String: AnyObject] {
                updateItem![key] = value
            }
            updateItem![kSecClass] = self.genericPasswordQuery[kSecClass]
            
            var tempCheck = self.dictToSecItemData(self.keychainItemData)
            tempCheck.removeValueForKey(kSecClass)
            
            if TARGET_IPHONE_SIMULATOR == 1 {
                tempCheck.removeValueForKey(kSecAttrAccessGroup)
            }
            
            result = SecItemUpdate(updateItem! as CFDictionary, tempCheck as CFDictionary)
            assert(result == noErr, "Failed to update keychain item")
        }
    }
}