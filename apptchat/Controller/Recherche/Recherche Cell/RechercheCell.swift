//
//  RechercheCell.swift
//  apptchat
//
//  Created by Faycal Zehana on 18/09/2018.
//  Copyright © 2018 Faycal Zehana. All rights reserved.
//

import UIKit

class RechercheCell: UITableViewCell {
    
    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var nomLabel: UILabel!
    @IBOutlet weak var photo: PhotoProfilArrondie!
    
    var utilisateur : Utilisateurs!
    var controller: RechercheController?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUp(utilisateur: Utilisateurs,controller: RechercheController){
        self.utilisateur = utilisateur
        self.controller = controller
        self.nomLabel.text = self.utilisateur.nom + " " + self.utilisateur.prenom
        self.msgLabel.text = self.utilisateur.texte
        self.photo.telecharger(self.utilisateur.imageUrl)
//        controller.tableau.reloadData()
        Donnees().observerChangementUtilisateur(id: self.utilisateur.id) { (key, value) -> (Void) in
            if let cle = key, let valeur = value {
                self.utilisateur.updateChange(cle: cle, valeur: valeur)
                
                controller.tableau.reloadData()
            }
            
        }
        
    }
    
    
}
