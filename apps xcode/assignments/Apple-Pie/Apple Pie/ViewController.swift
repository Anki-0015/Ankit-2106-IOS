import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var treeImageView: UIImageView!
    
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    let incorrectMovesAllowed: Int = 7;
    
    var totalWins: Int = 0{
        didSet{
            newRound()
        }
    }
    var totalLosses: Int = 0 {
        didSet{
            newRound()
        }
    }
    
    var listOfWords: [String] = [
        "kingdom",
        "war",
        "spider",
        "clown",
        "stars"
    ];
    
    var currentGame: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        newRound();
    }
    
    
    func newRound(){
        if !listOfWords.isEmpty{
            let newWord = listOfWords.removeFirst();
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLettersButtons(true);
            updateUI();
        } else {
            enableLettersButtons(false);
        }
    }
    
    
    func updateUI() {
        var letters = [String]();
        for letter in currentGame.formattedWord.characters{
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ");
        correctWordLabel.text = wordWithSpacing;
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
        
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false;
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter);
        updateUI();
        updateGameState()
    }
    
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
            
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
            
        } else {
            updateUI()
        }
    }
    
    func enableLettersButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable;
        }
    }
    
}

