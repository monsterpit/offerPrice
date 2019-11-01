
//
//  OfferPriceView.swift
//  iOSConsumerApp
//
//  Created by MyGlamm on 10/24/19.
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
    
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        setupLabel(text : labelText)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupLabel(text : labelText)
    }
    
    
    
    private func setupLabel(text : String){
        
        
        abc()
        
        
        label.text = ""
        label.numberOfLines = 2
        
       // label.font = UIFont.mgDDinFont(type: .regular, size: 14)
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: label,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .leading, multiplier: 1,
                           constant: 9).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .trailing, multiplier: 1,
                           constant: -(9)).isActive = true
        
        NSLayoutConstraint(item: label,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .centerY, multiplier: 1,
                           constant: 0).isActive = true
        
    }
    
    
    func abc(){
        
        
        backgroundColor = .blue
        
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
