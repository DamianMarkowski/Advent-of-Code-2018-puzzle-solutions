import Foundation

func calculateCheckSum(dataFileName: String) -> Int {
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
                if characterSavedForDoubleRepetition == nil {
                    numberOfLinesWithDoubleRepetition += 1
                    characterSavedForDoubleRepetition = character
                }
            }
            if count == 3 {
                if characterSavedForTripleRepetition == nil {
                    numberOfLinesWithTripleRepetition += 1
                    characterSavedForTripleRepetition = character
                }
            }
        }
    }
   
    return numberOfLinesWithDoubleRepetition * numberOfLinesWithTripleRepetition
}

extension String {
    func count(of letter: Character) -> Int {
        return reduce(0) {
            $1 == letter ? $0 + 1 : $0
        }
    }
}

let checkSum = calculateCheckSum(dataFileName: "day2-puzzle1-input-data")
print(checkSum)
