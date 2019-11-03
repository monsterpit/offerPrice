
//
//  OfferPriceView.swift
//  iOSConsumerApp
//
//  Created by Vikas Salian on 10/24/19.
//  Copyright © 2019 MyGlamm. All rights reserved.
//

import UIKit

@IBDesignable
class OfferPriceView : UIView{
    
    
    private var label = UILabel()
    
    var labelText = ""{
        didSet {
            label.text = labelText
        }
    }
    
    var labelAlignment : NSTextAlignment = .center {
        didSet{
            label.textAlignment = labelAlignment
        }
    }
    
    var labelFont : UIFont = .systemFont(ofSize: 14){
        didSet{
            label.font = labelFont
        }
    }
    
    var labelTextColor : UIColor = .black{
        didSet{
             label.textColor = labelTextColor
        }
    }
    
    var shimmerColor : UIColor = UIColor.white {
        didSet{
            shimmerCGColor = shimmerColor.cgColor
        }
    }
    
    private var shimmerCGColor : CGColor = UIColor.white.cgColor
    
    var backColor : UIColor?{
        didSet{
            backgroundColor = backColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        setupLabel(text : labelText)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupLabel(text : labelText)
    }
    
    
    
    private func setupLabel(text : String){
        
        
        shimmer()
        
        
        label.text = ""
        label.numberOfLines = 2
        label.textAlignment = .center
       // label.font = UIFont.mgDDinFont(type: .regular, size: 14)
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: label,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .leading, multiplier: 1,
                           constant: 10).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .trailing, multiplier: 1,
                           constant: -(55)).isActive = true
        
        NSLayoutConstraint(item: label,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .centerX, multiplier: 1,
                           constant: (0)).isActive = true
        
        NSLayoutConstraint(item: label,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .centerY, multiplier: 1,
                           constant: 0).isActive = true
        
    }
    
    
    func masktoOfferice(){
        

        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds

        
        let myBezier = UIBezierPath()
        
        myBezier.move(to: CGPoint(x: 0, y: 0))
        
        myBezier.addLine(to: CGPoint(x: bounds.width, y: 0))
        

        myBezier.addLine(to: CGPoint(x:(bounds.width - (bounds.width * 0.15)),y: (bounds.height / 2) ))
        
        myBezier.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        
        myBezier.addLine(to: CGPoint(x: 0, y: bounds.height))
        
        
        
        
        

        maskLayer.path = myBezier.cgPath

        layer.mask = maskLayer
        
    }
    
    func shimmer(){
        
        let shinyView = UIView()
                shinyView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
                    shinyView.backgroundColor = shimmerColor.withAlphaComponent(0.3)
                
                
                addSubview(shinyView)
                
                let gradientLayer = CAGradientLayer()
                gradientLayer.colors = [
                    UIColor.clear.cgColor, UIColor.clear.cgColor,
                    shimmerCGColor, shimmerCGColor,
                    UIColor.clear.cgColor, UIColor.clear.cgColor
                ]
                
                gradientLayer.locations = [0, 0.2, 0.55, 0.6, 0.8, 1]
                
                //gradientLayer.locations = [0,0.5, 1]
                gradientLayer.frame = shinyView.frame
                
                let angle = 70 * CGFloat.pi / 180
                gradientLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
                
                shinyView.layer.mask = gradientLayer
                
                gradientLayer.transform = CATransform3DConcat(gradientLayer.transform, CATransform3DMakeScale(2, 2, 0))
                
                let animation = CABasicAnimation(keyPath: "transform.translation.x")
                animation.fromValue = -1.5 * frame.width
                animation.toValue = 1.5 * frame.width
                animation.repeatCount = Float.infinity
                animation.duration = 2
                
                gradientLayer.add(animation, forKey: "animation")
                
                
                masktoOfferice()
                
                
    }
    
    
    
    override func draw(_ rect: CGRect) {

    }
    
    
}
