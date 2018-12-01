import Foundation
import XCTest

// PUZZLE 1

let sum = DataReader.calculateSum(dataFileName: "day1-input-data")
print(sum)


class Puzzle1Tests: XCTestCase {
    
    func test_calculateSum_shouldReturn3_whenFirstTestDataPassed() {
        XCTAssertEqual(DataReader.calculateSum(dataFileName: "puzzle1-test-data1"), 3)
    }
    
    func test_calculateSum_shouldReturn0_whenSecondTestDataPassed() {
        XCTAssertEqual(DataReader.calculateSum(dataFileName: "puzzle1-test-data2"), 0)
    }
    
    func test_calculateSum_shouldReturnMinus6_whenThirdTestDataPassed() {
        XCTAssertEqual(DataReader.calculateSum(dataFileName: "puzzle1-test-data3"), -6)
    }
    
    func test_calculateSum_shouldReturn402_whenMainTestDataPassed() {
        XCTAssertEqual(DataReader.calculateSum(dataFileName: "day1-input-data"), 402)
    }
}

Puzzle1Tests.defaultTestSuite.run()

// PUZZLE 2

func findFirstFrequencyReachedTwice(dataFileName: String) -> Int? {
    var firstFrequencyReachedTwice: Int?
    var alreadyPerformedNumbers = Set<Int>()
    var currentFrequency = 0
    var frequencies = Set([currentFrequency])
    var numberToBreak: Int?
    let numbers = DataReader.getNumbers(dataFileName: dataFileName)
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
