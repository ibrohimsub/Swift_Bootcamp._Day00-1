import Foundation

enum Order {
    case lower, higher
}

enum InputError: Error {
    case invalidNumber
    case invalidArgument
}

var order = Order.lower
if CommandLine.arguments.count > 1 {
    switch CommandLine.arguments[1] {
    case "lower":
        order = .lower
    case "higher":
        order = .higher
    default:
        throw InputError.invalidArgument
    }
}

print("Please enter a number:")
guard let input = readLine(), let number = Int(input) else {
    throw InputError.invalidNumber
}

var output = ""
let digits = String(number).map { String($0) }
if order == .lower {
    for i in 0..<digits.count {
        output += digits[i]
        print(output)
    }
} else {
    for i in (0..<digits.count).reversed() {
        output += digits[i]
        print(output)
    }
}
