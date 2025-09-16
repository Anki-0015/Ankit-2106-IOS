
import UIKit

class BookTableViewController: UITableViewController {
    
    var books: [Book] = [
        Book(title: "1984", author: "George Orwell", genre: "Dystopia", length: "328"),
        Book(title: "Dune", author: "Frank Herbert", genre: "Sci-Fi", length: "688")
    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        books.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell",
                                                 for: indexPath) as! BookTableViewCell
        cell.update(with: books[indexPath.row])
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    // Swipe to delete
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            books.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    // Prepare for segue → edit or add
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let formVC = segue.destination as? BookFormTableViewController else { return }
        if segue.identifier == "EditBook",
           let indexPath = tableView.indexPathForSelectedRow {
            formVC.book = books[indexPath.row]
        } else {
            formVC.book = nil // Add flow
        }
    }
    
    // Unwind segue
    @IBAction func unwindToBookTable(_ segue: UIStoryboardSegue) {
        guard let source = segue.source as? BookFormTableViewController,
              let newOrEdited = source.book else { return }
        
        if let selected = tableView.indexPathForSelectedRow {
            // Editing existing book
            books[selected.row] = newOrEdited
            tableView.reloadRows(at: [selected], with: .automatic)
        } else {
            // Adding new book
            books.append(newOrEdited)
            let newIndex = IndexPath(row: books.count - 1, section: 0)
            tableView.insertRows(at: [newIndex], with: .automatic)
        }
    }
}
