import Foundation

func calculateSum(dataFileName: String) -> Int {
    guard let fileUrl = Bundle.main.url(forResource: dataFileName, withExtension: "txt"),
        let fileContent = try? String(contentsOf: fileUrl, encoding: .utf8) else { return 0 }
    let lines = fileContent.components(separatedBy: .newlines)
    let numbers = lines.compactMap { Int($0) }
    return numbers.reduce(0, +)
}

let sum1 = calculateSum(dataFileName: "puzzle1-test-data1")
print(sum1)
let sum2 = calculateSum(dataFileName: "puzzle1-test-data2")
print(sum2)
let sum3 = calculateSum(dataFileName: "puzzle1-test-data3")
print(sum3)
let sum4 = calculateSum(dataFileName: "puzzle1")
print(sum4)
