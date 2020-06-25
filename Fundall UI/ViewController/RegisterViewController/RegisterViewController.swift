//
//  RegisterViewController.swift
//  Fundall UI
//
//  Created by Aboyeji Tolulope on 23/06/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var firstNameField: CustomTextField!
    @IBOutlet weak var lastNameField: CustomTextField!
    @IBOutlet weak var emailField: CustomTextField!
    @IBOutlet weak var phoneNumberField: CustomTextField!
    @IBOutlet weak var passwordField: CustomTextField!
    @IBOutlet weak var toggleVisibility: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordField.textContentType = .oneTimeCode
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func loginPressed(_ sender: Any) {
        if let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginViewController{
                   self.present(loginVC, animated: true, completion: nil)
        }
        }
    @IBAction func registerPressed(_ sender: Any) {
    }
    
    
    
    @IBAction func passwordVisiblity(_ sender: Any) {
        passwordField.isSecureTextEntry.toggle()
        toggleVisibility.isSelected = !toggleVisibility.isSelected
    }
    
    
    func isValidRegistration() -> Bool {
        if let firstName = self.firstNameField.text {
                   if firstName.count == 0 {
                       "Please enter your first name".toastDisplay()
                       return false
                   }
        }
        if let lastName = self.lastNameField.text {
                          if lastName.count == 0 {
                              "Please enter your last name".toastDisplay()
                              return false
                          }
               }
        
        if let email = self.emailField.text {
            if email.count == 0 {
                "Please enter email".toastDisplay()
                return false
            }
            else if email.count > 0, !self.emailField.isValidEmail() {
                "Please enter a valid email".toastDisplay()
                return false
            }
        }
        if let mobile = self.phoneNumberField.text {
            if mobile.count == 0 {
                "Please enter mobile number".toastDisplay()
                return false
            }
                
            else if mobile.count > 0, !self.phoneNumberField.isValidMobile() {
                "Please enter valid mobile number".toastDisplay()
                return false
            }
        }
        if let password = self.passwordField.text {
            if password.count == 0 {
                "Please enter password".toastDisplay()
                return false
            }
            else if password.count > 0, !self.passwordField.isValidPassword() {
                "Please enter minimum 6 digit password".toastDisplay()
                return false
            }
        }
       
        return true
    }
    
    @IBAction func registerClicked(_ sender: Any) {
          self.view.endEditing(true)
              if self.isValidRegistration() {
                  print("Allah")        }
          }
    }

