//
//  PatMeMDCTextInput.swift
//  patmeapp
//
//  Created by Juan Camilo on 26/01/22.
//

import Foundation
import MaterialComponents
    
class PatMeMDCTextInput: MDCTextField{
    
    func  setup(){
        self.tag = 1
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.placeholderLabel.isEnabled = true
        self.font = UIFont(name: "Rubik", size: 16)
        self.isEnabled = true
        self.sizeToFit()
        self.rightViewMode = .always
        self.clearButton.isHidden = true
        self.textColor = UIColor(red: (128/255.0), green: (125/255.0), blue: (124/255.0), alpha: 1.0)
    }
    
    
}

