//
//  ExtDouble.swift
//  apptchat
//
//  Created by Faycal Zehana on 21/09/2018.
//  Copyright © 2018 Faycal Zehana. All rights reserved.
//

import UIKit


extension Double {
    
    func dateEnString() -> String {
        var string = "Le "
        var date: Date = Date(timeIntervalSince1970: self)
        let calendrier = Calendar.current
        let formatter = DateFormatter()
        
        if calendrier.isDateInToday(date) {
            string = ""
            formatter.dateStyle = .short
        } else if calendrier.isDateInTomorrow(date) {
            string = "Hier "
            formatter.dateStyle = .short
        } else {
            formatter.dateStyle = .short
        }
        let dateString = string + formatter.string(from: date)
        return dateString
    }
    
}
