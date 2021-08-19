//
//  FavoriteBeerVM.swift
//  FavoBeerPro
//
//  Created by Vladislav on 19.08.2021.
//

import Foundation

class FavoriteBeerVM {
    
    var dataManager = LocalDataManager()
    var delegate: FavoriteBeerVMDelegate?
    
    var favoriteBeers = [Beer]() {
        didSet {
            delegate?.updateFavoriteBeerVC()
        }
    }
    
    func updateFavoriteArray(sortBy: BeerDetail = BeerDetail.name) {
        switch sortBy {
        case .name:
            favoriteBeers = favoriteBeers.filter { $0.name != nil }.sorted(by: {$0.name! < $1.name!})
        case .abv:
            favoriteBeers = favoriteBeers.filter { $0.abv != nil }.sorted(by: {$0.abv! < $1.abv!})
        case .ebc:
            favoriteBeers = favoriteBeers.filter { $0.ebc != nil }.sorted(by: {$0.ebc! < $1.ebc!})
        case .ibu:
            favoriteBeers = favoriteBeers.filter { $0.ibu != nil }.sorted(by: {$0.ibu! < $1.ibu!})
        }
    }
    
    func getFavoriteBeerCellVM(forIndexPath indexPath: IndexPath) -> FavoriteBeerCellVM? {
        let favoriteBeerCellVM = FavoriteBeerCellVM(favoriteBeer: favoriteBeers[indexPath.row])
        return favoriteBeerCellVM
    }
    
    func getDetailBeerVM(forIndexPath indexPath: IndexPath) -> DetailBeerVM? {
        let detailBeerVM = DetailBeerVM(beer: favoriteBeers[indexPath.row])
        return detailBeerVM
    }
    
    func loadData() {
        favoriteBeers = dataManager.loadData()
    }
    
}
