import Foundation

func getInput(prompt: String) -> Double {
    while true {
        print(prompt)
        if let input = readLine(), let value = Double(input) {
            return value
        } else {
            print("Couldn't parse a number. Please, try again")
        }
    }
}

func circlesIntersect(x1: Double, y1: Double, r1: Double, x2: Double, y2: Double, r2: Double) -> String {
    let distance = sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2))
    
    if distance <= r1 + r2 && distance >= abs(r1 - r2) {
        return "The circles intersect"
    } else if distance < abs(r1 - r2) || distance > r1 + r2 {
        return "The circles do not intersect"
    } else {
        return "One circle is inside another"
    }
}

let x1 = getInput(prompt: "Enter x coordinate of the first circle:")
let y1 = getInput(prompt: "Enter y coordinate of the first circle:")
let r1 = getInput(prompt: "Enter radius of the first circle:")
let x2 = getInput(prompt: "Enter x coordinate of the second circle:")
let y2 = getInput(prompt: "Enter y coordinate of the second circle:")
let r2 = getInput(prompt: "Enter radius of the second circle:")

let result = circlesIntersect(x1: x1, y1: y1, r1: r1, x2: x2, y2: y2, r2: r2)

print(result)
