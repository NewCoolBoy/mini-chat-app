//
//  Alertable.swift
//  apptchat
//
//  Created by Faycal Zehana on 20/09/2018.
//  Copyright © 2018 Faycal Zehana. All rights reserved.
//

import UIKit

protocol Alertable {}

extension Alertable where Self:UIViewController {
    func cameras(picker: UIImagePickerController) {
        let popup = UIAlertController(title: "Que voulez-vous utiliser?", message: nil, preferredStyle: .alert)
        let photo = UIAlertAction(title: "Appareil photo", style: .default) { (action) in
            picker.sourceType = .camera
            self.present(picker, animated: true, completion: nil)
        }
        let gallerie = UIAlertAction(title: "Gallerie de photos", style: .default) { (action) in
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true, completion: nil)
        }
        let annuler = UIAlertAction(title: "Annuler", style: .cancel, handler: nil)
        popup.addAction(photo)
        popup.addAction(gallerie)
        popup.addAction(annuler)
      self.present(popup, animated: true, completion: nil)
    }
}
