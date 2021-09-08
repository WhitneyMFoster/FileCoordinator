//
//  Decoder.swift
//  
//
//  Created by Whitney Foster on 8/29/21.
//

import Foundation

public struct Decoder {
    
    public init() {}
        
    public func decodeObjectFromFile<T: Decodable>(objectType: T.Type, fromFile filePath: String) throws -> Decodable {
        return try self.decodeObjectFromJSONData(objectType: objectType,
                                                 fromData: try FileParser().readJSONDataFromFile(filePath))
    }
    
    public func decodeObjectFromJSONData<T: Decodable>(objectType: T.Type, fromData data: Data) throws -> Decodable {
        return try JSONDecoder().decode(objectType, from: data)
    }
}
