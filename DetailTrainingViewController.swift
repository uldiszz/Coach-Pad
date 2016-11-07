//
//  DetailTrainingViewController.swift
//  Coach Pad
//
//  Created by Arkadijs Makarenko on 05/10/2016.
//  Copyright © 2016 ArchieApps. All rights reserved.
//

import UIKit

class DetailTrainingViewController: UIViewController {

    var preNote:Note?

    @IBOutlet weak var titleContent: UITextView!
    @IBAction func editDone(_ sender: UIBarButtonItem) {
        // unwrap note and new content
        guard let note = preNote, let newContent = titleContent.text else { return }
        // update note
        NoteManager.sharedInstance.updateNote(note: note, content: newContent)

        // get previous view controller
        guard let navigation = navigationController else { return }
        let viewControllers = navigation.viewControllers as [UIViewController]
        let previousVC = viewControllers[(viewControllers.count) - 2]
        // show previous view
        let _ = navigationController?.popToViewController(previousVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleContent.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    }

    //assing title of this view
    override func viewWillAppear(_ animated: Bool) {
        self.title = preNote?.title
        self.titleContent.text = preNote?.content
    }
}
