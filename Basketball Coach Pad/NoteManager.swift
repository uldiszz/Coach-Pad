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
    //reference to [note] array which will hold all the notes which will be created
    
    static var notes = [Note]()
    
    //method to add notes in the code
    class func AddNotes(title: String, content: String){
        var n = Note(title: title, content: content)
        notes.append(n)
    }
    
    class func DeleteNotes(id: Int){
    notes.remove(at: id)
    }
    
    class func GetNotes(id: Int) -> Note{
        if(notes.count > 0){
            return notes[id]
        }
        return Note()
    }
}
