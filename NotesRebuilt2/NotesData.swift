//
//  NotesData.swift
//  NotesRebuilt2
//
//  Created by Salim Hafid on 9/5/20.
//

import Foundation
import SwiftUI

class Notes: ObservableObject {
    @Published var notesArray = [NoteData]()
}

struct NoteData: Codable, Identifiable, Hashable {
    var noteContents: String = ""
    var noteTitle: String = ""
    var id = UUID()
    var dateCreated: Date = Date()
}
