//
//  WaveLayer.swift
//  LoadingAnimation
//
//  Created by 李旭阳 on 2018/2/1.
//  Copyright © 2018年 李文静. All rights reserved.
//

import UIKit

class WaveLayer: CAShapeLayer {

    let YAnimationDuration: CFTimeInterval = 0.18
    
    var wavePathPre: UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0.0, y: 100.0))
        path.addLine(to: CGPoint(x: 0.0, y: 99.0))
        path.addLine(to: CGPoint(x: 100.0, y: 99.0))
        path.addLine(to: CGPoint(x: 100.0, y: 100.0))
        path.addLine(to: CGPoint(x: 0.0, y: 100.0))
        path.close()
        return path
    }
    
    var wavePathStarting: UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0.0, y: 100.0))
        path.addLine(to: CGPoint(x: 0.0, y: 80.0))
        path.addCurve(to: CGPoint(x: 100.0,y: 80.0), controlPoint1: CGPoint(x: 30.0,y: 70.0), controlPoint2: CGPoint(x: 40.0, y: 90.0))
        path.addLine(to: CGPoint(x: 100.0, y: 100.0))
        path.addLine(to: CGPoint(x: 0.0, y: 100.0))
        path.close()
        return path
    }
    
    var wavePathLow: UIBezierPath {
        let arcPath = UIBezierPath()
        arcPath.move(to: CGPoint(x: 0.0, y: 100.0))
        arcPath.addLine(to: CGPoint(x: 0.0, y: 60.0))
        arcPath.addCurve(to: CGPoint(x: 100.0, y: 60.0), controlPoint1: CGPoint(x: 30.0, y: 65.0), controlPoint2: CGPoint(x: 40.0, y: 50.0))
        arcPath.addLine(to: CGPoint(x: 100.0, y: 100.0))
        arcPath.addLine(to: CGPoint(x: 0.0, y: 100.0))
        arcPath.close()
        return arcPath
    }
    
    var wavePathMid: UIBezierPath {
        let arcPath = UIBezierPath()
        arcPath.move(to: CGPoint(x: 0.0, y: 100.0))
        arcPath.addLine(to: CGPoint(x: 0.0, y: 40.0))
        arcPath.addCurve(to: CGPoint(x: 100.0, y: 40.0), controlPoint1: CGPoint(x: 30.0, y: 30.0), controlPoint2: CGPoint(x: 40.0, y: 50.0))
        arcPath.addLine(to: CGPoint(x: 100.0, y: 100.0))
        arcPath.addLine(to: CGPoint(x: 0.0, y: 100.0))
        arcPath.close()
        return arcPath
    }
    
    var wavePathHigh: UIBezierPath {
        let arcPath = UIBezierPath()
        arcPath.move(to: CGPoint(x: 0.0, y: 100.0))
        arcPath.addLine(to: CGPoint(x: 0.0, y: 20.0))
        arcPath.addCurve(to: CGPoint(x: 100.0, y: 20.0), controlPoint1: CGPoint(x: 30.0, y: 25.0), controlPoint2: CGPoint(x: 40.0, y: 10.0))
        arcPath.addLine(to: CGPoint(x: 100.0, y: 100.0))
        arcPath.addLine(to: CGPoint(x: 0.0, y: 100.0))
        arcPath.close()
        return arcPath
    }
    
    var wavePathComplete: UIBezierPath {
        let arcPath = UIBezierPath()
        arcPath.move(to: CGPoint(x: 0.0, y: 100.0))
        arcPath.addLine(to: CGPoint(x: 0.0, y: -5.0))
        arcPath.addLine(to: CGPoint(x: 100.0, y: -5.0))
        arcPath.addLine(to: CGPoint(x: 100.0, y: 100.0))
        arcPath.addLine(to: CGPoint(x: 0.0, y: 100.0))
        arcPath.close()
        return arcPath
    }
    
    
    
    override init() {
        super.init()
        fillColor = UIColor.colorWithHexString(hex: "#40e0b0").cgColor
        path = wavePathStarting.cgPath
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animate() {

        let waveAnimationPre: CABasicAnimation = CABasicAnimation(keyPath: "path")
        waveAnimationPre.fromValue = wavePathPre.cgPath
        waveAnimationPre.toValue = wavePathStarting.cgPath
        waveAnimationPre.beginTime = 0.0
        waveAnimationPre.duration = YAnimationDuration

        let waveAnimationLow: CABasicAnimation = CABasicAnimation(keyPath: "path")
        waveAnimationLow.fromValue = wavePathStarting.cgPath
        waveAnimationLow.toValue = wavePathLow.cgPath
        waveAnimationLow.beginTime = waveAnimationPre.beginTime + waveAnimationPre.duration
        waveAnimationLow.duration = YAnimationDuration

        let waveAnimationMid: CABasicAnimation = CABasicAnimation(keyPath: "path")
        waveAnimationMid.fromValue = wavePathLow.cgPath
        waveAnimationMid.toValue = wavePathMid.cgPath
        waveAnimationMid.beginTime = waveAnimationLow.beginTime + waveAnimationLow.duration
        waveAnimationMid.duration = YAnimationDuration

        let waveAnimationHigh: CABasicAnimation = CABasicAnimation(keyPath: "path")
        waveAnimationHigh.fromValue = wavePathMid.cgPath
        waveAnimationHigh.toValue = wavePathHigh.cgPath
        waveAnimationHigh.beginTime = waveAnimationMid.beginTime + waveAnimationMid.duration
        waveAnimationHigh.duration = YAnimationDuration

        let waveAnimationComplete: CABasicAnimation = CABasicAnimation(keyPath: "path")
        waveAnimationComplete.fromValue = wavePathHigh.cgPath
        waveAnimationComplete.toValue = wavePathComplete.cgPath
        waveAnimationComplete.beginTime = waveAnimationHigh.beginTime + waveAnimationHigh.duration
        waveAnimationComplete.duration = YAnimationDuration

        let arcAnimationGroup: CAAnimationGroup = CAAnimationGroup()
        arcAnimationGroup.animations = [waveAnimationPre, waveAnimationLow, waveAnimationMid, waveAnimationHigh, waveAnimationComplete]
        arcAnimationGroup.duration = waveAnimationComplete.beginTime + waveAnimationComplete.duration
        arcAnimationGroup.fillMode = kCAFillModeForwards
        arcAnimationGroup.isRemovedOnCompletion = false
        add(arcAnimationGroup, forKey: nil)
    }
    
}
