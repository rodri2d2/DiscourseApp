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

    @IBOutlet weak var topicIdLabel: UILabel!
    @IBOutlet weak var topicTitleLabel: UILabel!
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


        let leftBarButtonItem: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        leftBarButtonItem.tintColor = .systemBlue
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {

        topicDetailViewModel.loadDetail()


    }

    @objc func backButtonTapped() {
        topicDetailViewModel.didPressBackButton()
    }
    
    
    @IBAction func didPressDelete(_ sender: UIButton) {
        
        if let id = Int(topicIdLabel.text!){
            topicDetailViewModel.didPressDeleteButton(id: id)
        }
        
    }
    

}

extension TopicDetailViewController: TopicDetailViewDelegate{

    
    func didFetchTopic() {

        self.topicIdLabel.text    = topicDetailViewModel.detailId
        self.topicTitleLabel.text = topicDetailViewModel.detailTitle
        if let deletable = topicDetailViewModel.isDeletable{
            self.deleteTopicButton.setTitleColor(.red, for: .normal)
            self.deleteTopicButton.isEnabled = deletable
        }

    }
    
    func didDeleteTopic() {
        topicDetailViewModel.detailCoordinator?.didPressBacButton()
    }
}


