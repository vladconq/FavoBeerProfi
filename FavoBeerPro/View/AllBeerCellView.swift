//
//  AllBeersCell.swift
//  FavoBeerPro
//
//  Created by Vladislav on 15.08.2021.
//

import UIKit



class AllBeerCellView: UITableViewCell {
    
    // MARK: - Properties
    
    var delegate: AllBeerVMDelegate?
    var dataManager = LocalDataManager()
    
    
    static let reuseIdentifier = "AllBeersCell"
    
    var viewModel: AllBeerCellVM? {
        didSet {
            beerNameLabel.text = viewModel?.beerName
            beerABVLabel.text = viewModel?.beerABV
            
            favoriteButton.tintColor = viewModel!.isFavorite ? #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
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
        
        viewModel!.toggleIsFavorite()
        
        delegate?.updateAllBeerVC()
    }
    
    // MARK: - Helpers
    
    func configureFavoriteButton() {
        favoriteButton.addTarget(self, action: #selector(handlePressFavorite), for: .touchUpInside)
        
        contentView.addSubview(favoriteButton)
        favoriteButton.anchor(right: rightAnchor, paddingRight: 20)
        favoriteButton.setDimensions(height: 50, width: 50)
        favoriteButton.centerY(inView: self)
    }
    
    func configureStackView() {
        let stack = UIStackView(arrangedSubviews: [beerNameLabel, beerABVLabel])
        stack.axis = .vertical
        stack.spacing = 2
        
        addSubview(stack)
        stack.anchor(left: contentView.leftAnchor, right: favoriteButton.leftAnchor, paddingLeft: 20)
        stack.centerY(inView: self)
    }
    
}


