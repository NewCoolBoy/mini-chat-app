//
//  ChatController.swift
//  apptchat
//
//  Created by Faycal Zehana on 20/09/2018.
//  Copyright © 2018 Faycal Zehana. All rights reserved.
//

import UIKit

class ChatController: UIViewController, UITableViewDelegate, UITableViewDataSource {

   
    
    

    @IBOutlet weak var tableau: UITableView!
    @IBOutlet weak var zoneDeSaisie: UIView!
    @IBOutlet weak var appareilButotn: UIButton!
    @IBOutlet weak var galerieButton: UIButton!
    @IBOutlet weak var zoneDeTexte: UITextView!
    
    
    var monID: String!
    var utilisateur: Utilisateurs!
    var messages = [Message]()
    var topLabel = UILabel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        miseEnPlaceClavier()
        tableau.delegate = self
        tableau.dataSource = self
        tableau.allowsSelection = false
        tableau.keyboardDismissMode = .interactive
        tableau.backgroundColor = UIColor(white: 0.95, alpha: 1)
        let nib = UINib(nibName: "ChatCell", bundle: nil)
        tableau.register(nib, forCellReuseIdentifier: "ChatCell")
        topLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width , height: 30)
        topLabel.textAlignment = .left
        topLabel.font = UIFont.boldSystemFont(ofSize: 25)
        topLabel.numberOfLines = 0
        self.navigationItem.title = "Messages"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        observerMessages()
        let retourButton = UIBarButtonItem()
        retourButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = retourButton
        self.navigationController?.navigationBar.isHidden = false
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    func setUp(id: String, partenaire: Utilisateurs){
        self.monID = id
        self.utilisateur = partenaire
        
    }
    func observerMessages(){
        Donnees().obtenirLeMessage(from: monID, to: self.utilisateur.id) { (message) -> (Void) in
       
            if let msg = message {
                self.messages.append(msg)
                self.trierMessages()
            }
            
        }
        Donnees().obtenirLeMessage(from: self.utilisateur.id, to: monID) { (message) -> (Void) in

            if let msg = message {
                self.messages.append(msg)
                self.trierMessages()
            }
        }
    }
    func trierMessages(){
        messages = messages.sorted(by: {$0.date < $1.date})
        DispatchQueue.main.async {
            self.tableau.reloadData()
            let index = IndexPath(item: self.messages.count - 1, section: 0)
            self.tableau.scrollToRow(at: index, at: .bottom, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableau.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
        
        if messages[indexPath.row].from == monID {
            cell.configurer(monID:monID,message: messages[indexPath.row], user: utilisateur, controller: self, moi: true)
        } else {
            cell.configurer(monID:monID,message: messages[indexPath.row],user: utilisateur, controller: self, moi: false)
        }
        return cell
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
    

    @IBAction func okButtonAction(_ sender: Any) {
        if zoneDeTexte.text != "" {
            var dict : Dictionary<String,AnyObject> = [:]
            let date: Double = Date().timeIntervalSince1970
            
            dict[MSG] = zoneDeTexte.text as AnyObject
            dict[DATE] = date as AnyObject
            dict[FROM] = monID as AnyObject
            dict[TO] = utilisateur.id as AnyObject
            
            Donnees().envoyerMessage(from: monID, to: utilisateur.id, dict: dict)
            zoneDeTexte.text = ""
            
            
            
        }
    }
    
    @IBAction func retourAction(_ sender: Any) {
        let tab = MonTab()
        tab.setUp(id: monID)
        self.present(tab, animated: true, completion: nil)
    }

    @IBAction func appareilButtonAction(_ sender: Any) {
    }
    @IBAction func galerieButtonAction(_ sender: Any) {
    }
    
}
