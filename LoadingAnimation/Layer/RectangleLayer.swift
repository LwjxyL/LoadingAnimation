//
//  RectangleLayer.swift
//  LoadingAnimation
//
//  Created by 李旭阳 on 2018/1/31.
//  Copyright © 2018年 李文静. All rights reserved.
//

import UIKit

class RectangleLayer: CAShapeLayer {
    
    var rectanglePath: UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0.0, y: 100.0))
        path.addLine(to: CGPoint(x: 0.0, y: -lineWidth))
        path.addLine(to: CGPoint(x: 100.0, y: -lineWidth))
        path.addLine(to: CGPoint(x: 100.0, y: 100.0))
        path.addLine(to: CGPoint(x: -lineWidth/2, y: 100.0))
        path.close()
        return path
    }
    
    override init() {
        super.init()
        lineWidth = 6.0
        fillColor = UIColor.clear.cgColor
        path = rectanglePath.cgPath
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func strokeChangeWithColor(color: UIColor) {
        strokeColor = color.cgColor
        let strokeAnimation: CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeAnimation.fromValue = 0.0
        strokeAnimation.toValue = 1.0
        strokeAnimation.duration = 0.4
        add(strokeAnimation, forKey: nil)
    }

}
