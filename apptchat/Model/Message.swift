//
//  Message.swift
//  apptchat
//
//  Created by Faycal Zehana on 19/09/2018.
//  Copyright © 2018 Faycal Zehana. All rights reserved.
//

import UIKit


class Message {
    private var _id: String
    private var _from: String
    private var _to: String
    private var _date: Double
    private var _texte: String?
    private var _image: String?
    private var _hauteur: Double?
    private var _largeur: Double?
    
    var id: String {
        return _id
    }
    var from: String {
        return _from
    }
    var to: String {
        return _to
    }
    var date: Double {
        return _date
    }
    var texte: String? {
        return _texte
    }
    var image: String? {
        return _image
    }
    var hauteur: Double? {
        return _hauteur
    }
    var largeur: Double? {
        return _largeur
    }
    init(id:String,from: String,to: String,date: Double,texte: String?,image:String?,hauteur:Double?,largeur:Double?) {
        self._id = id
        self._from = from
        self._to = to
        self._date = date
        self._texte = texte
        self._image = image
        self._hauteur = hauteur
        self._largeur = largeur
    }
}
