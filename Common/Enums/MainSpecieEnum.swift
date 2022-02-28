//
//  MainSpecieEnum.swift
//  patmeapp
//
//  Created by Juan Camilo on 20/01/22.
//

import Foundation

enum MainSpeciesEnum:String,Codable {
    case dog
    case cat
    case horse
    case bird
    case rabbit
    case other
    
    func getLocalizable() -> String{
        
        switch self {
               case .dog:
                   return NSLocalizedString("Dog", comment: "")
        case .cat:
            return NSLocalizedString("Cat", comment: "")
        case .horse:
            return NSLocalizedString("Horse", comment: "")
        case .bird:
            return NSLocalizedString("Bird", comment: "")
        case .rabbit:
            return NSLocalizedString("Rabbit", comment: "")
        case .other:
            return NSLocalizedString("Other", comment: "")
        }
           }
        
        
    }
 


