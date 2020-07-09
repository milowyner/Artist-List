//
//  Artist.swift
//  Artist List
//
//  Created by Milo Wyner on 7/9/20.
//  Copyright © 2020 Milo Wyner. All rights reserved.
//

import Foundation

struct Artist: Codable, Identifiable {
    let id = UUID()
    
    let name: String
    let birthYear: Int
    let city: String
    let country: String
}
