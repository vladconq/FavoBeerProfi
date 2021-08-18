//
//  AllBeersViewModel.swift
//  FavoBeerPro
//
//  Created by Vladislav on 16.08.2021.
//

import Foundation

protocol AllBeersViewModelDelegate {
    func updateView()
}

class AllBeersViewModel {
    
    // MARK: - Properties
    
    var delegate: UpdateAllBeersTableDelegate?
    
    var beers = [Beer]() {
        didSet {
            delegate?.updateView()
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
    
    func getDetailsBeerViewModel(forIndexPath indexPath: IndexPath) -> DetailsBeerViewModel? {
        let detailsBeerViewModel = DetailsBeerViewModel(beer: beers[indexPath.row])
        return detailsBeerViewModel
    }
    
    func getAllBeersCellViewModel(forIndexPath indexPath: IndexPath) -> AllBeersCellViewModel? {
        let allBeersCellViewModel = AllBeersCellViewModel(beer: beers[indexPath.row])
        return allBeersCellViewModel
    }
    
}
