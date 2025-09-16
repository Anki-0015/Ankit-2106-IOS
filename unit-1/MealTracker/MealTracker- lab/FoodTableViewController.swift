

import UIKit

class FoodTableViewController: UITableViewController {
    var meals: [Meal] = {
        let breakfast = Meal(name: "Breakfast", food: [
            Food(name: "Chholey Bhature", description: "Tasty."),
            Food(name: "Sprouts", description: "A great protein source."),
            Food(name: "Fruit Chaat", description: "Full of fruits.")
        ])

        let lunch = Meal(name: "Lunch", food: [
            Food(name: "Grilled Sandwich", description: "Filled with veggies and very crunchy"),
            Food(name: "Curry Rice", description: "Fills apetite and too delecious."),
            Food(name: "Pasta", description: "Can be made of various variations")
        ])

        let dinner = Meal(name: "Dinner", food: [
            Food(name: "Cottage Cheese with Bread", description: "Rich in protien and taste , served with diff breads "),
            Food(name: "Biryani", description: "Enriched with spices and hot steamed rice"),
        ])

        return [breakfast, lunch, dinner]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals[section].food.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)

        let meal = meals[indexPath.section]
        let foodItem = meal.food[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = foodItem.name
        content.secondaryText = foodItem.description
        cell.contentConfiguration = content

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }
}
    
   
