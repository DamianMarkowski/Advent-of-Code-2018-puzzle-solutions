import Foundation
import XCTest

func calculateSum(dataFileName: String) -> Int {
    return DataReader.getNumbers(dataFileName: dataFileName).reduce(0, +)
}

let sum = calculateSum(dataFileName: "day1-input-data")
print(sum)


class Puzzle1Tests: XCTestCase {
    
    func test_calculateSum_shouldReturn3_whenFirstTestDataPassed() {
        XCTAssertEqual(calculateSum(dataFileName: "puzzle1-test-data1"), 3)
    }
    
    func test_calculateSum_shouldReturn0_whenSecondTestDataPassed() {
        XCTAssertEqual(calculateSum(dataFileName: "puzzle1-test-data2"), 0)
    }
    
    func test_calculateSum_shouldReturnMinus6_whenThirdTestDataPassed() {
        XCTAssertEqual(calculateSum(dataFileName: "puzzle1-test-data3"), -6)
    }
    
    func test_calculateSum_shouldReturn402_whenMainTestDataPassed() {
        XCTAssertEqual(calculateSum(dataFileName: "day1-input-data"), 402)
    }
}

Puzzle1Tests.defaultTestSuite.run()
