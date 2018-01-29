//
//  CircleLayer.swift
//  LoadingAnimation
//
//  Created by 李旭阳 on 2018/1/24.
//  Copyright © 2018年 李文静. All rights reserved.
//

import UIKit

class CircleLayer: CAShapeLayer {
    
    var circleSmallPath: UIBezierPath {
        return UIBezierPath(ovalIn: CGRect(x: 50.0, y: 50.0, width: 0.0, height: 0.0))
    }
    /// end path
    var circleBigPath: UIBezierPath {
        return UIBezierPath(ovalIn: CGRect(x: 2.5, y: 17.5, width: 95.0, height: 95.0))
    }
    
    
    override init(){
        super.init()
        self.fillColor = UIColor.colorWithHexString(hex: "#da70d6").cgColor
        self.path = circleSmallPath.cgPath
    }
    
    func expand(){

        let expandAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        expandAnimation.fromValue = circleSmallPath.cgPath
        expandAnimation.toValue = circleBigPath.cgPath
        expandAnimation.duration = 0.3
        expandAnimation.fillMode = kCAFillModeForwards
        expandAnimation.isRemovedOnCompletion = false
        self.add(expandAnimation, forKey: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
