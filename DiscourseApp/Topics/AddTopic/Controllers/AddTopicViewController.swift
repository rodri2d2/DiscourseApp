//
//  AddTopicViewController.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 19/1/21.
//

import UIKit

class AddTopicViewController: UIViewController {
    
    
    // MARK: - Class Properties
    private let viewModel: AddTopicViewModel
    
    // MARK: - Outlets
    @IBOutlet weak var newTopicTextField: UITextField!
    @IBOutlet weak var topicRawText: UITextView!
    
    
    // MARK: - Lyfecycle
    init(viewModel: AddTopicViewModel) {
        
        self.viewModel = viewModel
        
        super.init(nibName: "AddTopicView", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextView()
    }
    
    override func loadView() {
        super.loadView()
        
        let rightBarButtonItem: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "multiply"), style: .plain, target: self, action: #selector(cancelButtonTapped))
        rightBarButtonItem.tintColor = .black
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    // MARK: - Actions
    @objc func cancelButtonTapped(){
        viewModel.coordinatorDelegate?.didCancel()
    }
    
    @IBAction func didSubmit(_ sender: UIButton) {

        guard let title = newTopicTextField.text else { return }
        guard let raw   = topicRawText.text else { return }
        
        if !title.isEmpty && !raw.isEmpty{
            viewModel.createNewTopic(title: title, raw: raw)
        }
    }
    
    // MARK: - Class Functionalities
    private func setupTextView(){
        
        topicRawText.text = "Enter you topic description..."
        topicRawText.textColor = .systemGray
        topicRawText.delegate = self
    }
    
}
// MARK: - Extension for UITextViewDelegate
extension AddTopicViewController: UITextViewDelegate{
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.systemGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
}

// MARK: - Extension for AddNewTopicViewModelDelegate
extension AddTopicViewController: AddNewTopicViewModelDelegate{
    func didCreateNewTopic() {
        self.showAlert("New topic created successfully", "New Topic", "OK")
        self.viewModel.coordinatorDelegate?.didsuccessfullyAdd()
    }
    
    func didFailToCreateTopic(error: String) {
        self.showAlert(error, "Error creating Topic", "OK")
    }
}
