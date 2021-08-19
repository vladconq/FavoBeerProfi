//
//  FavoriteBeerCellView.swift
//  FavoBeerPro
//
//  Created by Vladislav on 19.08.2021.
//

import UIKit

class FavoriteBeerCellView: UITableViewCell {
    
    static let reuseIdentifier = "FavoriteBeerCell"
    
    var viewModel: FavoriteBeerCellVM? {
        didSet {
            beerNameLabel.text = viewModel?.beerName
        }
    }
    
    private let beerNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureBeerNameLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configureBeerNameLabel() {
        addSubview(beerNameLabel)
        beerNameLabel.anchor(left: contentView.leftAnchor, right: contentView.rightAnchor, paddingLeft: 20)
        beerNameLabel.setHeight(height: 50)
        beerNameLabel.centerY(inView: self)
    }
    
}
