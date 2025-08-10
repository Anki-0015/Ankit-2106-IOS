
import UIKit

class ResultVC: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var mood: Mood?
    var activity: Activity?
    
    init?(coder: NSCoder, mood: Mood, activity: Activity) {
        self.mood = mood
        self.activity = activity
        super.init(coder: coder)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Suggested Meal"
        
        if let mood, let activity {
            updateUI(mood: mood, activity: activity)
        }
    }
    
    func updateUI(mood: Mood, activity: Activity) {
        for meal in meals {
            if meal.mood.name == mood.name && meal.activity.name == activity.name {
                resultLabel.text = meal.suggestedMeal
            }
        }
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
