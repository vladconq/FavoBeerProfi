//
//  AllBeersCell.swift
//  FavoBeerPro
//
//  Created by Vladislav on 15.08.2021.
//

import UIKit

class AllBeersCell: UITableViewCell, AllBeersCellViewModelDelegate {
    func updateView() {
        print("hi")
    }
    
    // MARK: - Properties
    
    static let reuseIdentifier = "AllBeersCell"
    
    var viewModel: AllBeersCellViewModel? {
        didSet {
            beerNameLabel.text = viewModel?.beerName
            beerABVLabel.text = viewModel?.beerABV
        }
    }
    
    private let beerNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let beerABVLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.alpha = 0.80
        return label
    }()
    
    private let favoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "star.fill"), for: .normal)
        button.tintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureFavoriteButton()
        configureStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handlePressFavorite() {
        print("Press Favorite")
    }
    
    // MARK: - Helpers
    
    func configureFavoriteButton() {
        favoriteButton.addTarget(self, action: #selector(handlePressFavorite), for: .touchUpInside)
        
        contentView.addSubview(favoriteButton)
        favoriteButton.anchor(right: rightAnchor, paddingRight: 20)
        favoriteButton.centerY(inView: self)
    }
    
    func configureStackView() {
        let stack = UIStackView(arrangedSubviews: [beerNameLabel, beerABVLabel])
        stack.axis = .vertical
        stack.spacing = 2
        
        addSubview(stack)
        stack.anchor(left: contentView.leftAnchor, paddingLeft: 20)
        stack.centerY(inView: self)
    }
    
}
