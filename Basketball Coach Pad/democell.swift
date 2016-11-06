//
//  democell.swift
//  Coach Pad
//
//  Created by Arkadijs Makarenko on 06/10/2016.
//  Copyright © 2016 ArchieApps. All rights reserved.
//

import UIKit

class democell: UITableViewCell {
    //Property:String with complex object(which are going to be models) that can be used with training Note?(like replacment), like title and content, passing by segue and into detail training view
    
    
    var tnote:Note?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
