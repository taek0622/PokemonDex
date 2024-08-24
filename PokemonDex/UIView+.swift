//
//  UIView+.swift
//  PokemonDex
//
//  Created by 김민택 on 8/24/24.
//

import UIKit

extension UIView {
    func configureGradientBackground(colors: [CGColor], locations: [NSNumber], startPoint: CGPoint, endPoint: CGPoint, frame: CGRect) {
        let viewGradient = CAGradientLayer()
        viewGradient.colors = colors
        viewGradient.locations = locations
        viewGradient.startPoint = startPoint
        viewGradient.endPoint = endPoint
        viewGradient.frame = frame
        self.layer.insertSublayer(viewGradient, at: 0)
    }
}
