//
//  EmojiTableViewController.swift
//  TableViews
//

import UIKit

class EmojiTableViewController: UITableViewController {
    override func viewDidLoad() {
            super.viewDidLoad()
            
            if let savedEmojis = Emoji.loadFromFile() {
                emojis = savedEmojis
            } else {
                emojis = Emoji.sampleEmojis()
            }
            
            self.navigationItem.leftBarButtonItem = self.editButtonItem
        }
    
    var emojis: [Emoji] = [] {
        didSet {
            Emoji.saveToFile(emojis: emojis)
        }
    }
    func saveEmojis() {
        Emoji.saveToFile(emojis: emojis)
    }

    @IBSegueAction func addEditEmoji(_ coder: NSCoder, sender: Any?) -> AddEditTableViewController? {
        guard let indexPath = sender as? IndexPath else {
           return AddEditTableViewController(coder: coder, emoji: nil)
        }
        return AddEditTableViewController(coder: coder, emoji: emojis[indexPath.row])
    }


    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return emojis.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EmojiTableViewCell

        cell.updateUI(emoji: emojis[indexPath.row])
        
        cell.showsReorderControl = true
        
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "editSegue", sender: indexPath)
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveEmojis()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        let removedEmoji = emojis.remove(at: fromIndexPath.row)
        emojis.insert(removedEmoji, at: to.row)
        saveEmojis()

    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    
    @IBAction func unwindToEmojiTVC(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveSegue", let addEditTVC = segue.source as? AddEditTableViewController, let emoji = addEditTVC.emoji else { return }
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else {
            emojis.append(emoji)
            let indexPath = IndexPath(row: emojis.count - 1, section: 0)
            tableView.insertRows(at: [indexPath], with: .fade)
            return }
        saveEmojis()

        
        emojis[selectedIndexPath.row] = emoji
        tableView.reloadRows(at: [selectedIndexPath], with: .fade)
        saveEmojis()

        //tableView.reloadData()
        
    }
    

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
