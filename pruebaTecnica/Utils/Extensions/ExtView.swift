//
//  ExtView.swift
//  pruebaTecnica
//
//  Created by Mac Mini 5 on 11/1/23.
//

import UIKit

extension UIView {
    func elevate(elevation: Double) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: elevation)
        self.layer.shadowRadius = CGFloat(elevation)
        self.layer.shadowOpacity = 0.24
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func setStatusColor(status: String) {
        if status == "Alive" {
            backgroundColor = .green
        } else if status == "Dead" {
            backgroundColor = .red
        } else {
            backgroundColor = .gray
        }
    }
}
