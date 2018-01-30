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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        addCircleLayer()
    }
    
    
    func addCircleLayer() {
        self.layer.addSublayer(circle)
        circle.expand()
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(wobbleCircleLayer), userInfo: nil, repeats: false)
        
    }
    
    @objc func wobbleCircleLayer(){
        circle.wobbleAnimate()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
