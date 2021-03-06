//
//  Note.swift
//  NoteApp
//
//  Created by Евгений Старшов on 03.04.2022.
//

import Foundation

struct Note: Codable {
    let name: String
    let description: String
    let date: String
    let correctionDate: String?
    let image: String?
}
