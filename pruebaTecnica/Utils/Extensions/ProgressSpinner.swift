//
//  ProgressSpinner.swift
//  pruebaTecnica
//
//  Created by Mac Mini 5 on 11/1/23.
//

import UIKit

var vSpinner: UIView?

extension UIViewController {
    func showProgress(onView: UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = .black
        spinnerView.alpha = 0.5
        
        var style: UIActivityIndicatorView.Style
        
        if #available(iOS 13.0, *) {
            style = UIActivityIndicatorView.Style.medium
        } else {
            style = UIActivityIndicatorView.Style.whiteLarge
        }
    
        let activityIndicator = UIActivityIndicatorView.init(style: style)
        activityIndicator.color = .white
        activityIndicator.startAnimating()
        activityIndicator.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(activityIndicator)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func hideProgress() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
