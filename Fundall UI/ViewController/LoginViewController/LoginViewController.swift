//
//  LoginViewController.swift
//  Fundall UI
//
//  Created by Aboyeji Tolulope on 23/06/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import SVProgressHUD

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextfield: CustomTextField!
    @IBOutlet weak var toggleVisibility: UIButton!
    
    
    var presenter = LoginPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self

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
    
    @IBAction func registerPressed(_ sender: Any) {
        if let registerVC = storyboard?.instantiateViewController(withIdentifier: "RegisterVC") as? RegisterViewController{
                          self.present(registerVC, animated: true, completion: nil)
               }
        
    }
    @IBAction func passwordVisibility(_ sender: Any) {
        passwordTextfield.isSecureTextEntry.toggle()
        toggleVisibility.isSelected = !toggleVisibility.isSelected
        
        
        
    }
    
    
    func isValidLogin() -> Bool {
          
           if let password = self.passwordTextfield.text {
               if password.count == 0 {
                   "Please enter password".toastDisplay()
                   return false
               }
               else if password.count > 0, !self.passwordTextfield.isValidPassword() {
                   "Please enter minimum 6 digit password".toastDisplay()
                   return false
               }
           }
          
           return true
       }
    
    @IBAction func loginClicked(_ sender: Any) {
        self.view.endEditing(true)
        
        if self.isValidLogin() {
            
            ProgressHUD.show("logging in", interaction: true)
            presenter.performLogin(email: "test@gmail.com", password: "123456")
           

        }
        
    }
}

extension LoginViewController : LoginView {
    func loginsWithError(error: Error) {
        DispatchQueue.main.async {
            "invalid username or password".toastDisplay()
        }
    }
    
    func loginsWithSuccess(loginModel: LoginModel) {
        
        DispatchQueue.main.asyncAfter(deadline:.now() + 1.0, execute: {
            "Login Successful".toastDisplay()
            if let dashboardVC = self.storyboard?.instantiateViewController(withIdentifier: "DashboardVC") as? DashboardViewController{
                              self.present(dashboardVC, animated: true, completion: nil)
                   }
        })
       
        
    }
    
    
    
    
}
