//
//  NoteTableViewCell.swift
//  NoteApp
//
//  Created by Евгений Старшов on 03.04.2022.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    let dateFormatter = DateFormatter()

    @IBOutlet weak var noteNameLabel: UILabel!
    @IBOutlet weak var noteDateLabel: UILabel!
    @IBOutlet weak var noteDescriptionLabel: UILabel!
    @IBOutlet weak var noteImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: Methods
    
    func configure(with cellModel: NoteCellModel) {
        self.noteNameLabel.text = cellModel.name
        self.noteDateLabel.text = cellModel.date
        self.noteDescriptionLabel.text = cellModel.description
        self.noteImage.image = cellModel.image?.toImage()
    }
}
