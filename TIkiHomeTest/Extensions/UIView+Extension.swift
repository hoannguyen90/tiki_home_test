//
//  UIView+Extension.swift
//  TIkiHomeTest
//
//  Created by Nguyen Hoan on 3/15/19.
//  Copyright © 2019 com.hoan. All rights reserved.
//

import Foundation
import UIKit

var vSpinner : UIView?

extension UIView {
    func showLoading() {
        let spinnerView = UIView.init(frame: self.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            self.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
