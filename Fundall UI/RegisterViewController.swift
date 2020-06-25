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
}
