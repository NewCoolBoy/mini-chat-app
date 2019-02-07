//
//  Utilisateurs.swift
//  apptchat
//
//  Created by Faycal Zehana on 17/09/2018.
//  Copyright © 2018 Faycal Zehana. All rights reserved.
//

import UIKit

class Utilisateurs {
    private var _id: String
    private var _prenom: String
    private var _nom: String
    private var _texte: String?
    private var _imageUrl: String?
    private var _email: String
    
    
    var id: String {
        return _id
    }
    var prenom: String {
        return _prenom
    }
    var nom: String {
        return _nom
    }
    var texte : String? {
        return _texte
    }
    var imageUrl : String? {
        return _imageUrl
    }
    var email : String {
        return _email
    }
    init(id: String,prenom: String,nom: String, texte: String?,imageUrl: String?, email: String) {
        self._id = id
        self._prenom = prenom
        self._nom = nom
        self._texte = texte
        self._email = email
        self._imageUrl = imageUrl
    }
    func updateChange(cle: String, valeur: String){
        switch cle {
        case PRENOM: self._prenom = valeur
        case NOM: self._nom = valeur
        case ACCEUIL: self._texte = valeur
        default: break
        }
    }
    
    
    
    
    
    
}
