//
//  DataManager.swift
//  Emoji Dictionary
//
//  Created by Владимир Ладыгин on 19.04.2022.
//

import Foundation

class DataManager {
    var archiveURL: URL? {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first  else {
            return nil
        }
        return documentDirectory.appendingPathComponent("emojis").appendingPathExtension("json")
    }
    
    func loadEmojis() -> [Emoji]? {
        guard let archiveURL = archiveURL else { return nil }
        
        guard let encodedEmojis = try? Data(contentsOf: archiveURL) else { return nil }
        
        let decoder = PropertyListDecoder()
        return try? decoder.decode([Emoji].self, from: encodedEmojis)
    }
    
    func saveEmojis(_ emojis: [Emoji]) {
        guard let archiveURL = archiveURL else { return }
        print(archiveURL)
        
        let encoder = JSONEncoder()
        guard let encodedEmojis = try? encoder.encode(emojis) else { return }
        
        try? encodedEmojis.write(to: archiveURL, options: .noFileProtection)

    }
}
