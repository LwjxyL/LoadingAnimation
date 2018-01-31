//
//  AnimationView.swift
//  LoadingAnimation
//
//  Created by 李旭阳 on 2018/1/24.
//  Copyright © 2018年 李文静. All rights reserved.
//

import UIKit

class AnimationView: UIView {

    let circle = CircleLayer()
    let triangle = TriangleLayer()
    let redRectangle = RectangleLayer()
    let blueRectangle = RectangleLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        addCircleLayer()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCircleLayer() {
        self.layer.addSublayer(circle)
        // 圆从小变大动画
        circle.expand()
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(wobbleCircleLayer), userInfo: nil, repeats: false)
        
    }
    
    // 圆型弹动动画
    @objc func wobbleCircleLayer(){
        circle.wobbleAnimate()
        layer.addSublayer(triangle)
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(showTriangleAnimation), userInfo: nil, repeats: false)
    }
    
    // 三角动画
    @objc func showTriangleAnimation() {
        triangle.triangleAnimation()
        Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(transformAnima), userInfo: nil, repeats: false)
    }
    
    @objc func transformAnima() {
        transformRotationZ()
        circle.contract()
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(drawRedRectangleAnimation), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 1.2, target: self, selector: #selector(drawBlueRectangleAnimation), userInfo: nil, repeats: false)
    }

    func transformRotationZ() {
        self.layer.anchorPoint = CGPoint(x: 0.5, y: 0.65)
        let rotationAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = CGFloat(M_PI * 2)
        rotationAnimation.duration = 0.45
        rotationAnimation.isRemovedOnCompletion = true
        layer.add(rotationAnimation, forKey: nil)
    }

    @objc func drawRedRectangleAnimation() {
        layer.addSublayer(redRectangle)
        redRectangle.strokeChangeWithColor(color: UIColor.colorWithHexString(hex: "#da70d6"))
    }
    
    @objc func drawBlueRectangleAnimation() {
        layer.addSublayer(blueRectangle)
        blueRectangle.strokeChangeWithColor(color: UIColor.colorWithHexString(hex: "#40e0b0"))
    }
    
}
