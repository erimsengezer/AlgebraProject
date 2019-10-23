//
//  AnimationViewController.swift
//  AlgebraProject
//
//  Created by Erim Şengezer on 23.10.2019.
//  Copyright © 2019 Erim Şengezer. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    let rect1 = Draw(frame: CGRect(
        origin: CGPoint(x: 20, y: (UIScreen.main.bounds.height + 50) / 2 ),
        size: CGSize(width: 50, height: 50)))
    
    let rect2 = Draw(frame: CGRect(
        origin: CGPoint(x: 120, y: (UIScreen.main.bounds.height + 50) / 2),
        size: CGSize(width: 50, height: 50)))
    
    let rect3 = Draw(frame: CGRect(
        origin: CGPoint(x: 220, y: (UIScreen.main.bounds.height + 50) / 2),
        size: CGSize(width: 50, height: 50)))
    
    let rect4 = Draw(frame: CGRect(
        origin: CGPoint(x: 320, y: (UIScreen.main.bounds.height + 50) / 2),
        size: CGSize(width: 50, height: 50)))
    
    var isRotating = false
    var shouldStopRotating = false
    var timer: Timer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Square Background color
        let greenColor = UIColor(red: 0.0/255.0, green: 130.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    
        rect1.backgroundColor = greenColor
        rect2.backgroundColor = greenColor
        rect3.backgroundColor = greenColor
        rect4.backgroundColor = greenColor
        
        //Square Gesture Recognizer
        rect1.isUserInteractionEnabled = true
        rect2.isUserInteractionEnabled = true
        rect3.isUserInteractionEnabled = true
        rect4.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(rectClicked))
        rect1.addGestureRecognizer(gestureRecognizer)
        
        let gestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(rectClicked))
        rect2.addGestureRecognizer(gestureRecognizer2)
        
        let gestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(rectClicked))
        rect3.addGestureRecognizer(gestureRecognizer3)
        
        let gestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(rectClicked))
        rect4.addGestureRecognizer(gestureRecognizer4)
        
        
        
    }
    
    @objc func rectClicked() {
        print("Touched on square")
    }
    
    
    @IBAction func startAnimation(_ sender: Any) {
        self.view.addSubview(rect1)
        self.view.addSubview(rect2)
        self.view.addSubview(rect3)
        self.view.addSubview(rect4)
        self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(animation), userInfo: nil, repeats: true)
        
    }
    
    
    @objc func animation() {
        if self.isRotating == false{
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerfunc), userInfo: nil, repeats: true)
            self.isRotating = true
        }
    }
    
    @objc func timerfunc(){
        self.rect1.rotate360DegreesL()
        self.rect2.rotate360DegreesR()
        self.rect3.rotate360DegreesL()
        self.rect4.rotate360DegreesR()
    }

}

class Draw: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        let h = rect.height
        let w = rect.width
//        var color:UIColor = UIColor.green
        

        var drect = CGRect(x: (w * 0.25),y: (h * 0.25),width: (w * 0.5),height: (h * 0.5))
        var bpath:UIBezierPath = UIBezierPath(rect: drect)
        
//        color.set()
        bpath.stroke()

        print("it ran")

        NSLog("drawRect has updated the view")

    }

}
