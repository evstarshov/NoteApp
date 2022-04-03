//
//  NewNoteViewController.swift
//  NoteApp
//
//  Created by Евгений Старшов on 03.04.2022.
//

import UIKit

class NewNoteViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    let noteDB = NotesDB()
    let dateFormatter = DateFormatter()
    let dateNow = Date.now
    
    var noteToadd = [Note]()
    var imagePicker: ImagePicker!
    
    @IBOutlet weak var noteNameTextField: UITextField!
    @IBOutlet weak var noteDescriptionTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var imagePickButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
    }
    
    // MARK: - Methods
    
    @IBAction func saveButtonTapped() {
        print("saving note")
        guard noteNameTextField.text != "" && noteDescriptionTextField.text != "" else {
            showAlertTextEmpty()
            return
        }
        let image = self.imageView.image
        let imageData = image?.toPngString()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        let date = dateFormatter.string(from: Date())
        print(date)
        let note = Note(name: noteNameTextField.text ?? "error", description: noteDescriptionTextField.text ?? "error", date: date, correctionDate: nil, image: imageData)
        noteToadd = noteDB.retrieveNotes()
        noteToadd.append(note)
        noteDB.save(notes: noteToadd)
        goToMain()
    }
    
    @IBAction func takeImage(_ sender: Any) {
        self.imagePicker.present(from: sender as! UIView)
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
        print("back button tapped")
        goToMain()
    }
    
    private func goToMain() {
        print("returning back")
        let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "mainVC") as! NoteTableViewController
        mainVC.modalPresentationStyle = .fullScreen
        self.present(mainVC, animated: true)
    }

}

extension NewNoteViewController: ImagePickerDelegate {

    func didSelect(image: UIImage?) {
        self.imageView.image = image
    }
}


