//
//  DetailsOfBeerController.swift
//  FavoBeerPro
//
//  Created by Vladislav on 15.08.2021.
//

import UIKit

class DetailBeerVC: UIViewController {
    
    // MARK: - Properties
    
    var delegate: AllBeerVMDelegate?
    var viewModel: DetailBeerVM?
    
    private let beerNameLabel = UILabel()
    private let beerABVLabel = UILabel()
    private let beerIBULabel = UILabel()
    
    private let isFavoriteBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: "star.fill")
        return button
    }()

    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let viewModel = viewModel else { return }
        
        beerNameLabel.text = viewModel.beerName
        beerABVLabel.text = viewModel.beerABV
        beerIBULabel.text = viewModel.beerIBU
        
        isFavoriteBarButton.tintColor = viewModel.isFavorite ? #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        navigationItem.rightBarButtonItem = isFavoriteBarButton
        configureUI()
    }
    
    // MARK: - Selectors
    
    @objc func barButtonCustomPressed() {
        viewModel!.toggleIsFavorite()
        
        delegate?.updateAllBeerVC()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        configureNavigationBar()
        configureIsFavoriteButton()

        
        view.addSubview(beerNameLabel)
        beerNameLabel.anchor(top: view.layoutMarginsGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
        beerNameLabel.setHeight(height: 20)
    }
    
    func configureNavigationBar() {
        title = viewModel?.beerName
    }
    
    func configureIsFavoriteButton() {
        isFavoriteBarButton.target = self
        isFavoriteBarButton.action = #selector(barButtonCustomPressed)
    }

}

// MARK: - DetailBeerViewModelDelegate

extension DetailBeerVC: DetailBeerVMDelegate {
    func updateDetailBeerVC() {
        isFavoriteBarButton.tintColor = viewModel!.isFavorite ? #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
}
