//
//  DetailBeerCellView.swift
//  FavoBeerPro
//
//  Created by Vladislav on 18.08.2021.
//

import UIKit

class DetailBeerCellView: UITableViewCell {
    
    // MARK: - Properties
    
    static let reuseIdentifier = "DetailBeerCell"
    
    var viewModel: DetailBeerCellVM? {
        didSet {
            
            switch BeerDetail(rawValue: (viewModel?.indexRow)!) {
            case .name:
                beerInfoLabel.text = viewModel?.beerName
            case .abv:
                beerInfoLabel.text = viewModel?.beerABV
            case .ebc:
                beerInfoLabel.text = viewModel?.beerEBC
            case .ibu:
                beerInfoLabel.text = viewModel?.beerIBU
            case .none:
                beerInfoLabel.text = "-"
            }
            
        }
    }
    
    private let beerInfoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureBeerInfoLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configureBeerInfoLabel() {
        addSubview(beerInfoLabel)
        beerInfoLabel.anchor(left: contentView.leftAnchor, right: contentView.rightAnchor)
        beerInfoLabel.setHeight(height: 50)
        beerInfoLabel.centerY(inView: self)
    }
    
}

