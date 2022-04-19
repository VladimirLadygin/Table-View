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
        return documentDirectory.appendingPathComponent("emojis").appendingPathComponent("plist")
    }
    
    func loadEmojis() -> [Emoji]? {
       print(#line, #function, archiveURL ?? "nil")
        
//        let decoder = PropertyListDecoder()
//        if let decodedEmojis = try? decoder.decode([Emoji].self, from: encodedEmojis) {
//            print(#line, #function)
//            for (index, emoji) in decodedEmojis.enumerated() {
//                print(index, ":", emoji)
//            }
//            print()
//        }
        
        return nil
    }
    
    func saveEmojis(_ emojis: [Emoji]) {
        let encoder = PropertyListEncoder()
        guard let encodedEmojis = try? encoder.encode(emojis) else { return }
        guard let archiveURL = archiveURL else { return }
        
        try? encodedEmojis.write(to: archiveURL, options: .noFileProtection)

    }
}
