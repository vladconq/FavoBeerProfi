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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.delegate = self
        viewModel.loadData()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        configureTableView()
        configureNavigationBar()
    }
    
    func configureNavigationBar() {
        title = "Favorite"
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FavoriteBeerCellView.self, forCellReuseIdentifier: FavoriteBeerCellView.reuseIdentifier)
        tableView.rowHeight = 60
        
        view.addSubview(tableView)
        tableView.frame = view.frame
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
