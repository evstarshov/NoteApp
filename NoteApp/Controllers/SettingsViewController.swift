//
//  SettingsViewController.swift
//  NoteApp
//
//  Created by Евгений Старшов on 03.04.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let noteDB = NotesDB()
    var notes = [Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notes = noteDB.retrieveNotes()
    }
    
    
    @IBAction func clearNotesButton(_ sender: Any) {
        notes = [Note]()
        noteDB.save(notes: notes)
    }
    
    // MARK: - Navigation
    
    
    @IBAction func goToMain(_ sender: Any) {
        print("returning back")
        let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "mainVC") as! NoteTableViewController
        mainVC.modalPresentationStyle = .fullScreen
        self.present(mainVC, animated: true)
    }
}
