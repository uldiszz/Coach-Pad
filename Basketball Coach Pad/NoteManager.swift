//
//  NotesManager.swift
//  Coach Pad
//
//  Created by Arkadijs Makarenko on 09/10/2016.
//  Copyright © 2016 ArchieApps. All rights reserved.
//

import UIKit
//manage all of the different note instance
class NoteManager: NSObject {
    // create one shared instance for note manager that will be used in the app. This way there will be only one
    // singleton and there will not be need for any class methods.
    static let sharedInstance = NoteManager()
    
    //reference to [note] array which will hold all the notes which will be created
    var notes = [Note]()
    
    override init() {
        super.init()
        load()
    }
    
    //method to add notes in the code
    func addNote(title: String, content: String){
        let n = Note(title: title, content: content)
        notes.append(n)
        save()
    }
    
    func delete(note: Note){
        guard let index = notes.index(of: note) else { return }
        notes.remove(at: index)
        save()
    }
    
    func getNotes(id: Int) -> Note{
        if(notes.count > 0){
            return notes[id]
        }
        return Note()
    }
    
    func updateNote(note: Note, title: String, content: String) {
        note.title = title
        note.content = content
        save()
    }
    
    func save() {
        var allNotesDict = [[String: String]]()
        for note in notes {
            allNotesDict.append(note.toDictionary)
        }
        UserDefaults.standard.set(allNotesDict, forKey: "notesArray")
    }
    
    func load() {
        if let allDict = UserDefaults.standard.array(forKey: "notesArray") {
            for dict in allDict {
                if let dict = dict as? [String : String], let note = Note(dictionary: dict) {
                    notes.append(note)
                }
            }
        }
    }
}
