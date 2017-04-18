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
    
    init?(dictionary: [String: Any]) {
        guard let name = dictionary[Pokemon.kName] as? String,
            let id = dictionary[Pokemon.kID] as? Int,
            // Getting the abilityDictionary from "abilities" because "abilities" returns an array of dictionary from the API and has to be parsed into an abilities array of String
            let abilityDictionary = dictionary[Pokemon.kAbilities] as? [[String: AnyObject]] else { return nil }
        // Using AnyObject so that we can subscript the dictionary, and the chain KEYS to get the value of the final KEY of "name" then cast that as a String
        let abilities = abilityDictionary.flatMap { $0 ["ability"]?["name"] as? String }
        
        self.init(name: name, id: id, abilities: abilities)
    }
    
    
}
