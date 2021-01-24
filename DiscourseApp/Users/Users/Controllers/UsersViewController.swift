//
//  UsersViewController.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 14/1/21.
//

import UIKit

class UsersViewController: UIViewController {
    
    // MARK: - Class Properties
    let viewModel: UserViewModel
    
    // MARK: - Outlets
    lazy var tableView: UITableView = {
        
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate   = self
        tableView.register(UINib(nibName: UsersCell.IDENTIFIER, bundle: nil), forCellReuseIdentifier: UsersCell.IDENTIFIER)
        
        return tableView
    }()
    
    // MARK: - Lifecycle
    init(userViewModel: UserViewModel) {
        self.viewModel = userViewModel
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchUsers()
    }
}

// MARK: - Extension for UITableViewDataSource
extension UsersViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfUsers()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: UsersCell.IDENTIFIER, for: indexPath) as? UsersCell,
           let cellViewModel = self.viewModel.viewModel(index: indexPath.row){
            cell.viewModel = cellViewModel
            return cell
        }
        return UITableViewCell()
    }
}

// MARK: - Extension for UITableViewDelegate
extension UsersViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectUser(index: indexPath.row)
    }
}

// MARK: - Extension for UserViewModelDelegate
extension UsersViewController: UserViewModelDelegate{
    
    func didFetchUsers() {
        tableView.reloadData()
    }
    
    func didFailToFetchUser(error: String) {
        self.showAlert(error, "Error finding users", "OK")
    }
    
}
