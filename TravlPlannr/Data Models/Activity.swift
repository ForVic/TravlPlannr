//
//  Activity.swift
//  TravlPlannr
//
//  Created by Victor Sunderland on 6/24/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Activity: Codable{
    @DocumentID var id: String?
    var name: String
    var note: String
    var date: String

    init(name: String, note: String, date: String) {
        self.name = name
        self.note = note
        self.date = date
    }
}
