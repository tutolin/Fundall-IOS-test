//
//  DashboardViewController.swift
//  Fundall UI
//
//  Created by Aboyeji Tolulope on 22/06/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UIGestureRecognizerDelegate{
    
    let transactionImage = [UIImage(named: "Group 49"), UIImage(named: "Group 50"),UIImage(named: "Group 51"),UIImage(named: "Group 52")]
    let transactionAmount = ["₦ 130","₦ 100", "₦ 35", "₦ 30"]
    let transactionName = ["Tobiloba","Grocery", "Shopping", "Alvera"]
    let transactionTime = ["Just now","12:00AM", "5:00AM", "3:00PM"]

enum CardState {
    case expanded
    case collapsed
}

    @IBOutlet weak var bottomSheetTableview: UITableView!
    @IBOutlet var cardViewController: UIView!
    @IBOutlet weak var handleArea: UIView!
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var cardView: UIView!
    

    
   
        var cardHeight:CGFloat!
        var cardHandleAreaHeight:CGFloat!
        
    var safeAreaHeight: CGFloat {
                    if #available(iOS 11, *) {
                       return self.view.safeAreaLayoutGuide.layoutFrame.size.height
                    }
                   return self.view.bounds.height
               }
    
        var cardVisible = false
        var nextState:CardState {
            return cardVisible ? .collapsed : .expanded
        }
        
        var runningAnimations = [UIViewPropertyAnimator]()
        var animationProgressWhenInterrupted:CGFloat = 0
        
    

        override func viewDidLoad() {
            super.viewDidLoad()
          
            bottomSheetTableview.delegate = self
            bottomSheetTableview.dataSource = self
          
            cardHeight = (safeAreaHeight - self.topBar.frame.height) + 35
            //            cardHeight = (80/100) * (safeArHeight)
            cardHandleAreaHeight = (safeAreaHeight - self.cardView.frame.height) - 120
            
              setupCard()

        }
    
    
    @IBAction func cardRequestPressed(_ sender: Any) {
        if let cardVC = storyboard?.instantiateViewController(withIdentifier: "CardVC") as? CardViewController{
                   self.present(cardVC, animated: true, completion: nil)
        }
    }
    
        
        func setupCard() {
           
            
            self.view.addSubview(cardViewController)
            
            cardViewController.frame = CGRect(x: 0, y: self.view.frame.height - cardHandleAreaHeight, width: self.view.bounds.width, height: cardHeight)
            
            cardViewController.clipsToBounds = true
            
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DashboardViewController.handleCardTap(recognzier:)))
         
            let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(DashboardViewController.handleCardPan(recognizer:)))
            
            
            handleArea.addGestureRecognizer(tapGestureRecognizer)
            handleArea.addGestureRecognizer(panGestureRecognizer)
//            self.view.addGestureRecognizer(tapGestureRecognizer)
            
            
        }

        @objc
        func handleCardTap(recognzier:UITapGestureRecognizer) {
            switch recognzier.state {
            case .ended:
                animateTransitionIfNeeded(state: nextState, duration: 0.9)
            default:
                break
            }
        }
        
        @objc
        func handleCardPan (recognizer:UIPanGestureRecognizer) {
            switch recognizer.state {
            case .began:
                startInteractiveTransition(state: nextState, duration: 0.9)
            case .changed:
                let translation = recognizer.translation(in: self.cardViewController)
                var fractionComplete = translation.y / cardHeight
                fractionComplete = cardVisible ? fractionComplete : -fractionComplete
                updateInteractiveTransition(fractionCompleted: fractionComplete)
            case .ended:
                continueInteractiveTransition()
            default:
                break
            }
            
        }
        
        func animateTransitionIfNeeded (state:CardState, duration:TimeInterval) {
            if runningAnimations.isEmpty {
                let frameAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                    switch state {
                    case .expanded:
                        self.cardViewController.frame.origin.y = self.view.frame.height - self.cardHeight
                    case .collapsed:
                        self.cardViewController.frame.origin.y = self.view.frame.height - self.cardHandleAreaHeight
                    }
                }
                
                frameAnimator.addCompletion { _ in
                    self.cardVisible = !self.cardVisible
                    self.runningAnimations.removeAll()
                }
                
                frameAnimator.startAnimation()
                runningAnimations.append(frameAnimator)
                
                
                let cornerRadiusAnimator = UIViewPropertyAnimator(duration: duration, curve: .linear) {
                    switch state {
                    case .expanded:
                        self.cardViewController.layer.cornerRadius = 50
                       
                    case .collapsed:
                        self.cardViewController.layer.cornerRadius = 50
                       
                    }
                }
                
                cornerRadiusAnimator.startAnimation()
                runningAnimations.append(cornerRadiusAnimator)
                
                
                
            }
        }
        
        func startInteractiveTransition(state:CardState, duration:TimeInterval) {
            if runningAnimations.isEmpty {
                animateTransitionIfNeeded(state: state, duration: duration)
            }
            for animator in runningAnimations {
                animator.pauseAnimation()
                animationProgressWhenInterrupted = animator.fractionComplete
            }
        }
        
        func updateInteractiveTransition(fractionCompleted:CGFloat) {
            for animator in runningAnimations {
                animator.fractionComplete = fractionCompleted + animationProgressWhenInterrupted
            }
        }
        
        func continueInteractiveTransition (){
            for animator in runningAnimations {
                animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
            }
        }
        
    }

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    

    
    
    func numberOfSections(in tableView: UITableView) -> Int {
           return 3
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            return 4

        }
            
        else {
            return 1

        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell") as? CardCell
            return cell ?? UITableViewCell()
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodayTitleTableViewCell") as? TodayTitleTableViewCell
           
            return cell ?? UITableViewCell()
        }
            
     
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodayTableViewCell") as? TodayTableViewCell
            cell?.transactionImage.image = transactionImage[indexPath.row]
            cell?.transactionAmount.text = transactionAmount[indexPath.row]
            cell?.transactionName.text = transactionName[indexPath.row]
            cell?.transactionTime.text = transactionTime[indexPath.row]
            
            return cell ?? UITableViewCell()
            
        }
    }

    
    
    
    
}
