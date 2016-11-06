//
//  Notes.swift
//  Coach Pad
//
//  Created by Arkadijs Makarenko on 09/10/2016.
//  Copyright © 2016 ArchieApps. All rights reserved.
//

import UIKit
//encoding and decoding data
class Note: NSObject, NSCoding {
    
    var title: String?
    var content: String?
    
    //object-assign a title,content
    //require some value for init, cant be nil
    init(title:String, content:String) {
        self.title = title
        self.content = content
    }
    
    //initializer that require no arguments, manager notes complain
    override init() {
        super.init()
    }
    
    init?(dictionary: [String: String]) {
        guard let title = dictionary["title"], let content = dictionary["content"] else { return nil }
        self.title = title
        self.content = content
    }
    
    var toDictionary: [String: String] {
        guard let title = self.title, let content = self.content else { return [:] }
        return ["title": title, "content": content]
    }
    
    //note array and put that into USerDefaults
    //encode data, save it, when pull it out-decode it
    required init(coder aDecoder: NSCoder) {
        if let titleDecoded = aDecoder.decodeObject(forKey: "title") as? String{
            title = titleDecoded
        }
        if let contentDecoded = aDecoder.decodeObject(forKey: "content") as? String{
            content = contentDecoded
        }
    }
    
    func encode(with aCoder: NSCoder) {
        if let titleEncoded = title {
            aCoder.encode(titleEncoded, forKey: "title")
        }
        if let contentEncoded = content {
            aCoder.encode(contentEncoded, forKey: "content")
        }
    }
}


