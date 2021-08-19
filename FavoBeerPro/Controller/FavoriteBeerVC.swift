//
//  FavoritesBeerController.swift
//  FavoBeerPro
//
//  Created by Vladislav on 15.08.2021.
//

import UIKit

class FavoriteBeerVC: UIViewController {
    
    // MARK: - Properties
    
    private let viewModel = FavoriteBeerVM()
    
    private let tableView = UITableView()
    
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: BeerDetail.allCases.map({$0.description}))
        segmentedControl.addTarget(self, action: #selector(handleSegmentPressed), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.delegate = self
        viewModel.loadData()
        viewModel.updateFavoriteArray()
    }
    
    // MARK: - Selectors
    
    @objc func handleSegmentPressed(_ segmentedControl: UISegmentedControl) {
        switch BeerDetail(rawValue: segmentedControl.selectedSegmentIndex) {
        case .name:
            print("changed")
            viewModel.updateFavoriteArray(sortBy: BeerDetail.name)
        case .abv:
            print("changed")
            viewModel.updateFavoriteArray(sortBy: BeerDetail.abv)
        case .ebc:
            print("changed")
            viewModel.updateFavoriteArray(sortBy: BeerDetail.ebc)
        case .ibu:
            print("changed")
            viewModel.updateFavoriteArray(sortBy: BeerDetail.ibu)
        default:
            print("-")
        }
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        configureNavigationBar()
        configureSegmentedControl()
        configureTableView()
    }
    
    func configureNavigationBar() {
        title = "Favorite"
    }
    
    func configureSegmentedControl() {
        view.addSubview(segmentedControl)
        segmentedControl.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor,
                                paddingTop: 10, paddingLeft: 10, paddingRight: 10)
        segmentedControl.setHeight(height: 35)
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FavoriteBeerCellView.self, forCellReuseIdentifier: FavoriteBeerCellView.reuseIdentifier)
        tableView.rowHeight = 60
        
        view.addSubview(tableView)
        tableView.anchor(top: segmentedControl.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: view.bottomAnchor)
    }
    
}

extension FavoriteBeerVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.favoriteBeers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteBeerCellView.reuseIdentifier, for: indexPath) as! FavoriteBeerCellView
        
        let favoriteBeerCellVM = viewModel.getFavoriteBeerCellVM(forIndexPath: indexPath)
        cell.viewModel = favoriteBeerCellVM!
        
        return cell
    }
    
}

extension FavoriteBeerVC: FavoriteBeerVMDelegate {
    func updateFavoriteBeerVC() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
