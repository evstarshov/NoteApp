//
//  NoteCellFactory.swift
//  NoteApp
//
//  Created by Евгений Старшов on 03.04.2022.
//

import Foundation

final class NoteCellFactory {
    static func cellModel(from model: Note) -> NoteCellModel {
        return NoteCellModel(name:
                             model.name,
                             description: model.description,
                             date: model.date,
                             correctionDate: model.date,
                             image: model.image)
    }
}
