//
//  ViewController.swift
//  LoadingAnimation
//
//  Created by 李旭阳 on 2018/1/24.
//  Copyright © 2018年 李文静. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var animationView = AnimationView(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addAnimationView()
    }

    func addAnimationView(){
        let size: CGFloat = 100.0
        animationView.frame = CGRect(x: self.view.frame.width/2-size/2, y: self.view.frame.height/2-size/2, width: size, height: size)
        view.addSubview(animationView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

