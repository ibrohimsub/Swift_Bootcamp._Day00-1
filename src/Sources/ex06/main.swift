func convertNumberToWords(number: Int) -> String {
    let units = ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    let tens = ["", "ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
    let teens = ["", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
    var words = ""
    var num = number
    
    if num == 0 {
        return "zero"
    }
    
    if num < 0 {
        words += "negative-"
        num *= -1
    }
    
    if num >= 1000000 {
        return ""
    }
    
    if num >= 1000 {
        words += convertNumberToWords(number: num / 1000) + "-thousand"
        num = num % 1000
        if num > 0 {
            words += "-"
        }
    }
    
    if num >= 100 {
        words += units[num / 100] + "-hundred"
        num = num % 100
        if num > 0 {
            words += "-"
        }
    }
    
    if num >= 11 && num <= 19 {
        words += teens[num - 10]
        return words
    }
    
    if num >= 10 {
        words += tens[num / 10]
        num = num % 10
        if num > 0 {
            words += "-"
        }
    }
    
    if num > 0 {
        words += units[num]
    }
    
    return words
}

print("The program is running. Enter a number or type \"exit\" to stop:")
var count = 0

while let input = readLine() {
    if input.lowercased() == "exit" {
        break
    }
    
    guard let number = Int(input) else {
        print("Incorrect format, try again.\nEnter a number:")
        continue
    }
    
    print(convertNumberToWords(number: number))
    count += 1
    
    if count % 5 == 0 {
        print("Enter a number or type \"exit\" to stop:")
    } else {
        print("Enter a number:")
    }
    
    if number < -1000000 || number > 1000000 {
        print("The number is out of bounds, try again.\nEnter a number:")
        continue
    }
}
