//
//  AllBeersCellViewModel.swift
//  FavoBeerPro
//
//  Created by Vladislav on 16.08.2021.
//

import Foundation

protocol AllBeersCellViewModelDelegate {
    func updateView()
}

class AllBeersCellViewModel {
    
    // MARK: - Properties
    
    var delegate: AllBeersCellViewModelDelegate?
    
    private let beer: Beer
    
    var beerName: String {
        guard let beerName = beer.name else { return "No Name" }
        return beerName
    }
    
    var beerABV: String {
        guard let beerABV = beer.abv else { return "Vol: -" }
        return "Vol: \(beerABV)"
    }
    
    // MARK: - Lifecycle
    
    init(beer: Beer) {
        self.beer = beer
    }
    
    // MARK: - Helpers
    
    func didTapFavorite() {
        delegate?.updateView()
    }
    
}
