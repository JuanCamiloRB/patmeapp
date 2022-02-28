//
//  GenderEnum.swift
//  patmeapp
//
//  Created by Juan Camilo on 2/02/22.
//

import Foundation
enum GenderEnum:String,Codable {
    case male
    case female
    case other

    
    func getLocalizable() -> String{
        
        switch self {
       case .male:
           return NSLocalizedString("genere_view_title_txt_1", comment: "")
        case .female:
            return NSLocalizedString("genere_view_title_txt_2", comment: "")
        case .other:
            return NSLocalizedString("genere_view_title_txt_3", comment: "")
        
        
        }
           }
        
        
    }
 
