import Foundation

public struct FileParser {
    
    public init() {}
    
    public func readJSONDataFromFile(_ filePath: String) throws -> Data {
        return try self.readDataFromPath(bundlePath: self.bundlePath(forResource: filePath, ofType: "json"))
    }
}

// ============ //

private extension FileParser {
    enum ParseError: Error {
        case bundlePathForResourceNotFound
        case dataCouldNotBeRetreivedFromFile
    }
}

private extension FileParser {
    func bundlePath(forResource resource: String, ofType type: String) throws -> String {
        guard let path = Bundle.main.path(forResource:resource, ofType: type) else {
            throw ParseError.bundlePathForResourceNotFound
        }
        return path
    }
    
    func readDataFromPath(bundlePath: String) throws -> Data {
        guard let data = try String(contentsOfFile: bundlePath).data(using: .utf8) else {
            throw ParseError.dataCouldNotBeRetreivedFromFile
        }
        return data
    }
}
