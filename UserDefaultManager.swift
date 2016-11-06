//
//  UserDefaultManager.swift
//  Coach Pad
//
//  Created by Arkadijs Makarenko on 15/10/2016.
//  Copyright © 2016 ArchieApps. All rights reserved.
//

import UIKit

class UserDefaultManager: NSObject {
    
    static let userDefaults = UserDefaults.standard
    
    class func synchronize(){
        let myData = NSKeyedArchiver.archivedData(withRootObject: NoteManager.notes)
        
        UserDefaults.standard.set(myData, forKey: "trainingarray")
        
        UserDefaults.standard.synchronize()
    }
    
    //take out form defaults and put to noteManager
    class func initializeDefaults(){
        if let notesRaw = UserDefaults.standard.data(forKey: "trainingarray"){
            if let notes = NSKeyedUnarchiver.unarchiveObject(with: notesRaw) as? [Note]{
                NoteManager.notes = notes
            }
        }
    }
}
