//
//  Pokemon.swift
//  Pokedex
//
//  Created by Luis Puentes on 4/18/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import Foundation

struct Pokemon {
    
    let name: String
    let id: Int
    let abilities: [String]
}

// MARK: - JSON

extension Pokemon {
    
    private static let kName = "name"
    private static let kID = "id"
    private static let kAbilities = "abilities"
    
    init?(dictionary: [String: AnyObject]) {
        guard let name = dictionary[Pokemon.kName] as? String, let id = dictionary[Pokemon.kID] as? Int, let abilityDictionary = dictionary[Pokemon.kAbilities] as? [[String: AnyObject]] else { return nil }
        
        let abilities = abilityDictionary.flatMap { $0 ["ability"]?["name"] as? String }
        
        self.init(name: name, id: id, abilities: abilities)
    }
    
    
}
