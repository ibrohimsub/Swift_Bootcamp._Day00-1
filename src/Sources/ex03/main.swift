import Foundation

func getInputScale(prompt: String) -> String {
    while true {
        print(prompt)
        let input = readLine()
            if (input!.isEmpty) {
                return "Celsius"
            } else if ["Celsius", "Kelvin", "Fahrenheit"].contains(input) {
                return input!
            } else {
            print("Incorrect input. Enter a scale. (Celsius, Kelvin, or Fahrenheit)")
        }
    }
}

func getInputSeason(prompt: String) -> String {
    while true {
        print(prompt)
        if let input = readLine(), ["S", "W"].contains(input){
            return input
        } else {
            print("Incorrect input. Enter a season.(S - summer, W - winter)")
        }
    }
}

func getInputTemperature(prompt: String) -> Int {
    while true {
        print(prompt)
        if let input = readLine(), let value = Int(input), value >= -100 && value <= 100 {
            return value
        } else {
            print("Incorrect input. Enter a temperature in ˚C.(From -100 ˚C to 100 ˚C)")
        }
    }
}

func celsiusToScale(_ celsius: Double, scale: String) -> Double {
    switch scale {
    case "Kelvin":
        return celsius + 273.15
    case "Fahrenheit":
        return celsius * 1.8 + 32
    default:
        return celsius
    }
}

func getTypeOfScale(_ scale: String) -> String {
    var typeOfScale = ""
    if scale == "Celsius" {
        typeOfScale = "˚C"
    } else if scale == "Kelvin" {
        typeOfScale = "K"
    } else if scale == "Fahrenheit" {
        typeOfScale = "˚F"
    }
    return typeOfScale
}

let Scale = getInputScale(prompt: "Enter a scale (Celsius, Kelvin or Fahrenheit):")
let Season = getInputSeason(prompt: "Enter a season (S - summer, W - winter):")
let Temperature = getInputTemperature(prompt: "Enter a temperature in ˚C (From -100 ˚C to 100 ˚C):")
let comfortableTemperature: [Int] = Season == "S" ? [22, 25] : [20, 22]
var warmerOrCooler = ""
var toChange = 0
if Temperature < comfortableTemperature[0] {
    warmerOrCooler = "warmer"
    toChange = comfortableTemperature[0] - Temperature
} else if Temperature > comfortableTemperature[1]{
    warmerOrCooler = "cooler"
    toChange = Temperature - comfortableTemperature[1]
}


print("The temperature is \(Int(celsiusToScale(Double(Temperature), scale: Scale))) \(getTypeOfScale(Scale))")
print("The comfortable temperature is from \(Int(celsiusToScale(Double(comfortableTemperature[0]), scale: Scale))) to \(Int(celsiusToScale(Double(comfortableTemperature[1]), scale: Scale))) \(getTypeOfScale(Scale)).")
if toChange != 0 {
    print("Please, make it \(warmerOrCooler) by \(Int(celsiusToScale(Double(toChange), scale: Scale))) degrees.")
} else {
    print("The temperature is comfortable")
}
