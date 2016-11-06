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
        //delete not working     !!!!!!!    !!!!!!   !!!!
        UserDefaultManager.initializeDefaults()
        
    }
    //fadded navigation bar
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
        navigationController?.navigationBar.alpha = 0.5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NoteManager.notes.count
    }
    
    //reuse cell, when they go out from table, table vizible through image
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "democell")! as! democell
        
        if(indexPath.item % 2 == 0){
            cell.backgroundColor = UIColor.clear
        }else{
            cell.backgroundColor = UIColor.white.withAlphaComponent(0.2)
            cell.textLabel?.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        }
        cell.textLabel?.textColor = UIColor.white
        
        //assigning text from table view cell to property
        let note = NoteManager.notes[indexPath.item]
        cell.textLabel?.text = note.title
        cell.tnote = note
        return cell
        //assingning the text from the table view cell to property in the democell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete){
            NoteManager.DeleteNotes(id: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
    }
    
    //taking data from table view and moving to detail view by segue transition
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "detailtrainingview"){
            // cast the sender
            let cell = sender as! democell
            //need to try for save   !!!!!  !!!!!! !!!!!
            let detailtrainingview =  segue.destination as! DetailTrainingViewController
            //assing cell data Note to property on detail training view and use as title
            detailtrainingview.preNote = cell.tnote
        }
    }
}

