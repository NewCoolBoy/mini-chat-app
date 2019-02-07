//
//  extView.swift
//  apptchat
//
//  Created by Faycal Zehana on 21/09/2018.
//  Copyright © 2018 Faycal Zehana. All rights reserved.
//

import UIKit

extension UIViewController {
    
    
    func miseEnPlaceClavier(){
        NotificationCenter.default.addObserver(self, selector: #selector(sortirClavier(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(rentrerClavier(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(rangerLeClavier)))
    }
    @objc func sortirClavier(_ notification: Notification){
        if let rectClavier = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue, view.frame.minY == 0 {
            UIView.animate(withDuration: 0.25) {
                self.view.frame.origin.y -= rectClavier.height
            }
        }
        
    }
    @objc func rentrerClavier(_ notification: Notification){
        UIView.animate(withDuration: 0.25) {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }
    }
    @objc func rangerLeClavier(){
        view.endEditing(true)
    }
    
}
