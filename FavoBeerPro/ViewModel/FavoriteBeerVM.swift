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
    
    func getFavoriteBeerCellVM(forIndexPath indexPath: IndexPath) -> FavoriteBeerCellVM? {
        let favoriteBeerCellVM = FavoriteBeerCellVM(favoriteBeer: favoriteBeers[indexPath.row])
        return favoriteBeerCellVM
    }
    
    func loadData() {
        favoriteBeers = dataManager.loadData()
    }
    
}
