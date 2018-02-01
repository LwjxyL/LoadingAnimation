//
//  ViewController.swift
//  LoadingAnimation
//
//  Created by 李旭阳 on 2018/1/24.
//  Copyright © 2018年 李文静. All rights reserved.
//

import UIKit

class ViewController: UIViewController,AnimationViewDelegate {

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
        animationView.delegate = self
        animationView.parentFrame = view.frame
        view.addSubview(animationView)
    }
    
    func completeAnimation() {
        animationView.removeFromSuperview()
        view.backgroundColor = UIColor.colorWithHexString(hex: "#40e0b0")
        
        let label: UILabel = UILabel(frame: view.frame)
        label.textColor = UIColor.white
        label.font = UIFont(name: "HelveticaNeue-Thin", size: 50.0)
        label.textAlignment = NSTextAlignment.center
        label.text = "Welcome"
        label.transform = label.transform.scaledBy(x: 0.25, y: 0.25)
        view.addSubview(label)
        
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.curveEaseInOut,animations: ({
            
            label.transform = label.transform.scaledBy(x: 4.0, y: 4.0)
        }), completion: { finished in
            self.addTouchButton()
        })
        
    }
    
    func addTouchButton() {
        let button = UIButton()
        button.frame = CGRect(x: 0.0,y: 0.0,width: view.bounds.width,height: view.bounds.height)
        button.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func btnClick() {
        view.backgroundColor = UIColor.white
        view.subviews.forEach { (
            $0.removeFromSuperview()
            )}
        animationView = AnimationView(frame: CGRect.zero)
        addAnimationView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

