//
//  DetailBeerCellVM.swift
//  FavoBeerPro
//
//  Created by Vladislav on 18.08.2021.
//

import Foundation

class DetailBeerCellVM {
    
    private let beer: Beer
    let indexRow: Int
    
    init(beer: Beer, indexRow: Int) {
        self.beer = beer
        self.indexRow = indexRow
    }
    
    var beerName: String {
        guard let beerName = beer.name else { return "Name: -" }
        return beerName
    }
    
    var beerABV: String {
        guard let beerABV = beer.abv else { return "Vol: -" }
        return "Vol: \(beerABV)"
    }
    
    var beerEBC: String {
        guard let beerEBC = beer.ebc else { return "EBC: -" }
        return "EBC: \(beerEBC)"
    }
    
    var beerIBU: String {
        guard let beerIBU = beer.ibu else { return "IBU: -" }
        return "IBU: \(beerIBU)"
    }
    
}
