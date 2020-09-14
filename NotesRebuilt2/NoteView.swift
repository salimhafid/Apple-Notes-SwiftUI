//
//  NoteView.swift
//  NotesRebuilt2
//
//  Created by Salim Hafid on 9/12/20.
//

import SwiftUI

struct NoteView: View {
    @EnvironmentObject var notes: Notes
    @State var index: Int
    
    var body: some View {
        let text = Binding<String>(
            get: {
               (notes.notesArray[index].noteContents)
            },
            set: {
                notes.notesArray[index].noteContents = $0
                }
        )
        
        let title = Binding<String>(
            get: {
                (notes.notesArray[index].noteTitle)
            },
            set: {
                notes.notesArray[index].noteTitle = $0
            }
        )
        
        VStack {
            TextField(notes.notesArray[index].noteTitle, text: title)
                .font(.largeTitle)
                .padding()
                .foregroundColor(.black)
                
            TextEditor(text: text)
                .padding()
            .foregroundColor(.black)
            .keyboardType(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/)
            
            Button("Save Doc") {
                saveNotes()
            }
            
    }
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
    
    func saveNotes() {
        if let encoded = try? JSONEncoder().encode(notes.notesArray) {
            UserDefaults.standard.set(encoded, forKey: "SavedData")
        }
    }
}


struct NoteView_Previews: PreviewProvider {
    static let notes = Notes()
    static let index = 0
    
    static var previews: some View {
        NoteView(index: index).environmentObject(notes)
    }
}
