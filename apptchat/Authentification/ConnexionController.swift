//
//  ConnexionController.swift
//  apptchat
//
//  Created by Faycal Zehana on 17/09/2018.
//  Copyright © 2018 Faycal Zehana. All rights reserved.
//

import UIKit
import FirebaseAuth

class ConnexionController: UIViewController {

    @IBOutlet weak var scoll: UIScrollView!
    @IBOutlet weak var buttonCo: UIButton!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var mdp: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.miseEnPlaceClavier()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (Auth.auth().currentUser?.uid) != nil {
            envoyerVersAPP()
        }
    }
    
    func envoyerVersAPP(){
        
        let tab = MonTab()
        if let id = Auth.auth().currentUser?.uid {
        
            tab.setUp(id: id)
        }
        
        self.present(tab, animated: true, completion: nil)
        
    }
    
    
    func finalisation (email:String, mdp: String){
        PopUp.montrer.creerUnProfile(email: email, mdp: mdp, controller: self, entree: [PRENOM,NOM,ACCEUIL], completion: { (bool) -> (Void) in
            if bool {
            self.envoyerVersAPP()
            } else {
                self.finalisation(email: email, mdp: mdp)
            }
        })
    }
    
    @IBAction func actionButton(_ sender: Any) {
        if let email = email.text, email != "" {
            if let mdp = mdp.text, mdp != "" {
                Auth.auth().signIn(withEmail: email, password: mdp) { (authData, error) in
                    if error != nil {
                       let nsError = error! as NSError
                        if nsError.code != 17011 {
                            PopUp.montrer.afficherErreur(titre: "Erreur", message: (error?.erreurEnString())!, controller: self)
                        } else {
                            
                            self.finalisation(email: email, mdp: mdp)
                        }
                    } else {
                            self.envoyerVersAPP()
                    }
                    
                }
                
                
            }
        }
    }
    
    
    
}
