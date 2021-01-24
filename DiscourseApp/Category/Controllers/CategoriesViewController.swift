//
//  CategoriesViewController.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 14/1/21.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    // MARK: - Class Properties
    var viewModel: CategoryViewModel
    
    // MARK: - Outlets
    lazy var tableView: UITableView = {
        
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate   = self
        tableView.register(UINib(nibName: CategoryCell.IDENTIFIER, bundle: nil), forCellReuseIdentifier: CategoryCell.IDENTIFIER)
        
        return tableView
    }()
    
    
    // MARK: - Lifecycle
    init(viewModel: CategoryViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view.addSubview(tableView)
        tableView.pin(to: self.view)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchCategories()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
}

// MARK: - Extension for UITableViewDataSource
extension CategoriesViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.IDENTIFIER, for: indexPath) as? CategoryCell else {return UITableViewCell()}
        let category = viewModel.categories[indexPath.row]
        cell.configure(category: category)
        return cell
    }
}

// MARK: - Extension for UITableViewDelegate
extension CategoriesViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


// MARK: - Extension for CategoryViewModelDelegate
extension CategoriesViewController: CategoryViewModelDelegate{
    func didFetchCategories() {
        tableView.reloadData()
    }
    
    func didFailToFetchCategories(error: String) {
        self.showAlert(error, "Problem finding categories", "OK")
    }
}
