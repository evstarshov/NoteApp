//
//  NoteTableViewController.swift
//  NoteApp
//
//  Created by Евгений Старшов on 03.04.2022.
//

import UIKit

class NoteTableViewController: UITableViewController {
    
    private let noteDB = NotesDB()
    var notes = [Note]()
    
    @IBOutlet weak var newNoteButton: UIBarButtonItem!
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    
    private struct Constants {
        static let reuseIdentifier = "notesCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notes = noteDB.retrieveNotes()
        tableView.register(UINib(nibName: "NoteTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.reuseIdentifier)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath)
        guard let cell = dequeuedCell as? NoteTableViewCell else {
            return dequeuedCell
        }
        let note = self.notes[indexPath.row]
        let cellModel = NoteCellFactory.cellModel(from: note)
        cell.configure(with: cellModel)
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    @IBAction func newNotebtnTapped() {
        print("Let's make new note")
        let newNoteVC = self.storyboard?.instantiateViewController(withIdentifier: "newNoteController") as! NewNoteViewController
        newNoteVC.modalPresentationStyle = .fullScreen
        self.present(newNoteVC, animated: true)
    }
    
    @IBAction func goToSettings(_ sender: Any) {
        print("transfer to settings")
        let settingsVC = self.storyboard?.instantiateViewController(withIdentifier: "settingsVC") as! SettingsViewController
        settingsVC.modalPresentationStyle = .fullScreen
        self.present(settingsVC, animated: true)
    }
}
