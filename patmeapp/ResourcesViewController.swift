//
//  ResourcesViewController.swift
//  patmeapp
//
//  Created by Juan Camilo on 4/01/22.
//

import Foundation
import UIKit

class ResourcesViewController: UIViewController{
    
    
    
    func showAlert(_ message:String) {
          let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
          self.present(alert, animated: true)
      }
    
    
}

extension ResourcesViewController {
    func hideKeyboardWhenTappedAround(onView : UIView) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(ResourcesViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        onView.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
