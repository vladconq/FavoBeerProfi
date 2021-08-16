//
//  Service.swift
//  FavoBeerPro
//
//  Created by Vladislav on 15.08.2021.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    func fetchBeerData(completion: @escaping ([Beer]) -> Void) {
        
        guard let url = URL(string: "https://api.punkapi.com/v2/beers?page=1&per_page=80") else {return}
        
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
        }.resume()
    }
    
}
