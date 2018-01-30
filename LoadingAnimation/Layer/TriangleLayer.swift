//
//  TriangleLayer.swift
//  LoadingAnimation
//
//  Created by 李旭阳 on 2018/1/30.
//  Copyright © 2018年 李文静. All rights reserved.
//

import UIKit

class TriangleLayer: CAShapeLayer {
    
    private let paddingSpace: CGFloat = 30.0
    
    var smallTrianglePath: UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 5.0+paddingSpace, y: 95.0))
        path.addLine(to: CGPoint(x: 50.0, y: 12.5+paddingSpace))
        path.addLine(to: CGPoint(x: 95.0-paddingSpace, y: 95.0))
        path.close()
        return path
    }
    var leftTrianglePath: UIBezierPath {
        let trianglePath = UIBezierPath()
        trianglePath.move(to: CGPoint(x: 5.0, y: 95.0))
        trianglePath.addLine(to: CGPoint(x: 50.0, y: 12.5 + paddingSpace))
        trianglePath.addLine(to: CGPoint(x: 95.0 - paddingSpace, y: 95.0))
        trianglePath.close()
        return trianglePath
    }
    
    var rightTrianglePath: UIBezierPath {
        let trianglePath = UIBezierPath()
        trianglePath.move(to: CGPoint(x: 5.0, y: 95.0))
        trianglePath.addLine(to: CGPoint(x: 50.0, y: 12.5 + paddingSpace))
        trianglePath.addLine(to: CGPoint(x: 95.0, y: 95.0))
        trianglePath.close()
        return trianglePath
    }
    
    var topTrianglePath: UIBezierPath {
        let trianglePath = UIBezierPath()
        trianglePath.move(to: CGPoint(x: 5.0, y: 95.0))
        trianglePath.addLine(to: CGPoint(x: 50.0, y: 12.5))
        trianglePath.addLine(to: CGPoint(x: 95.0, y: 95.0))
        trianglePath.close()
        return trianglePath
    }
    
    override init() {
        super.init()
        lineWidth = 7.0
        fillColor = UIColor.colorWithHexString(hex: "#da70d6").cgColor
        strokeColor = UIColor.colorWithHexString(hex: "#da70d6").cgColor
        lineCap = kCALineCapRound
        lineJoin = kCALineJoinRound
        path = smallTrianglePath.cgPath
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func triangleAnimation(){
        let triangleAnimationLeft: CABasicAnimation = CABasicAnimation(keyPath: "path")
        triangleAnimationLeft.fromValue = smallTrianglePath.cgPath
        triangleAnimationLeft.toValue =  leftTrianglePath.cgPath
        triangleAnimationLeft.beginTime = 0.0
        triangleAnimationLeft.duration = 0.25
        
        let triangleAnimationRight: CABasicAnimation = CABasicAnimation(keyPath: "path")
        triangleAnimationRight.fromValue = leftTrianglePath.cgPath
        triangleAnimationRight.toValue = rightTrianglePath.cgPath
        triangleAnimationRight.beginTime = triangleAnimationLeft.beginTime + triangleAnimationLeft.duration
        triangleAnimationRight.duration = 0.25
        
        let triangleAnimationTop: CABasicAnimation = CABasicAnimation(keyPath: "path")
        triangleAnimationTop.fromValue = rightTrianglePath.cgPath
        triangleAnimationTop.toValue = topTrianglePath.cgPath
        triangleAnimationTop.beginTime = triangleAnimationRight.beginTime + triangleAnimationRight.duration
        triangleAnimationTop.duration = 0.20
        
        let triangleAnimationGroup: CAAnimationGroup = CAAnimationGroup()
        triangleAnimationGroup.animations = [triangleAnimationLeft,triangleAnimationRight,triangleAnimationTop]
        triangleAnimationGroup.duration = triangleAnimationTop.beginTime + triangleAnimationTop.duration
        triangleAnimationGroup.fillMode = kCAFillModeForwards
        triangleAnimationGroup.isRemovedOnCompletion = false
        add(triangleAnimationGroup, forKey: nil)
    }
}
