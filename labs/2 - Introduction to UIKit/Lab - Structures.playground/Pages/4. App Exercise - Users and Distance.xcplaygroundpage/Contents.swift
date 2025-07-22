/*:
## App Exercise - Users and Distance
 
 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 For most apps you'll need to have a data structure to hold information about a user. Create a `User` struct that has properties for basic information about a user. At a minimum, it should have properties to represent a user's name, age, height, weight, and activity level. You could do this by having `name` be a `String`, `age` be an `Int`, `height` and `weight` be of type `Double`, and `activityLevel` be an `Int` that will represent a scoring 1-10 of how active they are. Implement this now.
 */
struct User {
    var name: String
    var age: Int
    var height: Double
    var weight: Double
    var activityLevel: Int
}

//:  Create a variable instance of `User` and call it your name. Use the memberwise initializer to pass in information about yourself. Then print out a description of your `User` instance using the instance's properties.
var me: User = User(name: "Ankit", age: 19, height: 1.70, weight: 80, activityLevel: 10)
print("Hello, my name is \(me.name) and I am \(me.age) years old.")
print("I am \(me.height) meters tall and weigh \(me.weight) kilograms.")
print("I am rated \(me.activityLevel)/10 active.")

/*:
 In previous app exercises, you've worked with distance in the fitness tracking app example as a simple number. However, distance can be represented using a variety of units of measurement. Create a `Distance` struct that will represent distance in various units of measurement. At a minimum, it should have a `meters` property and a `feet` property. Create a custom initializer corresponding to each property (i.e. if you only have the two properties for meters and feet you will then have two initializers) that will take in a distance in one unit of measurement and assign the correct value to both units of measurements. Hint: *1 meter = 3.28084 feet*.

 - Example: If you use the initializer for meters and pass in a distance of 1600, the initializer should set `meters` to 1600 and `feet` to 5249.344.
 */
struct Distance {
    var meters: Double
    var feet: Double
    
    init(meters: Double) {
        self.meters = meters
        self.feet = meters * 3.28084
    }
    
    init(feet: Double) {
        self.feet = feet
        self.meters = feet / 3.28084
    }
}


//:  Now create an instance of `Distance` called `mile`. Use the initializer for meters to set the distance to 1600. Print out the property for feet and verify that it is equal to 5249.344.
var mile = Distance(meters: 1600)
print("1 mile in feet \(mile.feet)")
print("1 mile in meters \(mile.meters)")

//:  Now create another instance of `Distance` and give it some other distance. Ensure that both properties are set correctly.
var anotherDistance = Distance(feet: 500)
print(anotherDistance.meters)
print(anotherDistance.feet)

/*:
[Previous](@previous)  |  page 4 of 10  |  [Next: Exercise - Methods](@next)
 */
