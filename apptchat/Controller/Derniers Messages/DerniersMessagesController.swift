//
//  DerniersMessagesController.swift
//  apptchat
//
//  Created by Faycal Zehana on 17/09/2018.
//  Copyright © 2018 Faycal Zehana. All rights reserved.
//

import UIKit

class DerniersMessagesController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var monID :String!
    var partenaireID: Utilisateurs!
    var utilisateur = [Utilisateurs]()
    var derniers = [DerniersMessages]()
    
    
    @IBOutlet weak var tableau: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableau.delegate = self
        tableau.dataSource = self
        
        tableau.tableFooterView = UIView()
        let nib = UINib(nibName: "MessageCell", bundle: nil)
        tableau.register(nib, forCellReuseIdentifier: "MessageCell")
        tableau.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0)
        navigationItem.title = "Messages"
        observer()
    }
    func observer(){
        Donnees().dernierMessage(monID: monID) { (dernier) -> (Void) in
            if let dernierMSG = dernier, !self.derniers.contains(where: {$0.utilisateur.id == dernierMSG.utilisateur.id}) {
                self.derniers.append(dernierMSG)
                self.organiser()
            }
        }
    }
    func organiser(){
        derniers = derniers.sorted(by: {$0.date > $1.date})
        tableau.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return derniers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableau.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageCell
        cell.configuration(dernier: derniers[indexPath.row], controller: self)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tchat = ChatController()
        tchat.setUp(id: monID, partenaire: derniers[indexPath.row].utilisateur)
        self.navigationController?.pushViewController(tchat, animated: true)
    }
    



}
