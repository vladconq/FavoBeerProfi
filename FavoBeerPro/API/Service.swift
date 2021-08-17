//
//  Service.swift
//  FavoBeerPro
//
//  Created by Vladislav on 15.08.2021.
//

import Foundation

class Service {
    
    static let shared = Service()
    var page = 1
    
    func fetchBeerData(completion: @escaping ([Beer]) -> Void) {
        
        guard let url = URL(string: "https://api.punkapi.com/v2/beers?page=\(page)&per_page=20") else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print(error!)
                return
            }
            
            guard let safeData = data else {return}
            
            do {
                let beers = try JSONDecoder().decode([Beer].self, from: safeData)
                completion(beers)
            } catch {
                print(error)
            }
            
            self.page += 1
        }.resume()
    }
    
}
