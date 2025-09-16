import UIKit

protocol EmployeeDetailTableViewControllerDelegate: AnyObject {
    func employeeDetailTableViewController(
        _ controller: EmployeeDetailTableViewController,
        didSave employee: Employee
    )
}

class EmployeeDetailTableViewController: UITableViewController, UITextFieldDelegate {

    // MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var employeeTypeLabel: UILabel!
    @IBOutlet weak var saveBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var dobDatePicker: UIDatePicker!

    // MARK: - Properties
    weak var delegate: EmployeeDetailTableViewControllerDelegate?
    var employee: Employee?
    var employeeType: EmployeeType?

    private lazy var dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .medium
        return df
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        updateSaveButtonState()
    }

    // MARK: - View Updates
    private func updateView() {
        if let employee = employee {
            navigationItem.title = employee.name
            nameTextField.text = employee.name
            dobLabel.text = dateFormatter.string(from: employee.dateOfBirth)
            employeeTypeLabel.text = employee.employeeType.description
            dobLabel.textColor = .label
            employeeTypeLabel.textColor = .label
        } else {
            navigationItem.title = "New Employee"
            dobLabel.text = dateFormatter.string(from: Date())
        }
    }

    private func updateSaveButtonState() {
        saveBarButtonItem.isEnabled = !(nameTextField.text?.isEmpty ?? true)
    }

    // MARK: - Actions
    @IBAction func nameTextFieldDidChange(_ sender: UITextField) {
        updateSaveButtonState()
    }

    @IBAction func dobDatePickerChanged(_ sender: UIDatePicker) {
        dobLabel.text = dateFormatter.string(from: sender.date)
    }

    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard
            let name = nameTextField.text,
            !name.isEmpty,
            let type = employeeType
        else { return }

        let dob = dobDatePicker.date
        let newEmployee = Employee(name: name, dateOfBirth: dob, employeeType: type)
        delegate?.employeeDetailTableViewController(self, didSave: newEmployee)
    }

    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectEmployeeType",
           let vc = segue.destination as? EmployeeTypeTableViewController {
            vc.delegate = self
            vc.selectedEmployeeType = employeeType
        }
    }
}

// MARK: - EmployeeTypeTableViewControllerDelegate
extension EmployeeDetailTableViewController: EmployeeTypeTableViewControllerDelegate {
    func employeeTypeTableViewController(
        _ controller: EmployeeTypeTableViewController,
        didSelect employeeType: EmployeeType
    ) {
        self.employeeType = employeeType
        employeeTypeLabel.text = employeeType.description
        employeeTypeLabel.textColor = .label
        navigationController?.popViewController(animated: true)
    }
}

