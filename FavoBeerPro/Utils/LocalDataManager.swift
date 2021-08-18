//
//  DataLocalManager.swift
//  FavoBeerPro
//
//  Created by Vladislav on 18.08.2021.
//

import Foundation

class LocalDataManager {
    
    var dataFilePath: URL? {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Beers.plist")
    }
    
    func removeData(beer: Beer) {
        
        let encoder = PropertyListEncoder()
        
        do {
            var favoriteBeers = loadData()
            favoriteBeers.removeAll{$0 == beer}
            let newFavoriteBeers = try encoder.encode(favoriteBeers)
            try newFavoriteBeers.write(to: dataFilePath!)
        } catch {
            print(error)
        }
        
    }
    
    func saveData(beer: Beer) {
        
        let encoder = PropertyListEncoder()
        
        do {
            var favoriteBeers = loadData()
            favoriteBeers.append(beer)
            let newFavoriteBeers = try encoder.encode(favoriteBeers)
            try newFavoriteBeers.write(to: dataFilePath!)
        } catch {
            print(error)
        }
        
    }
    
    func loadData() -> [Beer] {
        
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            
            do {
                let favoriteBeers = try decoder.decode([Beer].self, from: data)
                return favoriteBeers
            } catch {
                print(error)
            }
        }
        return []
    }
    
}
