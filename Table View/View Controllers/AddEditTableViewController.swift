//
//  AddTableTableViewController.swift
//  Table View
//
//  Created by Владимир Ладыгин on 13.04.2022.
//

import UIKit
// MARK: - Outlets
class AddEditTableViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var symbolTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var usageTextField: UITextField!
        
    @IBOutlet weak var exitButton: UIBarButtonItem!
    @IBOutlet weak var titleLabel: UINavigationItem!
    
    // MARK: - PROPERTIES
    var emoji = Emoji()
    
    // MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        symbolTextField.text = emoji.symbol
        nameTextField.text = emoji.name
        descriptionTextField.text = emoji.description
        usageTextField.text = emoji.usage
        titleNameUpdate()
    }
    
    func saveEmoji() {
        emoji.symbol = symbolTextField.text ?? ""
        emoji.name = nameTextField.text ?? ""
        emoji.description = descriptionTextField.text ?? ""
        emoji.usage = usageTextField.text ?? ""
    }
    
    func checkSaveButton() {
        let symbol = symbolTextField.text ?? ""
        let name = nameTextField.text ?? ""
        let description = descriptionTextField.text ?? ""
        let usage = usageTextField.text ?? ""
        
        
        if
            symbol.count == 1 && symbol.unicodeScalars.first!.properties.isEmoji && name !=  "" && description != "" && usage != ""
        {
            exitButton.isEnabled = true
        } else {
            exitButton.isEnabled = false
        }
    }
    
    func titleNameUpdate() {
        if emoji.symbol != "" && emoji.name != "" && emoji.description != "" && emoji.usage != ""
        {
            titleLabel.title = "Edit"
        }
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        saveEmoji()
    }
    
    @IBAction func textFieldChanged(_ sender: UITextField) {

        checkSaveButton()
    }
    
}
