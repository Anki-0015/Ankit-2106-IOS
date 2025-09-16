
import UIKit

class ToDoTableViewController: UITableViewController,ToDoCellDelegate {

    var todos: [ToDo] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        if let savedtodos = ToDo.loadToDos() {
            todos = savedtodos
        }
        else{
            todos = ToDo.loadSampleToDos()
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        navigationItem.leftBarButtonItem = editButtonItem
    }

    // MARK: - Table view data source


    func checkmarkTapped(sender: ToDoCell) {
        if let indexPath = tableView.indexPath(for: sender){
            var todo = todos[indexPath.row]
            todo.isComplete.toggle()
            todos[indexPath.row] = todo
            tableView.reloadRows(at: [indexPath], with: .automatic)
            ToDo.saveToDos(todos)
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "todocell",
            for: indexPath
        ) as! ToDoCell
        cell.delegate = self
        let todo = todos[indexPath.row]
        cell.titlelabel?.text = todo.title
        cell.iscompletebutton?.isSelected = todo.isComplete
    
        return cell
    }
                                                                                                           

         
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    @IBSegueAction func editToDo(_ coder: NSCoder, sender: Any?) -> ToDoDetailTableViewController? {
        let detailController = ToDoDetailTableViewController(coder: coder)
        guard let cell = sender as? UITableViewCell,let indexPath = tableView.indexPath(for: cell) else {
            return detailController
        }
        tableView.deselectRow(at: indexPath, animated: true)
        detailController?.toDo = todos[indexPath.row]
        return detailController
    }
    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            ToDo.saveToDos(todos)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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

    @IBAction func unwindToToDoList(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind" else { return }
        let sourceViewController = segue.source as! ToDoDetailTableViewController
        if let toDo = sourceViewController.toDo {
            if let indexOfExistingToDo = todos.firstIndex(of: toDo) {
                todos[indexOfExistingToDo] = toDo
                tableView.reloadRows(at: [IndexPath(row: indexOfExistingToDo, section: 0)], with: .automatic)
            }
            else{
                let newIndexPath = IndexPath (row: todos.count, section: 0)
                todos.append(toDo)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }   
        }
        ToDo.saveToDos(todos)
    }
    
    
    
    
    
}
 
