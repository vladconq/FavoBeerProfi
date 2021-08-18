//
//  DetailsOfBeerViewModel.swift
//  FavoBeerPro
//
//  Created by Vladislav on 17.08.2021.
//

import Foundation

class DetailBeerVM {
    
    // MARK: - Properties
    
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
    
    // MARK: - Helpers
    
    func toggleIsFavorite() {
        beer._favorite = !beer._favorite
        
        if beer._favorite {
            dataManager.saveData(beer: beer!)

        } else {
            dataManager.removeData(beer: beer!)
        }
        
        delegate?.updateDetailBeerVC()
    }
    
    func getDetailBeerCellVM(forIndexPath indexPath: IndexPath) -> DetailBeerCellVM? {
        let detailBeerCellVM = DetailBeerCellVM(beer: beer, indexRow: indexPath.row)
        return detailBeerCellVM
    }
}
