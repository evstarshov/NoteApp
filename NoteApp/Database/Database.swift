//
//  Database.swift
//  NoteApp
//
//  Created by Евгений Старшов on 03.04.2022.
//

import Foundation

final class NotesDB {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "notes"
    
    func save(notes: [Note]) {
        do {
            let data = try self.encoder.encode(notes)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveNotes() -> [Note] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([Note].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
