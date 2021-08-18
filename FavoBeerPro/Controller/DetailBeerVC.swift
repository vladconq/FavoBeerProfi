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
    
    private let tableView = UITableView()
    
    private let isFavoriteBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: "star.fill")
        return button
    }()

    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let viewModel = viewModel else { return }
        
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
        view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        configureNavigationBar()
        configureIsFavoriteButton()
        configureTableView()
    }
    
    func configureNavigationBar() {
        title = viewModel?.beerName
    }
    
    func configureIsFavoriteButton() {
        isFavoriteBarButton.target = self
        isFavoriteBarButton.action = #selector(barButtonCustomPressed)
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DetailBeerCellView.self, forCellReuseIdentifier: DetailBeerCellView.reuseIdentifier)
        tableView.rowHeight = 50
        
        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 50)
        tableView.setHeight(height: 50 * 4)
    }

}

// MARK: - DetailBeerViewModelDelegate

extension DetailBeerVC: DetailBeerVMDelegate {
    func updateDetailBeerVC() {
        isFavoriteBarButton.tintColor = viewModel!.isFavorite ? #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
}

extension DetailBeerVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BeerDetail.allCases.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailBeerCellView.reuseIdentifier, for: indexPath) as! DetailBeerCellView
        let detailBeerCellVM = viewModel!.getDetailBeerCellVM(forIndexPath: indexPath)
        cell.viewModel = detailBeerCellVM
        return cell
    }
    
    
}
