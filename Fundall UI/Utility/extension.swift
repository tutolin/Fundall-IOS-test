//
//  extension.swift
//  Fundall UI
//
//  Created by Aboyeji Tolulope on 25/06/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation



extension UITextField {
func isValidEmail() -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return predicate.evaluate(with: self.text ?? "")
}

func removeWhiteSpace() {
    if let text = self.text {
        _ = text.trimmingCharacters(in: .whitespaces).isEmpty
    }
}

func isValidPassword() -> Bool {
    return self.text?.count ?? 0 >= 6
}

func isValidMobile() -> Bool {
    return true
}
}


import MBProgressHUD
extension String {
   
    
    func toastDisplay() {
        DispatchQueue.main.async {
            if let window = UIApplication.shared.keyWindow {
                
                let hud = MBProgressHUD.showAdded(to: window, animated: true)
                hud.mode = .text
                hud.label.text = self
                hud.label.font = UIFont(name: "FoundersGrotesk-Regular", size: 16.0)!
                hud.label.numberOfLines = 0
                hud.margin = 10.0
                hud.offset.y = (UIScreen.main.bounds.height / 2) - 60.0
                
                hud.removeFromSuperViewOnHide = true
                
                hud.hide(animated: true, afterDelay: 2)
            }
        }
    }
    
   
}
