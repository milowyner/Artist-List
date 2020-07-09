//
//  Data.swift
//  Artist List
//
//  Created by Milo Wyner on 7/9/20.
//  Copyright © 2020 Milo Wyner. All rights reserved.
//

import Foundation

let artistData: [Artist] = loadFromJSON("artistData.json")

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
        fatalError("Couldn't decode data from \(filename) as \([Artist].self): \(error)")
    }
}
