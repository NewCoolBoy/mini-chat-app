//
//  Tab.swift
//  apptchat
//
//  Created by Faycal Zehana on 17/09/2018.
//  Copyright © 2018 Faycal Zehana. All rights reserved.
//

import UIKit

class MonTab: UITabBarController {
    
    var id: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setUp(id:String){
      self.id = id
        
        let derniersmessages = DerniersMessagesController()
        derniersmessages.monID = id
        let navDernier = UINavigationController(rootViewController: derniersmessages)
        navDernier.title = "Messages"
        navDernier.tabBarItem.image = #imageLiteral(resourceName: "messages")
        
        let recherche = RechercheController()
        recherche.monID = id
        let navRecherche = UINavigationController(rootViewController: recherche)
        navRecherche.title = "Rechercher"
        navRecherche.tabBarItem.image = #imageLiteral(resourceName: "recherche")
        
        let profil = ProfileController()
        profil.monID = id
        let navProfil = UINavigationController(rootViewController: profil)
        navProfil.title = "Profile"
        navProfil.tabBarItem.image = #imageLiteral(resourceName: "profil")
        
        viewControllers = [navDernier,navRecherche,navProfil]
        tabBar.clipsToBounds = true
        
        
    }
}
