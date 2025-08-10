import UIKit

class ActivityVC: UIViewController {

    @IBOutlet weak var fourthLabel: UILabel!
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    
    var mood: Mood?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        navigationItem.title = "Select your activity level"
    }
    
    func updateUI() {
        firstLabel.text = meals[0].activity.name
        setupButton(button: firstButton, textString: meals[0].activity.emoji)
        secondLabel.text = meals[1].activity.name
        setupButton(button: secondButton, textString: meals[1].activity.emoji)
        thirdLabel.text = meals[2].activity.name
        setupButton(button: thirdButton, textString: meals[2].activity.emoji)
        fourthLabel.text = meals[3].activity.name
        setupButton(button: fourthButton, textString: meals[3].activity.emoji)
    }
    
    func setupButton(button: UIButton, textString: String) {  button.setAttributedTitle(NSAttributedString(string: textString, attributes: [.font: UIFont.systemFont(ofSize: 100)]) , for: .normal)
    }
    @IBAction func secondThirdAndFourthButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "activityFirstButtonSegue", sender: sender)   // This time segue is connected with first button to ActivityVC, that is why it is required to be triggered for rest of the buttons
    }
    
    
    @IBSegueAction func ActivitySegue(_ coder: NSCoder, sender: Any?) -> ResultVC? {  // Data (Mood) is passed to ActivityVC using @IBSegueAction, observe the failable custom initialiser in ResultVC
        guard let button = sender as? UIButton, let mood = mood else { // we are unwrapping mood as well bcs ResultVC's init() is accepting it as non optional
            return nil
        }
        var index: Int = 0
        switch button {
        case firstButton:
            index = 0
        case secondButton:
            index = 1
        case thirdButton:
            index = 2
        case fourthButton:
            index = 3
        default:
            break
        }

        return ResultVC(coder: coder, mood: mood, activity: meals[index].activity)
    }
    
}

