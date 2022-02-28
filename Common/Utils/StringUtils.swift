//
//  StringUtils.swift
//  patmeapp
//
//  Created by Juan Camilo on 26/01/22.
//

import Foundation


class StringUtils{
    
    static func normalize(string: String)-> String{
        return string.lowercased().trimmingCharacters(in: .whitespaces)
        
    }
 
}
