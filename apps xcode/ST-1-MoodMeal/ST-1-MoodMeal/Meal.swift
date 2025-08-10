
struct Mood {
    var emoji: String
    var name: String
}

struct Activity {
    var emoji: String
    var name: String
}
struct Meal {
    var mood: Mood
    var activity: Activity
    var suggestedMeal: String
}

var meals: [Meal] = [

    Meal(mood: Mood(emoji: "😊", name:"Happy"), activity: Activity(emoji: "🪑", name: "Sedentary"), suggestedMeal: "Meal 1A"),
    Meal(mood: Mood(emoji: "😊", name:"Happy"), activity: Activity(emoji: "🚶‍♂️", name: "Light"), suggestedMeal: "Meal 1B"),
    Meal(mood: Mood(emoji: "😊", name:"Happy"), activity: Activity(emoji: "🏃", name: "Moderate"), suggestedMeal: "Meal 1C"),
    Meal(mood: Mood(emoji: "😊", name:"Happy"), activity: Activity(emoji: "🏋️‍♀️", name: "Intense"), suggestedMeal: "Meal 1D"),
    

    Meal(mood: Mood(emoji: "😢", name: "Sad"), activity: Activity(emoji: "🪑", name: "Sedentary"), suggestedMeal: "Meal 2A"),
    Meal(mood: Mood(emoji: "😢", name: "Sad"), activity: Activity(emoji: "🚶‍♂️", name: "Light"), suggestedMeal: "Meal 2B"),
    Meal(mood: Mood(emoji: "😢", name: "Sad"), activity: Activity(emoji: "🏃", name: "Moderate"), suggestedMeal: "Meal 2C"),
    Meal(mood: Mood(emoji: "😢", name: "Sad"), activity: Activity(emoji: "🏋️‍♀️", name: "Intense"), suggestedMeal: "Meal 2D"),

    Meal(mood: Mood(emoji: "😩", name: "Stressed"), activity: Activity(emoji: "🪑", name: "Sedentary"), suggestedMeal: "Meal 3A"),
    Meal(mood: Mood(emoji: "😩", name: "Stressed"), activity: Activity(emoji: "🚶‍♂️", name: "Light"), suggestedMeal: "Meal 3B"),
    Meal(mood: Mood(emoji: "😩", name: "Stressed"), activity: Activity(emoji: "🏃", name: "Moderate"), suggestedMeal: "Meal 3C"),
    Meal(mood: Mood(emoji: "😩", name: "Stressed"), activity: Activity(emoji: "🏋️‍♀️", name: "Intense"), suggestedMeal: "Meal 3D"),
    

    Meal(mood: Mood(emoji: "⚡️", name: "Energetic"), activity: Activity(emoji: "🪑", name: "Sedentary"), suggestedMeal: "Meal 4A"),
    Meal(mood: Mood(emoji: "⚡️", name: "Energetic"), activity: Activity(emoji: "🚶‍♂️", name: "Light"), suggestedMeal: "Meal 4B"),
    Meal(mood: Mood(emoji: "⚡️", name: "Energetic"), activity: Activity(emoji: "🏃", name: "Moderate"), suggestedMeal: "Meal 4C"),
    Meal(mood: Mood(emoji: "⚡️", name: "Energetic"), activity: Activity(emoji: "🏋️‍♀️", name: "Intense"), suggestedMeal: "Meal 4D")
]
