//
//  DetailsOfBeerViewModel.swift
//  FavoBeerPro
//
//  Created by Vladislav on 17.08.2021.
//

import Foundation

protocol DetailsBeerViewModelDelegate {
    func updateDetailsBeerVC()
}

class DetailsBeerViewModel {
    
    var beer: Beer!
    var dataManager = DataManager()
    var delegate: DetailsBeerViewModelDelegate?
    
    init(beer: Beer) {
        self.beer = beer
    }
    
    var beerName: String {
        guard let beerName = beer.name else { return "Name: -" }
        print(beerName)
        return "Name: \(beerName)"
    }
    
    var beerABV: String {
        guard let beerABV = beer.abv else { return "ABV: -" }
        return "ABV: \(beerABV)"
    }
    
    var beerIBU: String {
        guard let beerIBU = beer.ibu else { return "IBU: -" }
        return "IBU: \(beerIBU)"
    }
    
    var isFavorite: Bool {
        return beer._favorite
    }
    
    func toggleIsFavorite() {
        beer._favorite = !beer._favorite
        
        if beer._favorite {
            print("add")
            dataManager.saveData(beer: beer!)

        } else {
            print("delete")
            dataManager.removeData(beer: beer!)
        }
        
        delegate?.updateDetailsBeerVC()
    }
}
