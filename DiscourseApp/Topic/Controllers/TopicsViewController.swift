//
//  TopicViewController.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 14/1/21.
//

import UIKit

class TopicsViewController: UIViewController {

    
    // MARK: - Class Properties
    let viewModel: TopicsViewModel
    
    
    // MARK: - Outlets
    lazy var tableView: UITableView = {
        
        let tableView = UITableView()
        tableView.dataSource         = self
        tableView.delegate           = self
        tableView.register(UINib(nibName: TopicCell.identifier, bundle: nil), forCellReuseIdentifier: TopicCell.identifier)
        return tableView
    }()
    
    
    // MARK: - Lifecycle
    init(with topicViewModel: TopicsViewModel){
        self.viewModel = topicViewModel
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
     
        viewModel.viewWasLoad()
    }
    
    
}



// MARK: - Extension for UITableViewDataSource
extension TopicsViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TopicCell.identifier, for: indexPath) as? TopicCell else { return UITableViewCell()}
        
        cell.configure(topic: viewModel.topics[indexPath.row])
        
        return cell
        
    }
    
}

// MARK: - Extension for UITableViewDelegate
extension TopicsViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectATopic()
    }
}


// MARK: - Extension for TopicsViewDezlegate
extension TopicsViewController: TopicsViewDelegate{
    func topicsFetched() {
        tableView.reloadData()
    }
}
