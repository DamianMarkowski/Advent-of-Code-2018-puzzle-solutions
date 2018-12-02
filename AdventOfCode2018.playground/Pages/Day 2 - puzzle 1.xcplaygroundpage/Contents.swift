import Foundation
import XCTest

func calculateChecksum(dataFileName: String) -> Int {
    guard let fileContent = DataReader.readDataFromFile(dataFileName: dataFileName) else { return 0 }
    let lines = DataReader.splitDataFromFileIntoLines(fileContent: fileContent)
    var numberOfLinesWithDoubleRepetition = 0
    var numberOfLinesWithTripleRepetition = 0
    for line in lines {
        var characterSavedForDoubleRepetition: Character?
        var characterSavedForTripleRepetition: Character?
        for character in line {
            let count = line.count(of: character)
            if count == 2 {
                handleCount2(with: character, characterSavedForDoubleRepetition: &characterSavedForDoubleRepetition, numberOfLinesWithDoubleRepetition: &numberOfLinesWithDoubleRepetition)
            }
            if count == 3 {
                handleCount3(with: character, characterSavedForTripleRepetition: &characterSavedForTripleRepetition, numberOfLinesWithTripleRepetition: &numberOfLinesWithTripleRepetition)
            }
        }
    }
   
    return numberOfLinesWithDoubleRepetition * numberOfLinesWithTripleRepetition
}

private func handleCount2(with character: Character, characterSavedForDoubleRepetition: inout Character?, numberOfLinesWithDoubleRepetition: inout Int) {
    if characterSavedForDoubleRepetition == nil {
        numberOfLinesWithDoubleRepetition += 1
        characterSavedForDoubleRepetition = character
    }
}

private func handleCount3(with character: Character, characterSavedForTripleRepetition: inout Character?, numberOfLinesWithTripleRepetition: inout Int) {
    if characterSavedForTripleRepetition == nil {
        numberOfLinesWithTripleRepetition += 1
        characterSavedForTripleRepetition = character
    }
}

extension String {
    func count(of letter: Character) -> Int {
        return reduce(0) {
            $1 == letter ? $0 + 1 : $0
        }
    }
}

let checksum = calculateChecksum(dataFileName: "day2-input-data")
print(checksum)

class Puzzle1Tests: XCTestCase {
    
    func test_calculateChecksum_shouldReturn12_whenFirstTestDataPassed() {
        XCTAssertEqual(calculateChecksum(dataFileName: "day2-puzzle1-test-data"), 12)
    }
    
    func test_calculateChecksum_shouldReturn4980_whenMainTestDataPassed() {
        XCTAssertEqual(calculateChecksum(dataFileName: "day2-input-data"), 4980)
    }
}

Puzzle1Tests.defaultTestSuite.run()
