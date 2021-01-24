//
//  TEST.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 19/1/21.
//

import Foundation


//
//  TopicDetailViewController.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 17/1/21.
//

import UIKit

class TopicDetailViewController: UIViewController {
    
    // MARK: - Class Properties
    let topicDetailViewModel: TopicDetailViewModel
    
    
    // MARK: - Outlets
    @IBOutlet weak var topicIdLabel:      UILabel!
    @IBOutlet weak var topicTitleLabel:   UILabel!
    @IBOutlet weak var topicStatusLabel:  UILabel!
    @IBOutlet weak var deleteTopicButton: UIButton!
    
    // MARK: - Lyfecycle
    init(topicDetailViewModel: TopicDetailViewModel) {
        self.topicDetailViewModel = topicDetailViewModel
        super.init(nibName: "TopicDetailView", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Topic Detail"
        
        let leftBarButtonItem: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        leftBarButtonItem.tintColor = .systemBlue
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        topicDetailViewModel.loadDetail()
    }
    
    // MARK: - Actions
    @objc func backButtonTapped() {
        topicDetailViewModel.didPressBackButton()
    }
    
    @IBAction func didPressDelete(_ sender: UIButton) {
        if let id = Int(topicIdLabel.text!){
            topicDetailViewModel.didPressDeleteButton(id: id)
        }
    }
    
}

// MARK: - Extension for TopicDetailViewDelegate
extension TopicDetailViewController: TopicDetailViewDelegate{
    
    func didFetchTopic() {
        
        self.topicIdLabel.text    = topicDetailViewModel.detailId
        self.topicTitleLabel.text = topicDetailViewModel.detailTitle
        self.deleteTopicButton.isEnabled = false
        self.deleteTopicButton.setTitleColor(.systemGray, for: .disabled)
        
        if topicDetailViewModel.isClosed{
            self.topicStatusLabel.textColor = .systemRed
            self.topicStatusLabel.text = "TOPIC CLOSED"
        }else{
            self.topicStatusLabel.textColor = .systemGreen
            self.topicStatusLabel.text = "TOPIC OPEN"
            
            if topicDetailViewModel.isDeletable {
                self.deleteTopicButton.setTitleColor(.red, for: .normal)
                self.deleteTopicButton.isEnabled = true
            }
        }
        
    }
    
    func didDeleteTopic() {
        topicDetailViewModel.didPressBackButton()
        self.showAlert("Topic successfully deleted", "Deleted", "OK!")
        
    }
    
    
    func didFailToFetchTopic(error: String) {
        self.showAlert(error, "Problem finding topic, try later", "OK")
    }
}


