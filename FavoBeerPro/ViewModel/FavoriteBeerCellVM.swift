//
//  FavoriteBeerCellVM.swift
//  FavoBeerPro
//
//  Created by Vladislav on 19.08.2021.
//

import Foundation

class FavoriteBeerCellVM {
    
    private let favoriteBeer: Beer
    
    init(favoriteBeer: Beer) {
        self.favoriteBeer = favoriteBeer
    }
    
    var beerName: String {
        guard let beerName = favoriteBeer.name else { return "Name: -" }
        return beerName
    }
    
}
