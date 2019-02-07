//
//  Storage.swift
//  apptchat
//
//  Created by Faycal Zehana on 20/09/2018.
//  Copyright © 2018 Faycal Zehana. All rights reserved.
//

import UIKit
import SDWebImage

class Stockage {
    
    func sauvegarderImageProfile(image: UIImage?, id: String,controller: UIViewController){
        guard let monImage = image else {return}
        guard let imageTransformee = UIImageJPEGRepresentation(monImage, 0.1) else {return}
        let ref = Reference().databaseImageProfile(id: id)
        ref.putData(imageTransformee, metadata: nil) { (data, error) in
            if let erreur = error {
                PopUp().afficherErreur(titre: "Erreur", message: erreur.localizedDescription, controller: controller)
            } else {
                ref.downloadURL(completion: { (url, error) in
                    if error == nil, let urlString = url?.absoluteString {
                        let re = Reference().UtilisateurSpe(id: id)
                        re.updateChildValues([IMAGE_URL: urlString])
                    }
                })
            }
        }
    }
    
}
