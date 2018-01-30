//
//  CircleLayer.swift
//  LoadingAnimation
//
//  Created by 李旭阳 on 2018/1/24.
//  Copyright © 2018年 李文静. All rights reserved.
//

import UIKit

class CircleLayer: CAShapeLayer {
    
    let YAnimationDuration: CFTimeInterval = 0.3
    let YAnimationBeginTime: CFTimeInterval = 0.0
    
    var circleSmallPath: UIBezierPath {
        return UIBezierPath(ovalIn: CGRect(x: 50.0, y: 50.0, width: 0.0, height: 0.0))
    }
    var circleBigPath: UIBezierPath {
        return UIBezierPath(ovalIn: CGRect(x: 2.5, y: 17.5, width: 95.0, height: 95.0))
    }
    var circleVerticalSquishPath: UIBezierPath {
        return UIBezierPath(ovalIn: CGRect(x: 2.5, y: 20.0, width: 95.0, height: 90.0))
    }
    var circleHorizontalSquishPath: UIBezierPath {
        return UIBezierPath(ovalIn: CGRect(x: 5.0, y: 20.0, width: 90.0, height: 90.0))
    }
    
    
    override init(){
        super.init()
        self.fillColor = UIColor.colorWithHexString(hex: "#da70d6").cgColor
        self.path = circleSmallPath.cgPath
    }
    
    func wobbleAnimate() {
        let animation1: CABasicAnimation = CABasicAnimation(keyPath: "path")
        animation1.fromValue = circleBigPath.cgPath
        animation1.toValue = circleVerticalSquishPath.cgPath
        animation1.beginTime = YAnimationBeginTime
        animation1.duration = YAnimationDuration
        
        let animation2: CABasicAnimation = CABasicAnimation(keyPath: "path")
        animation2.fromValue = circleVerticalSquishPath.cgPath
        animation2.toValue = circleHorizontalSquishPath.cgPath
        animation2.beginTime = animation1.beginTime + animation1.duration
        animation2.duration = YAnimationDuration
        
        let animation3: CABasicAnimation = CABasicAnimation(keyPath: "path")
        animation3.fromValue = circleHorizontalSquishPath.cgPath
        animation3.toValue = circleVerticalSquishPath.cgPath
        animation3.beginTime = animation2.beginTime+animation2.duration
        animation3.duration = YAnimationDuration
        
        let animation4: CABasicAnimation = CABasicAnimation(keyPath: "path")
        animation4.fromValue = circleVerticalSquishPath.cgPath
        animation4.toValue = circleBigPath.cgPath
        animation4.beginTime = animation3.beginTime+animation3.duration
        animation4.duration = YAnimationDuration
        
        let animationGroup: CAAnimationGroup = CAAnimationGroup()
        animationGroup.animations = [animation1,animation2,animation3,animation4]
        animationGroup.duration = 4*YAnimationDuration
        animationGroup.repeatCount = 2
        add(animationGroup, forKey: nil)
    }
    
    func expand(){

        let expandAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        expandAnimation.fromValue = circleSmallPath.cgPath
        expandAnimation.toValue = circleBigPath.cgPath
        expandAnimation.duration = YAnimationDuration
        expandAnimation.fillMode = kCAFillModeForwards
        expandAnimation.isRemovedOnCompletion = false
        self.add(expandAnimation, forKey: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
