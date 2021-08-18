//
//  DetailsOfBeerViewModel.swift
//  FavoBeerPro
//
//  Created by Vladislav on 17.08.2021.
//

import Foundation

class DetailBeerVM {
    
    var beer: Beer!
    var dataManager = LocalDataManager()
    var delegate: DetailBeerVMDelegate?
    
    init(beer: Beer) {
        self.beer = beer
    }
    
    var beerName: String {
        guard let beerName = beer.name else { return "-" }
        return beerName
    }
    
    var beerABV: String {
        guard let beerABV = beer.abv else { return "-" }
        return "\(beerABV)"
    }
    
    var beerIBU: String {
        guard let beerIBU = beer.ibu else { return "-" }
        return "\(beerIBU)"
    }
    
    var isFavorite: Bool {
        return beer._favorite
    }
    
    func toggleIsFavorite() {
        beer._favorite = !beer._favorite
        
        if beer._favorite {
            dataManager.saveData(beer: beer!)

        } else {
            dataManager.removeData(beer: beer!)
        }
        
        delegate?.updateDetailBeerVC()
    }
}
