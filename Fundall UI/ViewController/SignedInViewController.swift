//
//  SignedInViewController.swift
//  Fundall UI
//
//  Created by Aboyeji Tolulope on 23/06/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class SignedInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        if let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginViewController{
                   self.present(loginVC, animated: true, completion: nil)
        }}
    
    @IBAction func signinPressed(_ sender: Any) {
        if let registerVC = storyboard?.instantiateViewController(withIdentifier: "RegisterVC") as? RegisterViewController{
                          self.present(registerVC, animated: true, completion: nil)
               }
        
    }
    
}
