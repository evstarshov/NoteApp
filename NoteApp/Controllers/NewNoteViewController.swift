//
//  NewNoteViewController.swift
//  NoteApp
//
//  Created by Евгений Старшов on 03.04.2022.
//

import UIKit

class NewNoteViewController: UIViewController {
    
    let noteDB = NotesDB()
    var noteToadd = [Note]()
    
    let dateFormatter = DateFormatter()
    
    @IBOutlet weak var noteNameTextField: UITextField!
    @IBOutlet weak var noteDescriptionTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Methods
    
    @IBAction func saveButtonTapped() {
        print("saving note")
        guard noteNameTextField.text != "" || noteDescriptionTextField.text != "" else {
            showAlertTextEmpty()
            return
        }
        let note = Note(name: noteNameTextField.text ?? "error", description: noteDescriptionTextField.text ?? "error", date: dateFormatter.string(from: Date.now), correctionDate: nil, image: nil)
        noteToadd = noteDB.retrieveNotes()
        noteToadd.append(note)
        noteDB.save(notes: noteToadd)
        goToMain()
    }
    
    
    private func showAlertTextEmpty() {
            let alertController = UIAlertController(
                title: "Ошибка",
                message: "Вы заполнили не все поля",
                preferredStyle: .alert)
            let alertItem = UIAlertAction(
                title: "Ok:(",
                style: .cancel)
            alertController.addAction(alertItem)
            present(alertController,
                    animated: true,
                    completion: nil)
        }


    // MARK: - Navigation

    @IBAction func backButtontapped() {
        goToMain()
    }
    
    private func goToMain() {
        print("returning back")
        let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "mainVC") as! NoteTableViewController
        mainVC.modalPresentationStyle = .fullScreen
        self.present(mainVC, animated: true)
    }

}
