//
//  ViewArrondie.swift
//  apptchat
//
//  Created by Faycal Zehana on 17/09/2018.
//  Copyright © 2018 Faycal Zehana. All rights reserved.
//

import UIKit

class ViewArrondie: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    func setUp(){
        
        self.layer.cornerRadius = 15
        self.layer.shadowOpacity = 0.75
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.shadowRadius = 10
        
    }
}
