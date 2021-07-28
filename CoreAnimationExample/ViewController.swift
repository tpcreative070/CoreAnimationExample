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
        
        
        let box = UIView(frame: CGRect(x: 50, y: 50, width: 256, height: 256))
        box.backgroundColor = .blue
        view.addSubview(box)
        box.setAnchorPoint(CGPoint(x: 0, y: 0))
        UIView.animate(withDuration: 3) {
            box.transform = CGAffineTransform(rotationAngle: .pi)
        }
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


extension UIView {
    func setAnchorPoint(_ point: CGPoint) {
        var newPoint = CGPoint(x: bounds.size.width * point.x, y: bounds.size.height * point.y)
        var oldPoint = CGPoint(x: bounds.size.width * layer.anchorPoint.x, y: bounds.size.height * layer.anchorPoint.y);

        newPoint = newPoint.applying(transform)
        oldPoint = oldPoint.applying(transform)

        var position = layer.position

        position.x -= oldPoint.x
        position.x += newPoint.x

        position.y -= oldPoint.y
        position.y += newPoint.y

        layer.position = position
        layer.anchorPoint = point
    }
}

