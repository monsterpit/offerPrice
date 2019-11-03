
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
    
    var shimmerColor : UIColor = UIColor.white {
        didSet{
            shimmerCGColor = shimmerColor.cgColor
        }
    }
    
    private var shimmerCGColor : CGColor = UIColor.white.cgColor
    
    
    
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
        
        
       // backgroundColor = .blue
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        // Create the frame for the circle.
    //    let radius: CGFloat = 50.0
        // Rectangle in which circle will be drawn
     //   let rect = CGRect(x: 100, y: 100, width: 2 * radius, height: 2 * radius)
     //   let circlePath = UIBezierPath(ovalIn: rect)
        
        
        let myBezier = UIBezierPath()
        
        myBezier.move(to: CGPoint(x: 0, y: 0))
        
        myBezier.addLine(to: CGPoint(x: bounds.width, y: 0))
        
        //   myBezier.addQuadCurve(to: CGPoint(x: rect.width - 20,y: 15), controlPoint: CGPoint(x:rect.width - 15,y:20.5))
        
        
        // myBezier.addQuadCurve(to: CGPoint(x: rect.width - 50,y: 0), controlPoint: CGPoint(x:rect.width - 35,y:0))
        
        //myBezier.addQuadCurve(to: CGPoint(x: rect.width - 80,y: 15), controlPoint: CGPoint(x:rect.width - 65,y:0))
        
        //myBezier.addQuadCurve(to: CGPoint(x: rect.width - 100,y: 20), controlPoint: CGPoint(x:rect.width - 85,y:20.5))
        
        
        
        myBezier.addLine(to: CGPoint(x:(bounds.width - (bounds.width * 0.15)),y: (bounds.height / 2) ))
        
        myBezier.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        
        myBezier.addLine(to: CGPoint(x: 0, y: bounds.height))
        
        
        
        
        
        
//        // Create a path
//        let path = UIBezierPath(rect: bounds)
//        // Append additional path which will create a circle
//        path.append(circlePath)
        // Setup the fill rule to EvenOdd to properly mask the specified area and make a crater
       // maskLayer.fillRule = kCAFillRuleEvenOdd
        // Append the circle to the path so that it is subtracted.
        maskLayer.path = myBezier.cgPath
        // Mask our view with Blue background so that portion of red background is visible
        layer.mask = maskLayer
        
    }
    
    func shimmer(){
        
        
//        Check mail for shimmer
//
//        let defaultView = UIView()
//        defaultView.frame = CGRect(x: 16, y: 30, width: view.frame.width - 32, height: 400)
//        defaultView.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.3764705882, blue: 0.3764705882, alpha: 1).withAlphaComponent(1)
//
//        let shinyView = UIView()
//        shinyView.frame = CGRect(x: 16, y: 30, width: view.frame.width - 32, height: 400)
//            shinyView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(0.3)
//
//
//        view.addSubview(defaultView)
//        view.addSubview(shinyView)
//
//        let gradientLayer = CAGradientLayer()
        

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
       
        
//        //  let y:CGFloat = 20
//
//        let myBezier = UIBezierPath()
//
//        myBezier.move(to: CGPoint(x: 0, y: 0))
//
//        myBezier.addLine(to: CGPoint(x: rect.width, y: 0))
//
//        //   myBezier.addQuadCurve(to: CGPoint(x: rect.width - 20,y: 15), controlPoint: CGPoint(x:rect.width - 15,y:20.5))
//
//
//        // myBezier.addQuadCurve(to: CGPoint(x: rect.width - 50,y: 0), controlPoint: CGPoint(x:rect.width - 35,y:0))
//
//        //myBezier.addQuadCurve(to: CGPoint(x: rect.width - 80,y: 15), controlPoint: CGPoint(x:rect.width - 65,y:0))
//
//        //myBezier.addQuadCurve(to: CGPoint(x: rect.width - 100,y: 20), controlPoint: CGPoint(x:rect.width - 85,y:20.5))
//
//
//
//        myBezier.addLine(to: CGPoint(x:(rect.width - (rect.width * 0.15)),y: (rect.height / 2) ))
//
//        myBezier.addLine(to: CGPoint(x: rect.width, y: rect.height))
//
//        myBezier.addLine(to: CGPoint(x: 0, y: rect.height))
//
//        myBezier.close()
//
//        let context = UIGraphicsGetCurrentContext()
//        context!.setLineWidth(4.0)
//        #colorLiteral(red: 0.9019607843, green: 0.3764705882, blue: 0.3764705882, alpha: 1).setFill()
//
//
//        myBezier.fill()
        
        
        
        
    }
    
    
}
