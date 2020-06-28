//
//  CardViewController.swift
//  Fundall UI
//
//  Created by Aboyeji Tolulope on 23/06/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    
    let cardImage = [UIImage(named: "Group 49"), UIImage(named: "Group 50"),UIImage(named: "Group 51"),UIImage(named: "Group 52")]
    let cardAmount = ["₦ 9,600","₦ 1,000", "₦ 1,200"]
    let cardName = ["Lifestyle Pro","Lifestyle Premium", "Lifestyle Business"]


    @IBOutlet weak var cardTableView: UITableView!
    @IBOutlet weak var successfulView: UIView!
    
    
    var lastSelection: IndexPath!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cardTableView.delegate = self
        self.cardTableView.dataSource = self
        self.cardTableView.allowsSelection = true
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func cancelSubview(_ sender: Any) {
        self.successfulView.removeFromSuperview()
    }
    
    func openSubView() {
           self.successfulView.frame = self.view.frame
           self.view.addSubview(successfulView)
       }
    
    @IBAction func backClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


extension CardViewController: UITableViewDataSource, UITableViewDelegate, didSelectCard {
    
    func selectionRow(indexPath: Int) {
        print(indexPath)
        let  index = IndexPath(row: indexPath, section: 1)
        

        cardTableView.selectRow(at: index, animated: true, scrollPosition: .none)

         
    }
    
    
    
   func numberOfSections(in tableView: UITableView) -> Int {
           return 2
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
            
        } else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CardSelectionCell") as? CardSelectionCell
            cell?.delegate = self
            
            return cell ?? UITableViewCell()
            
        }
     
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CardListCell") as? CardListCell
            cell?.tintColor = UIColor.black
            cell?.cardAmount.text = cardAmount[indexPath.row]
            cell?.cardImage.image = cardImage[indexPath.row]
            cell?.cardName.text = cardName[indexPath.row]
            
            return cell ?? UITableViewCell()
            
        }
    
    }
    
   
           
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
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
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
          
          if section == 1 {
              return  "   Pick a Card"
          }
      
          return ""
      }
      func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
          
          if section == 1 {
              let title = UILabel()
                            title.font = UIFont(name: "FoundersGrotesk-Medium", size: 30.0)!
                             title.textColor = UIColor.black

                            let header = view as! UITableViewHeaderFooterView
                            header.textLabel?.font=title.font
                            header.textLabel?.textColor=title.textColor
              header.contentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
              }
         
      }
      

       
    
}


