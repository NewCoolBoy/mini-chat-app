//
//  Dernier.swift
//  apptchat
//
//  Created by Faycal Zehana on 18/09/2018.
//  Copyright © 2018 Faycal Zehana. All rights reserved.
//

import UIKit

class DerniersMessages {
    
    private var _msg: String
    private var _date : Double
    private var _utilisateur : Utilisateurs
    
    var msg: String {
        return _msg
    }
    var date: Double {
        return _date
    }
    var utilisateur : Utilisateurs {
        return _utilisateur
    }
    init(date: Double,msg:String, utilisateur: Utilisateurs) {
        self._date = date
        self._msg = msg
        self._utilisateur = utilisateur
    }
    
}
