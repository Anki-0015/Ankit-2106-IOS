/*:
## Exercise - Failable Initializers

 Create a `Computer` struct with two properties, `ram` and `yearManufactured`, where both parameters are of type `Int`. Create a failable initializer that will only create an instance of `Computer` if `ram` is greater than 0, and if `yearManufactured` is greater than 1970, and less than 2020.
 */
struct Computer {
    
    let ram: Int?
    let yearManufactured: Int?
    
    init(ram: Int, yearManufactured: Int){
        
        if ram > 0 && yearManufactured > 1970 && yearManufactured < 2020{
            
            self.ram = ram
            self.yearManufactured = yearManufactured
        }
        else {
            fatalError("Invalid parameters")
        }
    }
}



//:  Create two instances of `Computer?` using the failable initializer. One instance should use values that will have a value within the optional, and the other should result in `nil`. Use if-let syntax to unwrap each of the `Computer?` objects and print the `ram` and `yearManufactured` if the optional contains a value.
var comp1: Computer? = Computer(ram: 16, yearManufactured: 2019)
var comp2: Computer? = Computer(ram: 2, yearManufactured: 2019)

if let computer1 = comp1 {

    if let ram1 = computer1.ram, let year1 = computer1.yearManufactured{
        print("ram" , ram1, "year" , year1)
    }else{
        print("invalid")
    }
}

if let computer2 = comp2 {
    
    if let ram2 = computer2.ram, let year2 = computer2.yearManufactured{
        print("ram" , ram2, "year" , year2)
    }else{
        print("invalid")
    }
}
