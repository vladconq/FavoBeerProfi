//
//  AllBeersViewModel.swift
//  FavoBeerPro
//
//  Created by Vladislav on 16.08.2021.
//

import Foundation

class AllBeerVM {
    
    // MARK: - Properties
    
    var delegate: AllBeerVMDelegate?
    
    var beers = [Beer]() {
        didSet {
            delegate?.updateAllBeerVC()
        }
    }
    
    // MARK: - API
    
    func fetchData() {
        Service.shared.fetchBeerData(completion: { beers in
            for beer in beers {
                self.beers.append(beer)
            }
        })
    }
    
    // MARK: - Helpers
    
    func getDetailBeerVM(forIndexPath indexPath: IndexPath) -> DetailBeerVM? {
        let detailBeerVM = DetailBeerVM(beer: beers[indexPath.row])
        return detailBeerVM
    }
    
    func getAllBeerCellVM(forIndexPath indexPath: IndexPath) -> AllBeerCellVM? {
        let allBeerCellVM = AllBeerCellVM(beer: beers[indexPath.row])
        return allBeerCellVM
    }
    
}
