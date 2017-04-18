//
//  PokedexViewController.swift
//  Pokedex
//
//  Created by Luis Puentes on 4/18/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class PokedexViewController: UIViewController, UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    
}
