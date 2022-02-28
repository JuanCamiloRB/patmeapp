//
//  PatMeMDCController.swift
//  patmeapp
//
//  Created by Juan Camilo on 26/01/22.
//

import Foundation
import UIKit
import MaterialComponents.MaterialTextFields

class MDCTextInputController: MDCTextInputControllerOutlined{
    private let textColor = UIColor(red: (250/255.0), green: (191/255.0), blue: (161/255.0), alpha: 1.0)
    func setup(){
    
        self.textInput?.textColor = UIColor(red: (26/255.0), green: (26/255.0), blue: (26/255.0), alpha: 1.0)
        self.inlinePlaceholderColor = UIColor(red: (128/255.0), green: (125/255.0), blue: (124/255.0), alpha: 1.0)
        self.floatingPlaceholderActiveColor = UIColor(red: (128/255.0), green: (125/255.0), blue: (124/255.0), alpha: 1.0)
        self.floatingPlaceholderNormalColor = UIColor(red: (128/255.0), green: (125/255.0), blue: (124/255.0), alpha: 1.0)
        self.textInputFont = UIFont(name: "Rubik", size: 16)
        self.textInputClearButtonTintColor =  UIColor(red: (128/255.0), green: (125/255.0), blue: (124/255.0), alpha: 1.0)
        self.borderRadius = 16
        self.leadingUnderlineLabelFont = UIFont(name: "Rubik", size: 40)
        self.inlinePlaceholderFont = UIFont(name: "Rubik", size: 16)
        self.trailingUnderlineLabelFont = UIFont(name: "Rubik", size: 40)
        self.floatingPlaceholderScale = 1.0000001
        self.isAccessibilityElement = true
        self.isFloatingEnabled = true
        self.activeColor = textColor
        self.normalColor = textColor
        
        self.underlineHeightActive = 20
        
        
    }
    
    
}
