//
//  ViewController.swift
//  OkBox
//
//  Created by Ivan Aldama on 20/10/18.
//  Copyright © 2018 Ivan Aldama. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(r: 247, g: 247, b: 242)
        setupViews()
        setUpListeners()
    }
    
    
    let inputContainerView : UIView = {
        let view = UIView()
//        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        return view
    }()
    
//    let inputTextField : UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "User:"
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        return textField
//    }()
    
    let emailTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email:"
        textField.translatesAutoresizingMaskIntoConstraints = false
//        textField.layer.backgroundColor = UIColor.yellow.cgColor
        textField.textColor = UIColor(r: 27, g: 32, b: 33)
        textField.leftViewMode = UITextFieldViewMode.always
        textField.layer.backgroundColor = UIColor(r: 247, g: 247, b: 242).cgColor
        return textField
    }()
    
    let passwordTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password:"
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.backgroundColor = UIColor(r: 247, g: 247, b: 242).cgColor
        return textField
    }()
    
    let registerButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 17, g: 21, b: 21)
        button.setTitle("Register", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.borderWidth = 2.5
        button.layer.borderColor = UIColor(r: 130, g: 48, b: 56).cgColor
        button.setTitleColor(UIColor(r: 238, g: 238, b: 238), for: UIControlState.normal)
        
        button.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
        return button
    }()
    
    let imageIcon : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "RoundOneLogo.png")
        image.image = image.image?.withRenderingMode(.alwaysOriginal)
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isUserInteractionEnabled = true
        return image
    }()
    
    let companyName : UITextField = {
        let textField = UITextField()
        textField.placeholder = "ROUND-ONE BOX & FITNESS"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        return textField
    }()
    
    @objc func handleLoginRegister(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupViews(){
//add views
        view.addSubview(inputContainerView)
        //inputContainerView.addSubview(inputTextField)
        inputContainerView.addSubview(emailTextField)
        inputContainerView.addSubview(passwordTextField)
        view.addSubview(imageIcon)
        view.addSubview(registerButton)
        view.addSubview(companyName)
       
        
//setup constraints
        inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        //        inputTextField.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
        //        inputTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        //        inputTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        //        inputTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
//Email Field
        emailTextField.topAnchor.constraint(equalTo: inputContainerView.topAnchor , constant: 16).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        //emailTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3).isActive = true
        emailTextField.setLeftPaddin(padding: 8)
        emailTextField.setBottonBorder(color: UIColor.gray)
        
//PasswordField
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor , constant: 16).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        //passwordTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
                passwordTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3).isActive = true
        passwordTextField.setLeftPaddin(padding: 8)
        passwordTextField.setBottonBorder(color: UIColor.gray)
        
//RegisterButton
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 15  ).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        registerButton.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        registerButton.layer.shadowOffset = CGSize.zero
        registerButton.layer.cornerRadius = 16
        
//Imagen Logo
        imageIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -(view.bounds.height/3)).isActive = true
        imageIcon.widthAnchor.constraint(equalToConstant: view.bounds.width/3).isActive = true
        imageIcon.heightAnchor.constraint(equalToConstant: view.bounds.width/3).isActive = true
        //        imageIcon.widthAnchor.constraint(equalToConstant: 80).isActive = true
        //        imageIcon.heightAnchor.constraint(equalToConstant: 80).isActive = true
        //        imageIcon.layer.cornerRadius = 50
        imageIcon.layer.cornerRadius = ((view.bounds.width/3)/2)
        imageIcon.clipsToBounds = true
        imageIcon.layer.borderWidth = 4
        imageIcon.layer.borderColor = UIColor.gray.cgColor
//CompanyName
        companyName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        companyName.centerYAnchor.constraint(equalTo: imageIcon.bottomAnchor , constant: 32).isActive = true
        

    } //End setUpViews()
    
    func setUpListeners(){
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.setBottonBorder(color: UIColor(r: 130, g: 48, b: 56))
    }
    

}

