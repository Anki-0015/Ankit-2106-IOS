//
//  AddEditTableViewController.swift
//  TableViews
//

import UIKit

class AddEditTableViewController: UITableViewController {

    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var symbolTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var usageTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    var emoji: Emoji?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
        
        if let emoji = emoji {
            updateUI(emoji: emoji)
        }
        updateTheButtonState()
        
    }
    
    init?(coder: NSCoder, emoji: Emoji?) {
        self.emoji = emoji
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func updateUI(emoji: Emoji) {
        symbolTextField.text = emoji.symbol
        nameTextField.text = emoji.name
        usageTextField.text = emoji.usage
        descriptionTextField.text = emoji.description
    }
   
    @IBAction func textFieldUpdated(_ sender: Any) {
        updateTheButtonState()
    }
    
    func updateTheButtonState() {
        guard symbolTextField.text != "" && nameTextField.text != "" && descriptionTextField.text != "" && usageTextField.text != "" else {
            saveButton.isEnabled = false
            return
        }
        saveButton.isEnabled = true
    }
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        let emoji = Emoji(symbol: symbolTextField.text ?? "", name: nameTextField.text ?? "", description: descriptionTextField.text ?? "", usage: usageTextField.text ?? "")
        self.emoji = emoji
        performSegue(withIdentifier: "saveSegue", sender: nil)
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
