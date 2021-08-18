//
//  AllBeersCellViewModel.swift
//  FavoBeerPro
//
//  Created by Vladislav on 18.08.2021.
//

import Foundation

class AllBeersCellViewModel {
    
    private let beer: Beer
    var dataManager = DataManager()
    
    var beerName: String {
        guard let beerName = beer.name else { return "Name: -" }
        return "Name: \(beerName)"
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
            print("add")
            dataManager.saveData(beer: beer)

        } else {
            print("delete")
            dataManager.removeData(beer: beer)
        }
        
    }
    
}
