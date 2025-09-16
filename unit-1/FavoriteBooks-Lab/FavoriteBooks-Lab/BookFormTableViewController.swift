
import UIKit

class BookFormTableViewController: UITableViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    @IBOutlet weak var lengthTextField: UITextField!
    
    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let book = book {
            titleTextField.text = book.title
            authorTextField.text = book.author
            genreTextField.text = book.genre
            lengthTextField.text = book.length
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        book = Book(
            title: titleTextField.text ?? "",
            author: authorTextField.text ?? "",
            genre: genreTextField.text ?? "",
            length: lengthTextField.text ?? ""
        )
        
        performSegue(withIdentifier: "UnwindToBookTable", sender: self)
    }
}
