//
//  UserDefaultUtils.swift
//  patmeapp
//
//  Created by Juan Camilo on 2/02/22.
//

import Foundation
class UserDefaultUtils{
    static let userDefaults = UserDefaults.standard
    static var keyToken: String = "keyToken"
    
    static func setToken(token: String){
        
        
        userDefaults.set(token,forKey: keyToken )
        
    
    }
    static func getToken()-> String{
        
        return userDefaults.string(forKey: keyToken) ?? ""
    
    }
    
    
}
