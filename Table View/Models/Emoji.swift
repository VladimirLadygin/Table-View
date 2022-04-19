//
//  Emoji.swift
//  Table View
//
//  Created by Владимир Ладыгин on 10.04.2022.
//

struct Emoji: Codable {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    init (symbol: String = "", name: String = "", description: String = "", usage: String = "") {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
}

extension Emoji {
    static var all: [Emoji] {
        return [
            Emoji(symbol: "😈", name: "Лукавый чёрт", description: "Синий улыбающийся гневный чертенок", usage: "Отметить, когда что то не нравится"),
            Emoji(symbol: "😍", name: "Влюбленный человек", description: "Человек в любви", usage: "Отметить, когда вы влюблены"),
            Emoji(symbol: "🤬", name: "Разьяренный человек", description: "Разьяренный человек, ругающийся матом", usage: "Отметить, когда вы вышли из себя"),
            Emoji(symbol: "😜", name: "Подмигивающий человек", description: "Человек, лукаво подмигивающий", usage: "Отметить, когда вы хотите над кем то подшутить"),
        
        ]
        
    }
  
   static func loadDefaults() -> [Emoji]? {
        return all
    }
}
