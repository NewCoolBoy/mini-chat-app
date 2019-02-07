//
//  PhotoProfilArrondie.swift
//  apptchat
//
//  Created by Faycal Zehana on 18/09/2018.
//  Copyright © 2018 Faycal Zehana. All rights reserved.
//

import UIKit

class PhotoProfilArrondie: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    func setUp(){
        
        layer.cornerRadius = frame.width / 2
        clipsToBounds = true
        contentMode = .scaleAspectFill
    }
    
}
