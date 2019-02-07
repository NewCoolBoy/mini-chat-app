//
//  Reference.swift
//  apptchat
//
//  Created by Faycal Zehana on 17/09/2018.
//  Copyright © 2018 Faycal Zehana. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage


class Reference {
    
    // Utilisateur
    
    var databaseUtilisateurs : DatabaseReference {
        return Database.database().reference().child(UTILISATEURS)
    }
    func UtilisateurSpe(id:String) -> DatabaseReference {
        return databaseUtilisateurs.child(id)
    }
    
    // Messages
    
    var databaseMessages : DatabaseReference {
        return Database.database().reference().child(MESSAGES)
    }
    func envoiMessage(from: String, to: String) -> DatabaseReference {
        return databaseMessages.child(from).child(to)
    }
    var databaseAmis : DatabaseReference {
        return Database.database().reference().child(AMIS)
    }
    func messageAmiSpecifique(id: String)-> DatabaseReference{
        return databaseAmis.child(id)
    }
    func dernierMessageAmis(from: String, to: String) -> DatabaseReference{
        return databaseAmis.child(from).child(to)
    }
     // STOCKAGE
    
    var databaseStockageImage : StorageReference {
        return Storage.storage().reference().child(IMAGE_PROFILE)
    }
    func databaseImageProfile (id: String) -> StorageReference {
        return databaseStockageImage.child(id)
    }
    
}
