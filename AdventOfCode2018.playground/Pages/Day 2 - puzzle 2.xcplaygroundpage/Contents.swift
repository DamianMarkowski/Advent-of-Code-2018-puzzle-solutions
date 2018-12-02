import XCTest

func findCommonLettersBetweenTwoCorrectBoxIDs(dataFileName: String) -> String? {
    guard let fileContent = DataReader.readDataFromFile(dataFileName: dataFileName) else { return nil }
    let lines = DataReader.splitDataFromFileIntoLines(fileContent: fileContent)
    var commonLetters: String?
    for line in lines {
        for lineInternal in lines {
            if line != lineInternal {
                let difference = zip(line, lineInternal).filter{ $0 != $1 }
                if difference.count == 1 {
                    guard let differentLetterInWord1 = difference.first?.0,
                        let differentLetterInWord2 = difference.first?.1, let indexInWord1 = line.firstIndex(of: differentLetterInWord1), let indexInWord2 = lineInternal.firstIndex(of: differentLetterInWord2) else { return nil }
                    if indexInWord1 == indexInWord2 {
                        var textToChange = line
                        textToChange.remove(at: indexInWord1)
                        commonLetters = textToChange
                        break
                    }
                }
            }
        }
    }
    return commonLetters
}

let commonLetters = findCommonLettersBetweenTwoCorrectBoxIDs(dataFileName: "day2-input-data")
print(String(describing: commonLetters))

class Puzzle2Tests: XCTestCase {
    
    func test_findCommonLettersBetweenTwoCorrectBoxIDs_shouldReturnCorrectValue_whenFirstTestDataPassed() {
        XCTAssertEqual(findCommonLettersBetweenTwoCorrectBoxIDs(dataFileName: "day2-puzzle2-test-data"), "fgij")
    }
    
    func test_findCommonLettersBetweenTwoCorrectBoxIDs_shouldReturnCorrectValue_whenMainTestDataPassed() {
        XCTAssertEqual(findCommonLettersBetweenTwoCorrectBoxIDs(dataFileName: "day2-input-data"), "qysdtrkloagnfozuwujmhrbvx")
    }
}

Puzzle2Tests.defaultTestSuite.run()
