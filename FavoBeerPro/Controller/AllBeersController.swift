//
//  AllBeersController.swift
//  FavoBeerPro
//
//  Created by Vladislav on 15.08.2021.
//

import UIKit

class AllBeersController: UIViewController {
    
    // MARK: - Properties
    
    private let viewModel = AllBeersViewModel()
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
        tableView.register(AllBeersCell.self, forCellReuseIdentifier: AllBeersCell.reuseIdentifier)
        tableView.rowHeight = 70
        
        view.addSubview(tableView)
        tableView.frame = view.frame
    }
    
}

// MARK: - UITableViewDataSource

extension AllBeersController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AllBeersCell.reuseIdentifier, for: indexPath) as! AllBeersCell
        
        let beer = viewModel.beers[indexPath.row]
        cell.beer = beer
        
        cell.delegate = self
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension AllBeersController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        navigationController?.pushViewController(DetailsOfBeerController(), animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = viewModel.beers.count - 1
        
        if indexPath.row == lastItem {
            viewModel.fetchData()
        }
    }
}

//MARK: - UpdateAllBeersTableDelegate

extension AllBeersController: UpdateAllBeersTableDelegate {
    func updateView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
