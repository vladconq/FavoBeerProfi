//
//  BeerDetail.swift
//  FavoBeerPro
//
//  Created by Vladislav on 18.08.2021.
//

import Foundation

enum BeerDetail: Int, CaseIterable {
    case name, abv, ebc, ibu
    
    var description: String {

        switch self {

        case .name: return "Name"
        case .abv:  return "ABV"
        case .ebc:  return "EBC"
        case .ibu:  return "IBU"
        }
    }
}
