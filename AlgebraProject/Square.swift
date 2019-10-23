//
//  Square.swift
//  AlgebraProject
//
//  Created by Erim Şengezer on 23.10.2019.
//  Copyright © 2019 Erim Şengezer. All rights reserved.
//

import Foundation
import UIKit

class Square: UIView {
    override func draw(_ rect: CGRect) {
      let path = UIBezierPath(ovalIn: rect)
      UIColor.green.setFill()
      path.fill()
    }
}


