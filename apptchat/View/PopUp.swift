//
//  PopUp.swift
//  apptchat
//
//  Created by Faycal Zehana on 17/09/2018.
//  Copyright © 2018 Faycal Zehana. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class PopUp {
    
    static let montrer = PopUp()
    
    
    func camera(controller: UIViewController, picker: UIImagePickerController) {
        let popup = UIAlertController(title: "Que voulez-vous utiliser?", message: nil, preferredStyle: .alert)
        let photo = UIAlertAction(title: "Appareil photo", style: .default) { (action) in
            picker.sourceType = .camera
            controller.present(picker, animated: true, completion: nil)
        }
        let gallerie = UIAlertAction(title: "Gallerie de photos", style: .default) { (action) in
            picker.sourceType = .photoLibrary
            controller.present(picker, animated: true, completion: nil)
        }
        let annuler = UIAlertAction(title: "Annuler", style: .cancel, handler: nil)
        popup.addAction(photo)
        popup.addAction(gallerie)
        popup.addAction(annuler)
        controller.present(popup, animated: true, completion: nil)
    }
    func afficherErreur (titre: String,message: String, controller: UIViewController){
        let alert = UIAlertController(title: titre, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(ok)
        controller.present(alert, animated: true, completion: nil)
    }
    func creerUnProfile (email: String,mdp: String,controller: UIViewController, entree: [String], completion: @escaping SuccessCompletion){
        let alert = UIAlertController(title: "Inscription", message: "Veuillez completer vos informations afin de vous inscrire", preferredStyle: .alert)
        for a in entree {
            alert.addTextField { (texte) in
                texte.placeholder = a
            }
        }
        let ok = UIAlertAction(title: "Ok", style: .default) { (action) in
            var dict : [String:String] = [:]
            for x in 0..<entree.count {
                if let tfs = alert.textFields, tfs.count > x {
                    let texteF = tfs[x] as UITextField
                    if let string = texteF.text, string != "" {
                        dict[entree[x]] = string
                    }
                }
            }
            if dict.count == entree.count {
                Auth.auth().createUser(withEmail: email, password: mdp, completion: { (auth, error) in
                    let id = (auth?.user.uid)!
                    let ref = Reference().UtilisateurSpe(id: id)
                    dict[EMAIL] = email
                    ref.updateChildValues(dict)
                })
                
                completion(true)
            } else {
                completion(false)
            }
        }
        alert.addAction(ok)
        controller.present(alert, animated: true, completion: nil)
    }
    
}
