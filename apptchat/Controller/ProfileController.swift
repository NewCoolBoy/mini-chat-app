//
//  ProfileController.swift
//  apptchat
//
//  Created by Faycal Zehana on 17/09/2018.
//  Copyright © 2018 Faycal Zehana. All rights reserved.
//

import UIKit
import FirebaseAuth

class ProfileController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate,Alertable {
   

    
   
    @IBOutlet weak var mdpLabel: UITextField!
    @IBOutlet weak var prenomLabel: UITextField!
    @IBOutlet weak var nomLabel: UITextField!
    @IBOutlet weak var photoProfil: ImageArrondie!
    
    var picker = UIImagePickerController()
    var monID: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        picker.delegate = self
        picker.allowsEditing = true
        
        photoProfil.isUserInteractionEnabled = true
        photoProfil.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(choisir)))
        navigationItem.title = "Mon profile"
        Donnees().obtenirUtilisateurSpe(id: monID) { (user) -> (Void) in
            if let utilisateur = user {
                self.prenomLabel.text = utilisateur.prenom
                self.nomLabel.text = utilisateur.nom
                self.photoProfil.telecharger(utilisateur.imageUrl)
                self.mdpLabel.text = utilisateur.texte
            }
        }
        
    }
    
    @objc func choisir(){
        self.cameras(picker: picker)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var image : UIImage?
        if let originale = info[UIImagePickerControllerOriginalImage] as? UIImage {
            image = originale
        } else if let editer = info[UIImagePickerControllerEditedImage] as? UIImage {
            image = editer
        }
        
        if let img = image {
            photoProfil.image = img
            Stockage().sauvegarderImageProfile(image: img, id: monID, controller: self)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sauvebarder(_ sender: Any) {
        
    }
    @IBAction func deconnexionButton(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch {
            PopUp.montrer.afficherErreur(titre: "Erreur", message: "Deconnexion echouée", controller: self)
            return
        }
        view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        
    }

}
