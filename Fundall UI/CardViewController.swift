//
//  CardViewController.swift
//  Fundall UI
//
//  Created by Aboyeji Tolulope on 23/06/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var cardTableView: UITableView!
    @IBOutlet weak var successfulView: UIView!
    
    
    var lastSelection: IndexPath!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cardTableView.delegate = self
        self.cardTableView.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func cancelSubview(_ sender: Any) {
        self.successfulView.removeFromSuperview()
    }
    
    func openSubView() {
           self.successfulView.frame = self.view.frame
           self.view.addSubview(successfulView)
       }
}


extension CardViewController: UITableViewDataSource, UITableViewDelegate {
   func numberOfSections(in tableView: UITableView) -> Int {
           return 2
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1} else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CardSelectionCell") as? CardSelectionCell
            return cell ?? UITableViewCell()
            
        }
     
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CardListCell") as? CardListCell
            cell?.tintColor = UIColor.black
            
            return cell ?? UITableViewCell()
            
        }
    
    }
    
   
           
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            if self.lastSelection != nil {
                self.cardTableView.cellForRow(at: self.lastSelection)?.accessoryType = .none
            }

        self.cardTableView.cellForRow(at: indexPath)?.accessoryType = .checkmark

            self.lastSelection = indexPath
        self.cardTableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0{
            openSubView()
            
        }
        if indexPath.row == 1{
            openSubView()
            
        }
        if indexPath.row == 2{
            openSubView()
            
        }
        
}

       
    
}


