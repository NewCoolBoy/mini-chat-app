//
//  ExtUIView.swift
//  apptchat
//
//  Created by Faycal Zehana on 21/09/2018.
//  Copyright © 2018 Faycal Zehana. All rights reserved.
//

import UIKit

extension UIView {
    
    
    func creerActivity (){
        
        let blur = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        blur.frame = self.bounds
        blur.tag = 5
        addSubview(blur)
        
        let acivity = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        acivity.center = self.center
        acivity.tag = 6
        acivity.color = UIColor.darkGray
        acivity.startAnimating()
        addSubview(acivity)
    }
    func supprimerActivity(){
        for view in subviews {
            if view.tag == 5 {
                view.removeFromSuperview()
            }
            if view.tag == 6,let act = view as? UIActivityIndicatorView {
                act.stopAnimating()
                act.removeFromSuperview()
            }
        }
    }
    
}
