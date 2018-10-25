//
//  ViewController.swift
//  OkBox
//
//  Created by Ivan Aldama on 20/10/18.
//  Copyright © 2018 Ivan Aldama. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuthUI
import FirebaseGoogleAuthUI
import FirebaseFacebookAuthUI
import FBSDKCoreKit
import FBSDKLoginKit


class LogginPageView: UIViewController, UITextFieldDelegate , FUIAuthDelegate , FBSDKLoginButtonDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Init Logging Page")
        view.backgroundColor = UIColor(r: 247, g: 247, b: 242)
        self.navigationController?.isNavigationBarHidden = true
        setupViews()
        setUpListeners()
        setUpLogin()
        checkIfLoggedAlready()
    }
    
    func checkIfLoggedAlready(){
        if Auth.auth().currentUser != nil && FBSDKAccessToken.current() != nil{
            self.dismiss(animated: true, completion: nil)
        }
    }

    
    @objc func handleRegister(){
                if let email = emailTextField.text, let password = passwordTextField.text {
                    print(email)
                    Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                        print(user?.email ?? "no email")
                        print(Auth.auth().currentUser?.uid ?? "no userid")
                    }
                }
    }
    
    @objc func handleLogin(){

        print("Logginnnnn...")
        if !(emailTextField.text?.isEmpty)! && !(passwordTextField.text?.isEmpty)! {
            print(Auth.auth().currentUser?.email)
            if Auth.auth().currentUser == nil{
                if let email = emailTextField.text, let password = passwordTextField.text {
                    print(email)
                    Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                        if error == nil {
                            
                            
                        }
                    }
                }
            }else {
                print("already Logged")
                self.dismiss(animated: true, completion: nil)
            }
        }

    }
    
    func setUpLogin() {
        
        authUI = FUIAuth.defaultAuthUI()
        authUI?.delegate = self
        let providers : [FUIAuthProvider] = [FUIGoogleAuth(), FUIFacebookAuth()]
        authUI?.providers = providers
        authUI?.isSignInWithEmailHidden = true
        authUI?.authViewController().view.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        authUI?.authViewController().view.backgroundColor = .clear
        fbButton.delegate = self
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if error == nil {
            loginBotton.setTitle("Logout", for: .normal)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil{
            print("\("log error facebook: ") \(error)")
            return
        }
        self.dismiss(animated: true, completion: nil)
        print("Logged with FB")
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("FB Logout")
    }
    
    func setupViews(){
//add views
        view.addSubview(inputContainerView)
        view.addSubview(imageIcon)
        view.addSubview(registerButton)
        view.addSubview(companyName)
        view.addSubview(loginBotton)
        view.addSubview(fbButton)
        view.addSubview(optionalLogin)
        inputContainerView.addSubview(emailTextField)
        inputContainerView.addSubview(passwordTextField)
       
        
//setup constraints
        inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
//Email Field
        emailTextField.topAnchor.constraint(equalTo: inputContainerView.topAnchor , constant: 16).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3).isActive = true
        emailTextField.setLeftPaddin(padding: 8)
        emailTextField.setBottonBorder(color: UIColor.gray)
        
//PasswordField
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor , constant: 16).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3).isActive = true
        passwordTextField.setLeftPaddin(padding: 8)
        passwordTextField.setBottonBorder(color: UIColor.gray)
        
//RegisterButton
        registerButton.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 16  ).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        registerButton.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor , multiplier: 2/5).isActive = true
        registerButton.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 16).isActive = true
        registerButton.layer.shadowOffset = CGSize.zero
        registerButton.layer.cornerRadius = 16
        
//LoginBotton
        loginBotton.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 16  ).isActive = true
        loginBotton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginBotton.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor , multiplier: 2/5).isActive = true
        loginBotton.rightAnchor.constraint(equalTo: inputContainerView.rightAnchor, constant: -16).isActive = true
        loginBotton.layer.shadowOffset = CGSize.zero
        loginBotton.layer.cornerRadius = 16
        
//Imagen Logo
        imageIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -(view.bounds.height/3)).isActive = true
        imageIcon.widthAnchor.constraint(equalToConstant: view.bounds.width/3).isActive = true
        imageIcon.heightAnchor.constraint(equalToConstant: view.bounds.width/3).isActive = true
        imageIcon.layer.cornerRadius = ((view.bounds.width/3)/2)
        imageIcon.clipsToBounds = true
        imageIcon.layer.borderWidth = 4
        imageIcon.layer.borderColor = UIColor.gray.cgColor
//CompanyName
        companyName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        companyName.centerYAnchor.constraint(equalTo: imageIcon.bottomAnchor , constant: 32).isActive = true
        
        
        optionalLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        optionalLogin.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: -((view.frame.width/3))).isActive = true
        fbButton.translatesAutoresizingMaskIntoConstraints = false
        fbButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        fbButton.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: -(fbButton.frame.width/2) + 16).isActive = true
    } //End setUpViews()
    
    func setUpListeners(){
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.setBottonBorder(color: UIColor(r: 130, g: 48, b: 56))
    }

//Some variables
    var authUI : FUIAuth?
    
    let fbButton = FBSDKLoginButton()
    
    
    let inputContainerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        return view
    }()
    
    let emailTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email:"
        textField.translatesAutoresizingMaskIntoConstraints = false
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
        
        button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        return button
    }()
    
    let loginBotton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 17, g: 21, b: 21)
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.borderWidth = 2.5
        button.layer.borderColor = UIColor(r: 130, g: 48, b: 56).cgColor
        button.setTitleColor(UIColor(r: 238, g: 238, b: 238), for: UIControlState.normal)
        
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
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
        textField.isUserInteractionEnabled = false
        return textField
    }()
    
    let optionalLogin : UITextField = {
        let textField = UITextField()
        textField.placeholder = "- OR -"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        return textField
    }()
}

