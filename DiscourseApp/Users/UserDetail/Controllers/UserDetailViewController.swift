//
//  UserDetailViewController.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 22/1/21.
//

import UIKit

class UserDetailViewController: UIViewController {

    // MARK: - Class properties
    var viewModel:  UserDetailViewModel
    var isEditable: Bool? {
        didSet{
            setupUI()
        }
    }
    
    
    // MARK: - OutLets
    lazy var userNameLabel:     UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var userNameTextField: UITextField = {
       let textField = UITextField()
       
        return textField
    }()
    
    @IBOutlet weak var userIdLabel:   UILabel!
    @IBOutlet weak var userNickLabel: UILabel!
    @IBOutlet weak var middleView:    UIView!
    @IBOutlet weak var updateButton:  UIButton!
    
    
    
    
    // MARK: - Lifecycle
    init(viewModel: UserDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "UserDetailView", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadUser()
    }

    // MARK: - Actions
    @IBAction func didPressUpdate(_ sender: UIButton) {
        
        if userNameTextField.isDescendant(of: self.middleView){
            
            if let newName = userNameTextField.text{
                if !newName.isEmpty{
                    let userNick = userNickLabel.text!
                    viewModel.updateUser(userNick: userNick, newName: newName)
                }
            }
        }
        
    }
    
    // MARK: - Constraints for UI Elements
    private func setupTextField(){
                
        self.userNameTextField.text          = self.viewModel.userName
        self.userNameTextField.borderStyle   = .roundedRect
        self.userNameTextField.textAlignment = .center
        self.userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        self.middleView.addSubview(self.userNameTextField)
        
        
        NSLayoutConstraint.activate([
        
            self.userNameTextField.centerXAnchor.constraint(equalTo: self.middleView.centerXAnchor),
            self.userNameTextField.centerYAnchor.constraint(equalTo: self.middleView.centerYAnchor),
            self.userNameTextField.leadingAnchor.constraint(equalTo: self.middleView.leadingAnchor),
            self.userNameTextField.trailingAnchor.constraint(equalTo: self.middleView.trailingAnchor)
        
        ])
        
    }
    
    
    private func setupLabel(){
        
        self.userNameLabel.text = viewModel.userName
        self.userNameLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        self.userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.middleView.addSubview(userNameLabel)
        
        NSLayoutConstraint.activate([
        
            self.userNameLabel.centerXAnchor.constraint(equalTo: self.middleView.centerXAnchor),
            self.userNameLabel.centerYAnchor.constraint(equalTo: self.middleView.centerYAnchor)
        
        ])
        
    }
    
    
    // MARK: - Class functinalities
    private func setupUI(){
        if let editable = isEditable{
            if editable{
                setupUpEditablesElements()
            }else{
                setupNonEditableElements()
            }
        }
    }
    
    private func setupUpEditablesElements(){
        
        self.middleView.backgroundColor = .none
        setupTextField()
        self.updateButton.isEnabled = true
    }
    
    private func setupNonEditableElements(){
        setupLabel()
    }
    
}

extension UserDetailViewController: UserDetailViewModelDelegate{
    
    func didLoadUser() {
        
        self.userIdLabel.text   = viewModel.userId
        self.userNickLabel.text = viewModel.userNick
        self.isEditable         = viewModel.isEditable
        
    }
    
    func didUpdateUser() {
        viewModel.loadUser()
        guard let newName = viewModel.userName else {return}
        self.showAlert(newName, "Name updated successfully", "OK!")
    }
    
    func didFailToUpdateUser(error: String) {
        self.showAlert(error, "Fail to update user, try later!", "OK")
    }
    
    func didFailToLoadUser(error: String) {
        self.showAlert(error, "Oops..Fail to find user, try later!", "OK")
    }
}
