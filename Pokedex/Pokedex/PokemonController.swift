//
//  PokemonController.swift
//  Pokedex
//
//  Created by Luis Puentes on 4/18/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import Foundation

class PokemonController {
    
    static let baseURL = URL(string: "http://pokeapi.co/api/v2/pokemon/")
    
    static func fetchPokemon(for searchTerm: String, completion: @escaping (Pokemon?) -> Void) {
        
        guard let url = baseURL?.appendingPathComponent(searchTerm.lowercased()) else {
            completion(nil)
            return }
        NetworkController.performRequest(for: url, httpMethod: .get) { data, error in
            // Body of closure
            // Make sure data is not nil
            guard let data = data,
            // Convert our data into JSON
                let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: Any] else { completion(nil)
                    return }
            // Since our response is of type [String: Any] we do not have to flatMap over an array. We can pass in jsonDictionary to our failable initializer because our initializer will unwrap the KEYS of "name", "id", and "abilities" which are stored in our jsonDictionary response.
            let pokemon = Pokemon(dictionary: jsonDictionary)
            // Send the pokemon object to our completion so we can define the parameter when we create our closure when calling fetchPokemon
            completion(pokemon)
        }
    }
}
