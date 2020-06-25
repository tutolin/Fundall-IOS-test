//
//  LoginViewController.swift
//  Fundall UI
//
//  Created by Aboyeji Tolulope on 23/06/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextfield: CustomTextField!
    @IBOutlet weak var toggleVisibility: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
}
