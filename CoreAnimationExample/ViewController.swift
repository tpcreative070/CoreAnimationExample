//
//  ViewController.swift
//  CoreAnimationExample
//
//  Created by phong070 on 28/07/2021.
//

import UIKit

class ViewController: UIViewController {
    let layer = CALayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        layer.backgroundColor = UIColor.systemRed.cgColor
        layer.frame = CGRect(x: 100, y: 100, width: 120, height: 120)
        view.layer.addSublayer(layer)
        
    }
    
    func animateMovement(){
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = CGPoint(x: layer.frame.origin.x, y: layer.frame.origin.y)
        animation.toValue = CGPoint(x: 300, y: 400)
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        layer.add(animation,forKey : nil)
    }
    
}

