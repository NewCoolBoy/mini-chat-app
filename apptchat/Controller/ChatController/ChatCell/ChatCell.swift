//
//  ChatCell.swift
//  apptchat
//
//  Created by Faycal Zehana on 20/09/2018.
//  Copyright © 2018 Faycal Zehana. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {

    
    @IBOutlet weak var bulleMSG: ViewArrondie!
    @IBOutlet weak var dateEnvoi: UILabel!
    @IBOutlet weak var imageEnvoyee: ImageArrondie!
    @IBOutlet weak var photoProfil: PhotoProfilArrondie!
    @IBOutlet weak var msgTexte: UILabel!
    
    @IBOutlet var droiteBulleContrainte: NSLayoutConstraint!
    
    var monID: String!
    var message: Message!
    var controller: ChatController?
    var moi: Bool!
    var utilisateur: Utilisateurs!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0)
//        bulleMSG.translatesAutoresizingMaskIntoConstraints = false
//        msgTexte.translatesAutoresizingMaskIntoConstraints = false
//        photoProfil.isHidden = true
//        
//        let contraints = [msgTexte.topAnchor.constraint(equalTo: topAnchor, constant: 10),
//                          msgTexte.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
//                          msgTexte.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
//                          msgTexte.widthAnchor.constraint(equalToConstant: 150),
//                          bulleMSG.topAnchor.constraint(equalTo: msgTexte.topAnchor, constant: -16),
//                          bulleMSG.bottomAnchor.constraint(equalTo: msgTexte.bottomAnchor, constant: 16),
//                          bulleMSG.leadingAnchor.constraint(equalTo: msgTexte.leadingAnchor, constant: -16),
//                          bulleMSG.trailingAnchor.constraint(equalTo: msgTexte.trailingAnchor, constant: 16)
//            
//                          ]
//        NSLayoutConstraint.activate(contraints)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configurer(monID: String,message: Message,user: Utilisateurs,controller: ChatController, moi: Bool ){
        self.message = message
        self.monID = monID
        self.controller = controller
        self.moi = moi
        self.utilisateur = user
        imageEnvoyee.isHidden = true
        if self.message.texte != "" {
            self.msgTexte.text = self.message.texte!
        }
        msgTexte.text = self.message.texte
        dateEnvoi.text = String(self.message.date.dateEnString())
        
        if self.moi {
            self.bulleMSG.backgroundColor = BLUE
            self.droiteBulleContrainte.constant = 10
            self.photoProfil.isHidden = true
        } else {
            self.bulleMSG.backgroundColor = WHITE
            self.droiteBulleContrainte.constant = 100
            self.photoProfil.isHidden = false
            photoProfil.telecharger(self.utilisateur.imageUrl)
        }
            
    }
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0)
//        bulleMSG.translatesAutoresizingMaskIntoConstraints = false
//        msgTexte.translatesAutoresizingMaskIntoConstraints = false
//
//        let contraints = [msgTexte.topAnchor.constraint(equalTo: topAnchor, constant: 32),
//                          msgTexte.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
//                          msgTexte.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
//                          msgTexte.widthAnchor.constraint(equalToConstant: 250)]
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
}
