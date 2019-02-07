//
//  ExtImage.swift
//  apptchat
//
//  Created by Faycal Zehana on 20/09/2018.
//  Copyright © 2018 Faycal Zehana. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    func telecharger(_ urlString: String?){
//        image = #imageLiteral(resourceName: "photo_profil")
        guard let lien = urlString else {
            return
        }
        guard let url = URL(string: lien) else {
            return
        }
        sd_setImage(with: url, completed: nil)
    }
    
}
