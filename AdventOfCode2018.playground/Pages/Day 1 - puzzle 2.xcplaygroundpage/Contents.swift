import Foundation
import XCTest

func findFirstFrequencyReachedTwice(dataFileName: String) -> Int? {
    var firstFrequencyReachedTwice: Int?
    var alreadyPerformedNumbers = Set<Int>()
    var currentFrequency = 0
    var frequencies = Set([currentFrequency])
    var numberToBreak: Int?
    let numbers = DataReader.getNumbers(dataFileName: dataFileName)
    while firstFrequencyReachedTwice == nil {
        for number in numbers {
            populateNumberToBreak(with: number, numberToBreak: &numberToBreak, alreadyPerformedNumbers: alreadyPerformedNumbers)
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

private func populateNumberToBreak(with number: Int, numberToBreak: inout Int?, alreadyPerformedNumbers: Set<Int>) {
    if numberToBreak == nil {
        if alreadyPerformedNumbers.contains(number) {
            numberToBreak = number
        }
    }
}

let frequency = findFirstFrequencyReachedTwice(dataFileName: "day1-input-data")
print(String(describing: frequency))

class Puzzle2Tests: XCTestCase {
    
    func test_findFirstFrequencyReachedTwice_shouldReturn0_whenFirstTestDataPassed() {
        XCTAssertEqual(findFirstFrequencyReachedTwice(dataFileName: "puzzle2-test-data1"), 0)
    }
    
    func test_findFirstFrequencyReachedTwice_shouldReturn10_whenSecondTestDataPassed() {
        XCTAssertEqual(10, findFirstFrequencyReachedTwice(dataFileName: "puzzle2-test-data2"))
    }
    
    func test_findFirstFrequencyReachedTwice_shouldReturn5_whenThirdTestDataPassed() {
        XCTAssertEqual(findFirstFrequencyReachedTwice(dataFileName: "puzzle2-test-data3"), 5)
    }
    
    func test_findFirstFrequencyReachedTwice_shouldReturn14_whenFourthTestDataPassed() {
        XCTAssertEqual(findFirstFrequencyReachedTwice(dataFileName: "puzzle2-test-data4"), 14)
    }
    
    func test_findFirstFrequencyReachedTwice_shouldReturn481_whenMainTestDataPassed() {
        XCTAssertEqual(findFirstFrequencyReachedTwice(dataFileName: "day1-input-data"), 481)
    }
}

Puzzle2Tests.defaultTestSuite.run()
