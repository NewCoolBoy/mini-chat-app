//
//  Donnees.swift
//  apptchat
//
//  Created by Faycal Zehana on 17/09/2018.
//  Copyright © 2018 Faycal Zehana. All rights reserved.
//

import UIKit


class Donnees {
    func obtenirUtilisateurSpe(id: String, completion: UtilisateurCompletion?){
        let ref = Reference().UtilisateurSpe(id: id)
        ref.observe(.value) { (snapshot) in
            if let dict = snapshot.value as? Dictionary<String,AnyObject> {
                let util = self.convertirDictEnUser(cle: snapshot.key, dict: dict)
                completion?(util)
            } else {
                completion?(nil)
            }
        }
        
    }
    func obtenirTousLesUtilisateurs(id: String, completion: UtilisateurCompletion?){
        let ref = Reference().databaseUtilisateurs
        ref.observe(.childAdded) { (snapshot) in
            if let dict = snapshot.value as? Dictionary<String,AnyObject>, snapshot.key != id  {
                
             let util = self.convertirDictEnUser(cle: snapshot.key, dict: dict)
                completion?(util)
            } else {
                completion?(nil)
            }
        }
    }
    func observerChangementUtilisateur(id: String, completion: ValeurChangeesCompletion?){
        let ref = Reference().UtilisateurSpe(id: id)
        ref.observe(.childChanged) { (snapshot) in
            if let valeur = snapshot.value as? String {
               completion?(snapshot.key, valeur)
            } else {
                completion?(nil,nil)
            }
        }
    }
    func convertirDictEnUser(cle: String, dict: Dictionary<String,AnyObject>) -> Utilisateurs? {
        guard let prenom = dict[PRENOM] as? String else {
            return nil
        }
        guard let nom = dict[NOM] as? String else {
            return nil
        }
        guard let acceuil = dict[ACCEUIL] as? String else {
            return nil
        }
        let email = dict[EMAIL] as? String
        let image = dict[IMAGE_URL] as? String
        let utilisateur = Utilisateurs(id: cle, prenom: prenom, nom: nom, texte: acceuil, imageUrl: image, email: email!)
        
        return utilisateur
    }
    func obtenirLeMessage(from: String,to: String, completion: MessageCompletion?){
        let ref = Reference().envoiMessage(from: from, to: to)
        ref.observe(.childAdded) { (snapshot) in
            if let dict = snapshot.value as? Dictionary<String,AnyObject> {
                completion?(self.convertirDictEnMSG(cle: snapshot.key, dict: dict))
            }
        }
    }
    
    func envoyerMessage(from: String, to: String, dict: Dictionary<String,AnyObject>){
        let ref = Reference().envoiMessage(from: from, to: to)
        ref.childByAutoId().updateChildValues(dict)
        
        let refFrom = Reference().dernierMessageAmis(from: from, to: to)
        refFrom.updateChildValues(dict)
        
        let refTo = Reference().dernierMessageAmis(from: to, to: from)
        refTo.updateChildValues(dict)
    }
    func convertirDictEnMSG (cle: String, dict: Dictionary<String,AnyObject>)-> Message? {
        guard let from = dict[FROM] as? String else {
            return nil
        }
        guard let to = dict[TO] as? String else {
            return nil
        }
        guard let date = dict[DATE] as? Double else {
            return nil
        }
        let texte = dict[MSG] as? String
        let image = dict[IMAGE_URL] as? String
        let hauteur = dict[HAUTEUR] as? Double
        let largeur = dict[LARGEUR] as? Double
        let message = Message(id: cle, from: from, to: to, date: date, texte: texte, image: image, hauteur: hauteur, largeur: largeur)
        return message
    }
  
    func dernierMessage(monID: String, completion: DernierMessageCompletion?) {
        let ref = Reference().messageAmiSpecifique(id: monID)
        ref.observe(.childAdded) { (snapshot) in
            if let dict = snapshot.value as? Dictionary<String,AnyObject> {
                let date = dict[DATE] as? Double
                let texte = dict[MSG] as? String
                self.obtenirUtilisateurSpe(id: snapshot.key, completion: { (user) -> (Void) in
                    if let utilisateur = user {
                        completion?(DerniersMessages(date: date!, msg: texte!, utilisateur: utilisateur))
                    } else {
                        completion?(nil)
                    }
                })
            }
        }
        
    }
    
}
