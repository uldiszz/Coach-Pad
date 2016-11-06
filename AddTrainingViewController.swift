//
//  AddTrainingViewController.swift
//  Coach Pad
//
//  Created by Arkadijs Makarenko on 05/10/2016.
//  Copyright © 2016 ArchieApps. All rights reserved.
//

import UIKit

class AddTrainingViewController: UIViewController {

    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var titleContent: UITextView!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        titleText.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        titleContent.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        
        addButton.isEnabled = false
        NotificationCenter.default.addObserver(self, selector: #selector(AddTrainingViewController.textTitleDidChange), name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(AddTrainingViewController.textContentDidChange), name: NSNotification.Name.UITextViewTextDidChange, object: nil)
        }
  
    //hide the keyboard
    @IBAction func contentDoneButton(_ sender: AnyObject) {
        titleContent.resignFirstResponder()
    }
    @IBAction func titleDoneButton(_ sender: AnyObject) {
    titleText.resignFirstResponder()
    }
    
    func textTitleDidChange() {
        handleButtonState()
    }
    
    func textContentDidChange() {
        handleButtonState()
    }
    
    func handleButtonState(){
        //handle done button
        if(titleContent.text != ""){
            doneButton.isEnabled = true
        }else{
            doneButton.isEnabled = false
        }
        
        //handle add button
        if(titleText.text != "" && titleContent.text != ""){
           addButton.isEnabled = true
           addButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        }else{
            addButton.isEnabled = false
            addButton.setTitleColor(UIColor.lightGray, for: UIControlState.normal)
        }
    }
    
    @IBAction func addButton(_ sender: AnyObject) {
        NoteManager.sharedInstance.addNote(title: titleText.text!, content: titleContent.text)
        //clear after add
        titleText.text = ""
        titleContent.text = ""
        
        // the alert view
        let alert = UIAlertController(title: "Saved to Training Plan", message: "Add More or Go to The Training Plan", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        
        // change to desired number of seconds (in this case 3 seconds)
        let when = DispatchTime.now() + 3
        DispatchQueue.main.asyncAfter(deadline: when){
            // your code with delay
            alert.dismiss(animated: true, completion: nil)
        }
        //http://stackoverflow.com/questions/27613926/dismiss-uialertview-after-5-seconds-swift

        let defaults = UserDefaults.standard
        defaults.set("mystring", forKey: "myobject")
        
    }
}
