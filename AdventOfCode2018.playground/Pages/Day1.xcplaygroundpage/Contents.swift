import Foundation

// PUZZLE 1

func calculateSum(dataFileName: String) -> Int {
    return getNumbers(dataFileName: dataFileName).reduce(0, +)
}

func readDataFromFile(dataFileName: String) -> String? {
    guard let fileUrl = Bundle.main.url(forResource: dataFileName, withExtension: "txt"),
        let fileContent = try? String(contentsOf: fileUrl, encoding: .utf8) else { return nil }
    return fileContent
}

func getNumbers(dataFileName: String) -> [Int] {
    guard let fileContent = readDataFromFile(dataFileName: dataFileName) else { return [] }
    let lines = fileContent.components(separatedBy: .newlines)
    return lines.compactMap { Int($0) }
}

let sum1 = calculateSum(dataFileName: "puzzle1-test-data1")
print(sum1)

let sum2 = calculateSum(dataFileName: "puzzle1-test-data2")
print(sum2)

let sum3 = calculateSum(dataFileName: "puzzle1-test-data3")
print(sum3)

let sum4 = calculateSum(dataFileName: "day1-input-data")
print(sum4)


// PUZZLE 2

func findFirstFrequencyReachedTwice(dataFileName: String) -> Int? {
    var firstFrequencyReachedTwice: Int?
    var alreadyPerformedNumbers = Set<Int>()
    var currentFrequency = 0
    var frequencies = Set([currentFrequency])
    var numberToBreak: Int?
    let numbers = getNumbers(dataFileName: dataFileName)
    while firstFrequencyReachedTwice == nil {
        for number in numbers {
            if numberToBreak == nil {
                if alreadyPerformedNumbers.contains(number) {
                    numberToBreak = number
                }
            }
            alreadyPerformedNumbers.insert(number)
            currentFrequency += number
            if frequencies.contains(currentFrequency) {
                firstFrequencyReachedTwice = currentFrequency
                break
            } else {
                frequencies.insert(currentFrequency)
            }
        }
    }
    return firstFrequencyReachedTwice
}

let frequency1 = findFirstFrequencyReachedTwice(dataFileName: "puzzle2-test-data1")
print(String(describing: frequency1))

let frequency2 = findFirstFrequencyReachedTwice(dataFileName: "puzzle2-test-data2")
print(String(describing: frequency2))

let frequency3 = findFirstFrequencyReachedTwice(dataFileName: "puzzle2-test-data3")
print(String(describing: frequency3))

let frequency4 = findFirstFrequencyReachedTwice(dataFileName: "puzzle2-test-data4")
print(String(describing: frequency4))

let frequency5 = findFirstFrequencyReachedTwice(dataFileName: "day1-input-data")
print(String(describing: frequency5))
