
import UIKit

class MoodVC: UIViewController {

    @IBOutlet weak var fourthLabel: UILabel!
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Select your current mood"
        updateUI()
    }
    
    func updateUI() {
        firstLabel.text = meals[0].mood.name
        setupButton(button: firstButton, textString: meals[0].mood.emoji)
        secondLabel.text = meals[4].mood.name
        setupButton(button: secondButton, textString: meals[4].mood.emoji)
        thirdLabel.text = meals[8].mood.name
        setupButton(button: thirdButton, textString: meals[8].mood.emoji)
        fourthLabel.text = meals[12].mood.name
        setupButton(button: fourthButton, textString: meals[12].mood.emoji)
    }
    
    func setupButton(button: UIButton, textString: String) {  // This way of settingup buttons was not required to be implement in ST (you can set it on storyboard), but you should know how to programmatically set it
        button.setAttributedTitle(NSAttributedString(string: textString, attributes: [.font: UIFont.systemFont(ofSize: 100)]) , for: .normal)
    }
    
    @IBAction func moodButtonsTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "moodSegue", sender: sender)  // As segue is connect from the MoodVC to ActivityVC, that is why it is required to be triggered
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {  // Data (Mood) is passed to ActivityVC using prepare Method
        guard let activityVC = segue.destination as? ActivityVC else {
            return
        }
        guard let button = sender as? UIButton else {
            return
        }
        var index: Int = 0
        switch button {
        case firstButton:
            index = 0
        case secondButton:
            index = 4
        case thirdButton:
            index = 8
        case fourthButton:
            index = 12
        default:
            break
        }
        activityVC.mood = meals[index].mood
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
