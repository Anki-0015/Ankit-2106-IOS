import UIKit

protocol EmployeeTypeTableViewControllerDelegate: AnyObject {
    func employeeTypeTableViewController(
        _ controller: EmployeeTypeTableViewController,
        didSelect employeeType: EmployeeType
    )
}

class EmployeeTypeTableViewController: UITableViewController {

    weak var delegate: EmployeeTypeTableViewControllerDelegate?
    var selectedEmployeeType: EmployeeType?
    private let employeeTypes = EmployeeType.allCases

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Employee Type"
    }

    // MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return employeeTypes.count
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTypeCell", for: indexPath)
        let type = employeeTypes[indexPath.row]
        cell.textLabel?.text = type.description
        cell.accessoryType = (type == selectedEmployeeType) ? .checkmark : .none
        return cell
    }

    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        let type = employeeTypes[indexPath.row]
        delegate?.employeeTypeTableViewController(self, didSelect: type)
    }
}

