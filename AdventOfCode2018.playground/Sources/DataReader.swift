import Foundation

public class DataReader {
    
    public class func getNumbers(dataFileName: String) -> [Int] {
        guard let fileContent = readDataFromFile(dataFileName: dataFileName) else { return [] }
        let lines = splitDataFromFileIntoLines(fileContent: fileContent)
        return lines.compactMap { Int($0) }
    }
    
    public class func readDataFromFile(dataFileName: String) -> String? {
        guard let fileUrl = Bundle.main.url(forResource: dataFileName, withExtension: "txt"),
            let fileContent = try? String(contentsOf: fileUrl, encoding: .utf8) else { return nil }
        return fileContent
    }
    
    public class func splitDataFromFileIntoLines(fileContent: String) -> [String] {
        return fileContent.components(separatedBy: .newlines)
    }
}
