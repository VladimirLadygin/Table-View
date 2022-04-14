//
//  EmojiTableTableViewController.swift
//  Table View
//
//  Created by Владимир Ладыгин on 13.04.2022.
//

import UIKit

class EmojiTableTableViewController: UITableViewController {
    
    // MARK: - Properties
    let cellManager = CellManager()
    var emojis: [Emoji]!
    
    // MARK: = UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        emojis = Emoji.loadAll() ?? Emoji.loadDefaults()
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
}
// MARK: - UITableViewDataSource
extension EmojiTableTableViewController /*: UITableViewDataSource */ {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let emoji = emojis[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojCell")! as! EmojiCell
        cellManager.configure(cell, with: emoji)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedEmoji = emojis.remove(at: sourceIndexPath.row)
        emojis.insert(movedEmoji, at: destinationIndexPath.row)
    }
}
