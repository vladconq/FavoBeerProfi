//
//  DetailsOfBeerController.swift
//  FavoBeerPro
//
//  Created by Vladislav on 15.08.2021.
//

import UIKit

class DetailsBeerController: UIViewController {
    
    // MARK: - Properties
    private let beerNameLabel = UILabel()
    private let beerABVLabel = UILabel()
    private let beerIBULabel = UILabel()
    
    private let button: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: "star.fill")

        return button
    }()
    var delegate: UpdateAllBeersTableDelegate?
    var viewModel: DetailsBeerViewModel?
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let viewModel = viewModel else { return }
        
        beerNameLabel.text = viewModel.beerName
        beerABVLabel.text = viewModel.beerABV
        beerIBULabel.text = viewModel.beerIBU
        
        button.tintColor = viewModel.isFavorite ? #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        navigationItem.rightBarButtonItem = button
        configureUI()
    }
    
    // MARK: - Selectors
    
    @objc func barButtonCustomPressed() {
        
        viewModel!.toggleIsFavorite()
        
        delegate?.updateView()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        
        button.target = self
        button.action = #selector(barButtonCustomPressed)
        
        view.addSubview(beerNameLabel)
        beerNameLabel.anchor(top: view.layoutMarginsGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
        beerNameLabel.setHeight(height: 20)
    }

}

extension DetailsBeerController: DetailsBeerViewModelDelegate {
    func updateDetailsBeerVC() {
        button.tintColor = viewModel!.isFavorite ? #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
}
