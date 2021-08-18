//
//  AllBeersController.swift
//  FavoBeerPro
//
//  Created by Vladislav on 15.08.2021.
//

import UIKit

class AllBeerVC: UIViewController {
    
    // MARK: - Properties
    
    private let viewModel = AllBeerVM()
    private let tableView = UITableView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        viewModel.delegate = self
        viewModel.fetchData()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        configureNavigationBar()
        configureTableView()
    }
    
    func configureNavigationBar() {
        title = "All beers"
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AllBeerCellView.self, forCellReuseIdentifier: AllBeerCellView.reuseIdentifier)
        tableView.rowHeight = 70
        
        view.addSubview(tableView)
        tableView.frame = view.frame
    }
    
}

// MARK: - UITableViewDataSource

extension AllBeerVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AllBeerCellView.reuseIdentifier, for: indexPath) as! AllBeerCellView
        
        let allBeerCellVM = viewModel.getAllBeerCellVM(forIndexPath: indexPath)
        cell.viewModel = allBeerCellVM
        
        cell.delegate = self
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension AllBeerVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailBeerVC = DetailBeerVC()
        let detailBeerVM = viewModel.getDetailBeerVM(forIndexPath: indexPath)
        detailBeerVC.viewModel = detailBeerVM!
        detailBeerVC.delegate = self
        
        navigationController?.pushViewController(detailBeerVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = viewModel.beers.count - 1
        
        if indexPath.row == lastItem {
            viewModel.fetchData()
        }
    }
}

//MARK: - UpdateAllBeersTableDelegate

extension AllBeerVC: AllBeerVMDelegate {
    func updateAllBeerVC() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
