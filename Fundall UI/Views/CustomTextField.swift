//
//  CustomTextField.swift
//  Fundall UI
//
//  Created by Aboyeji Tolulope on 20/06/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CustomTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    override func prepareForInterfaceBuilder() {
        setupViews()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
          var textRect = super.leftViewRect(forBounds: bounds)
          textRect.origin.x += leftPadding
          return textRect
      }
      
      @IBInspectable var leftImage: UIImage? {
          didSet {
              setupViews()
          }
      }
      
      @IBInspectable var leftPadding: CGFloat = 0
      
      @IBInspectable var color: UIColor = UIColor.lightGray {
          didSet {
              setupViews()
          }
      }

    func setupViews(){
        let border:CALayer = CALayer()
        let width:CGFloat = CGFloat(1.0)
        
        border.borderColor = #colorLiteral(red: 0.2980392157, green: 0.9098039216, blue: 0.5843137255, alpha: 1)
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        self.textColor = #colorLiteral(red: 0.2980392157, green: 0.9098039216, blue: 0.5843137255, alpha: 1)
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder != nil ? self.placeholder! : "", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1) ])
        
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = color
            leftView = imageView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
    }
    
}


