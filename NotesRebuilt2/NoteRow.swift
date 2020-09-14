//
//  NoteRow.swift
//  NotesRebuilt2
//
//  Created by Salim Hafid on 9/12/20.
//

import SwiftUI

struct NoteRow: View {
    @EnvironmentObject var notes: Notes
    @State var index: Int
    
    var body: some View {
        NavigationLink(destination: NoteView(index: index).environmentObject(notes))
        {
            VStack(alignment: .leading) {
                Text("\(notes.notesArray[index].noteTitle)")
                .font(.headline)
            Text("Created \(notes.notesArray[index].dateCreated)")
                .font(.subheadline)
        }
    }
    }
}

struct NoteRow_Previews: PreviewProvider {
    static let notes = Notes()
    static let index = 0
    
    static var previews: some View {
        NoteRow(index: index).environmentObject(notes)
    }
}
