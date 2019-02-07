//
//  TypeAlias.swift
//  apptchat
//
//  Created by Faycal Zehana on 18/09/2018.
//  Copyright © 2018 Faycal Zehana. All rights reserved.
//

import UIKit


typealias UtilisateurCompletion = (_ utilisateur: Utilisateurs?) -> (Void)
typealias SuccessCompletion = (_ bool: Bool) -> (Void)
typealias ValeurChangeesCompletion = (_ cle: String?,_ valeur: String?) -> (Void)
typealias MessageCompletion = (_ message: Message?) -> (Void)
typealias DernierMessageCompletion = (_ dernier: DerniersMessages?) -> (Void)
