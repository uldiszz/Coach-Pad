//
//  SecondViewController.swift
//  Basketball Coach Pad
//
//  Created by Arkadijs Makarenko on 03/10/2016.
//  Copyright © 2016 ArchieApps. All rights reserved.
//

import UIKit

class SecondViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Set up cell size and image in table
        tableView.rowHeight = 50
        tableView.backgroundView = UIImageView(image: UIImage(named: "main3"))
    }

    //fadded navigation bar
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
        navigationController?.navigationBar.alpha = 0.5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NoteManager.sharedInstance.notes.count
    }

    //reuse cell, when they go out from table, table vizible through image
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "democell") else { return UITableViewCell() }
        
        if(indexPath.item % 2 == 0){
            cell.backgroundColor = UIColor.clear
        }else{
            cell.backgroundColor = UIColor.white.withAlphaComponent(0.2)
            cell.textLabel?.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        }
        cell.textLabel?.textColor = UIColor.white
        
        //assigning text from table view cell to property
        let note = NoteManager.sharedInstance.notes[indexPath.item]
        cell.textLabel?.text = note.title
        
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete){
            let note = NoteManager.sharedInstance.notes[indexPath.row]
            NoteManager.sharedInstance.delete(note: note)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
    }
    
    //taking data from table view and moving to detail view by segue transition
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "detailtrainingview"){
            // get indexPath for selected cell
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            // get the note
            let note = NoteManager.sharedInstance.notes[indexPath.row]
            // get next view controller
            let detailtrainingview = segue.destination as? DetailTrainingViewController
            // assing note to property on detail training view
            detailtrainingview?.preNote = note
        }
    }
}


