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
                        let differentLetterInWord2 = difference.first?.1 else { return nil }
                    if line.firstIndex(of: differentLetterInWord1) == lineInternal.firstIndex(of: differentLetterInWord2) {
                        commonLetters = line.replacingOccurrences(of: differentLetterInWord1.description, with: "")
                        break
                    }
                }
            }
        }
    }
    return commonLetters
}

let commonLetters = findCommonLettersBetweenTwoCorrectBoxIDs(dataFileName: "day2-puzzle2-test-data")
print(String(describing: commonLetters))
