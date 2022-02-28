//
//  dateUtils.swift
//  patmeapp
//
//  Created by Juan Camilo on 31/01/22.
//

import Foundation

class DateUtils {
    
    static func monthToString (intMonth: Int) -> String{
        var monthString = String()
        switch intMonth {
        case 1:
            monthString = NSLocalizedString("January", comment: "")
          
            
        case 2:
            monthString =  NSLocalizedString("February", comment: "")
          
        case 3:
            monthString =     NSLocalizedString("March", comment: "")
           
        case 4:
            monthString = NSLocalizedString("April", comment: "")
            
        case 5:
            monthString =  NSLocalizedString("May", comment: "")
       
        case 6:
            monthString =  NSLocalizedString("June", comment: "")
            
        case 7:
            monthString =  NSLocalizedString("July", comment: "")
            
        case 8:
            monthString =  NSLocalizedString("August", comment: "")
            
        case 9:
            monthString =  NSLocalizedString("September", comment: "")
      
        case 10:
            monthString = NSLocalizedString("October", comment: "")
            
        case 11:
            monthString = NSLocalizedString("November", comment: "")
            
        case 12:
            monthString =  NSLocalizedString("December", comment: "")
        default:
            print("error Specie")
        }
  return monthString
    }
    
    
    
}
