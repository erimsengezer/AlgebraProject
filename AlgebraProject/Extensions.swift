//
//  Extensions.swift
//  AlgebraProject
//
//  Created by Erim Şengezer on 23.10.2019.
//  Copyright © 2019 Erim Şengezer. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func rotate360DegreesL(duration: CFTimeInterval = 1.0, completionDelegate: AnyObject? = nil) {
           let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
           rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(.pi * -2.0)
            rotateAnimation.duration = duration
        if let delegate: AnyObject = completionDelegate {
            rotateAnimation.delegate = delegate as? CAAnimationDelegate
        }
        self.layer.add(rotateAnimation, forKey: nil)
    }
    
    func rotate360DegreesR(duration: CFTimeInterval = 1.0, completionDelegate: AnyObject? = nil) {
           let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
           rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(.pi * 2.0)
            rotateAnimation.duration = duration
        if let delegate: AnyObject = completionDelegate {
            rotateAnimation.delegate = delegate as? CAAnimationDelegate
        }
        self.layer.add(rotateAnimation, forKey: nil)
    }
}
