//
//  Data.swift
//  Artist List
//
//  Created by Milo Wyner on 7/9/20.
//  Copyright © 2020 Milo Wyner. All rights reserved.
//

import Foundation

var artistData: [Artist] = loadFromJSON("artistData.json")

func loadFromJSON<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let url = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: url)
    } catch {
        fatalError("Couldn't get data from \(filename): \(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't decode data from \(filename) as \(T.self): \(error)")
    }
}

func saveToJSON<T: Encodable>(_ filename: String, data: T) {
    let encodedData: Data
    
    guard let url = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        encodedData = try encoder.encode(data)
    } catch {
        fatalError("Couldn't encode \(T.self): \(error)")
    }
    
    do {
        try encodedData.write(to: url)
    } catch {
        fatalError("Couldn't write \(T.self) data to \(filename): \(error)")
    }
}

extension Array where Element == Artist {
    func save() {
        saveToJSON("artistData.json", data: self)
    }
}
