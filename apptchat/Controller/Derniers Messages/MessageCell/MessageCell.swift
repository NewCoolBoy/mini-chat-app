//
//  MessageCell.swift
//  apptchat
//
//  Created by Faycal Zehana on 18/09/2018.
//  Copyright © 2018 Faycal Zehana. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var photo: PhotoProfilArrondie!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var prenom: UILabel!
    @IBOutlet weak var msg: UILabel!
    
    var dernier : DerniersMessages!
    var controller : DerniersMessagesController?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configuration(dernier: DerniersMessages, controller: DerniersMessagesController){
        self.dernier = dernier
        self.controller = controller
        
        prenom.text = self.dernier.utilisateur.prenom + " " + self.dernier.utilisateur.nom
        msg.text = self.dernier.msg
        date.text = String(self.dernier.date.dateEnString())
        photo.telecharger(self.dernier.utilisateur.imageUrl)
//
        
    }
    
}
