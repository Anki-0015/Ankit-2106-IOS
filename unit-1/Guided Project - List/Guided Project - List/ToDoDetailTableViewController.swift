
import UIKit

class ToDoDetailTableViewController: UITableViewController {

    var toDo :ToDo?
    var isdatepickerhidden = true
    let datelabelip = IndexPath(row: 0, section: 1)
    let datepickerip = IndexPath(row: 1, section: 1)
    let notesip = IndexPath(row: 0, section: 2)
    
    @IBOutlet weak var titletextfield: UITextField!
    @IBOutlet weak var iscomplete: UIButton!
    @IBOutlet weak var duedatelabel: UILabel!
    @IBOutlet weak var duedatepicker: UIDatePicker!
    @IBOutlet weak var notestextview: UITextView!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentduedate : Date
        if let toDo = toDo{
            navigationItem.title = "To-Do"
            titletextfield.text = toDo.title
            iscomplete.isSelected = toDo.isComplete
            currentduedate = toDo.dueDate
            notestextview.text = toDo.notes
        }
        else{
            currentduedate = Date().addingTimeInterval(24*60*60)
        }
        duedatepicker.date = currentduedate
        updateDueDateLabel(date: currentduedate)
        updateSaveButtonState()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func updateSaveButtonState(){
    let shouldEnableSaveButton = titletextfield.text?.isEmpty == false
    saveButton.isEnabled = shouldEnableSaveButton
    }
    
    @IBAction func editingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    @IBAction func returnPressed(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func iscompletebuttontapped(_ sender: UIButton) {
        iscomplete.isSelected.toggle()
    }
    
    @IBAction func datepickerchanged(_ sender: UIDatePicker) {
        updateDueDateLabel(date: sender.date)
    }
    func updateDueDateLabel(date: Date){
    duedatelabel.text = date.formatted(.dateTime.month(.defaultDigits).day().year(.twoDigits).hour().minute())
    }
    
    override func tableView(_ tableView: UITableView,heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case datepickerip where isdatepickerhidden == true:
            return 0
        case notesip:
            return 200
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView,estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case datepickerip :
            return 216
        case notesip:
            return 200
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath == datelabelip{
            isdatepickerhidden.toggle()
            updateDueDateLabel(date: duedatepicker.date)
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveUnwind" else { return }
        let title = titletextfield.text!
        let isComplete = iscomplete.isSelected
        let dueDate = duedatepicker.date
        let notes = notestextview.text
        if toDo != nil{
            toDo?.title = title
            toDo?.isComplete = isComplete
            toDo?.dueDate = dueDate
            toDo?.notes = notes
        }
        else{
            toDo = ToDo(title: title, isComplete: isComplete, dueDate: dueDate, notes: notes)
        }
    }
    
}
