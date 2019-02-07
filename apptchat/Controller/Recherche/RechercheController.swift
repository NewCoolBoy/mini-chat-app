//
//  RechercheController.swift
//  apptchat
//
//  Created by Faycal Zehana on 17/09/2018.
//  Copyright © 2018 Faycal Zehana. All rights reserved.
//

import UIKit

class RechercheController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    

    @IBOutlet weak var tableau: UITableView!
    @IBOutlet weak var rechercheBar: UISearchBar!
    
    var monID : String!
    var utilisateur = [Utilisateurs]()
    var utilisateurFiltrer = [Utilisateurs]()
    var enRecherche = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableau.delegate = self
        tableau.dataSource = self
        rechercheBar.delegate = self
        let nib = UINib(nibName: "RechercheCell", bundle: nil)
        tableau.register(nib, forCellReuseIdentifier: "RechercheCell")
        tableau.tableFooterView = UIView()
        tableau.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0)
        navigationItem.title = "Contacts"
        
        observer()

    }
    func observer(){
        Donnees().obtenirTousLesUtilisateurs(id: monID) { (utilisateur) -> (Void) in
            if let user = utilisateur {
                self.utilisateur.append(user)
                self.tableau.reloadData()
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !enRecherche {
            return utilisateur.count
        } else {
            return utilisateurFiltrer.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableau.dequeueReusableCell(withIdentifier: "RechercheCell", for: indexPath) as! RechercheCell
        if !enRecherche {
            cell.setUp(utilisateur: utilisateur[indexPath.row], controller: self)
        } else {
            cell.setUp(utilisateur: utilisateurFiltrer[indexPath.row], controller: self)
        }
        
        cell.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tchat = ChatController()
        tchat.setUp(id: monID, partenaire: utilisateur[indexPath.row])
        self.navigationController?.pushViewController(tchat, animated: true)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            enRecherche = false
            view.endEditing(true)
        } else {
            enRecherche = true
            let miniscule = searchBar.text!.lowercased()
            utilisateurFiltrer = utilisateur.filter {
                return $0.nom.lowercased().range(of: miniscule) != nil || $0.prenom.lowercased().range(of: miniscule) != nil
            }
        }
        tableau.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }



 

}
