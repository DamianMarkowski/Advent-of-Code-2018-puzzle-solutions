
func getNumberOfOverlappingSquareInches(dataFileName: String) -> Int {
    guard let fileContent = DataReader.readDataFromFile(dataFileName: dataFileName) else { return 0 }
    let lines = DataReader.splitDataFromFileIntoLines(fileContent: fileContent)
    var locations: [String] = []
    for line in lines {
        let splitByAt = line.split(separator: "@")
        let withoutId = splitByAt[1]
        let splitByColon = withoutId.split(separator: ":")
        let startLocation = splitByColon[0]
        let splitByComma = startLocation.split(separator: ",")
        let startLocationX = String(splitByComma[0]).trimmingCharacters(in: .whitespaces)
        let startLocationY = String(splitByComma[1]).trimmingCharacters(in: .whitespaces)
        if let startLocationXInt = Int(startLocationX), let startLocationYInt = Int(startLocationY) {
            let locationXInitial = startLocationXInt + 1
            let locationYInitial = startLocationYInt + 1
            var locationX = locationXInitial
            var locationY = locationYInitial
            let size = String(splitByColon[1]).trimmingCharacters(in: .whitespaces)
            let splitByX = size.split(separator: "x")
            let width = String(splitByX[0])
            let height = String(splitByX[1])
            if let widthInt = Int(width), let heightInt = Int(height) {
                for _ in 0..<heightInt {
                    locationX = locationXInitial
                    for _ in 0..<widthInt {
                        locations.append("\(locationX)x\(locationY)")
                        locationX += 1
                    }
                    locationY += 1
                }
            }
        }
    }
    let duplicates = Array(Set(locations.filter({ (i: String) in locations.filter({ $0 == i }).count > 1})))
    return duplicates.count
}

let overlappingSquareInches = getNumberOfOverlappingSquareInches(dataFileName: "day3-input-data")
print(overlappingSquareInches)
