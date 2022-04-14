//
//  CellManager.swift
//  Table View
//
//  Created by Владимир Ладыгин on 13.04.2022.
//

import Foundation
import UIKit

class CellManager {
    func configure(_ cell: EmojiCell, with emoji: Emoji) {
        cell.symbolLabel.text = emoji.symbol
        cell.nameLabel.text = emoji.name
        cell.descriptionLabel.text = emoji.description
    }
}

