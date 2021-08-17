//
//  AllBeersCellViewModel.swift
//  FavoBeerPro
//
//  Created by Vladislav on 17.08.2021.
//

import Foundation

class AllBeersCellViewModel {
    
    private let beer: Beer
    
    init(beer: Beer) {
        self.beer = beer
        print(beer.name)
    }
    
}
