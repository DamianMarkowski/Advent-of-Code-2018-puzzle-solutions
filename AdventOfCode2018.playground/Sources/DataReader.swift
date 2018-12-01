import Foundation

public class DataReader {
    
    public class func calculateSum(dataFileName: String) -> Int {
        return getNumbers(dataFileName: dataFileName).reduce(0, +)
    }
    
    public class func getNumbers(dataFileName: String) -> [Int] {
        guard let fileContent = readDataFromFile(dataFileName: dataFileName) else { return [] }
        let lines = fileContent.components(separatedBy: .newlines)
        return lines.compactMap { Int($0) }
    }
    
    private class func readDataFromFile(dataFileName: String) -> String? {
        guard let fileUrl = Bundle.main.url(forResource: dataFileName, withExtension: "txt"),
            let fileContent = try? String(contentsOf: fileUrl, encoding: .utf8) else { return nil }
        return fileContent
    }
}
