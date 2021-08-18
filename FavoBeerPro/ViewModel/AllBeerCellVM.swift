//
//  AllBeersCellViewModel.swift
//  FavoBeerPro
//
//  Created by Vladislav on 18.08.2021.
//

import Foundation

class AllBeerCellVM {
    
    private let beer: Beer
    var dataManager = LocalDataManager()
    
    var beerName: String {
        guard let beerName = beer.name else { return "Name: -" }
        return beerName
    }
    
    var beerABV: String {
        guard let beerABV = beer.abv else { return "Vol: -" }
        return "Vol: \(beerABV)"
    }
    
    var isFavorite: Bool {
        return beer._favorite
    }
    
    init(beer: Beer) {
        self.beer = beer
    }
    
    func toggleIsFavorite() {
        beer._favorite = !beer._favorite
        
        if beer._favorite {
            dataManager.saveData(beer: beer)

        } else {
            dataManager.removeData(beer: beer)
        }
        
    }
    
}
