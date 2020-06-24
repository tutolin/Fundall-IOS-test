//
//  ViewController.swift
//  Fundall UI
//
//  Created by Aboyeji Tolulope on 20/06/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startPressed(_ sender: Any) {
        if let signedInVC = storyboard?.instantiateViewController(withIdentifier: "SignedInVC") as? SignedInViewController{
        self.present(signedInVC, animated: true, completion: nil)
    }
    }
}

