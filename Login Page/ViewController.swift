//
//  ViewController.swift
//  Login Page
//
//  Created by Jeffrey Hong on 7/21/22.
//

import UIKit
import Firebase
class ViewController: UIViewController {
    //Variables
    var welcome = UILabel()
    var cornellLogo = UIImageView()
    var textBubble = UIImageView()
    var textBubble2 = UIImageView()
    var username = UILabel()
    var password = UILabel()
    var usernameText = UITextField()
    var passwordText = UITextField()
    var loginButton = UIButton()
    var loggedIn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //Variable Specifications
        welcome.text = "Welcome"
        welcome.textColor = .red
        welcome.font = .systemFont(ofSize: 75, weight: .bold)
        welcome.translatesAutoresizingMaskIntoConstraints = false
        //purpose of ^^code line is so XCode does not use wtheir preferred display
        view.addSubview(welcome)
        
        cornellLogo.image = UIImage(named: "Big Red")
        cornellLogo.contentMode = .scaleAspectFill
        cornellLogo.clipsToBounds = true
        cornellLogo.layer.cornerRadius = 5
        cornellLogo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cornellLogo)
        
        textBubble.image = UIImage(named: "text bubble")
        textBubble.contentMode = .scaleAspectFill
        textBubble.clipsToBounds = true
        textBubble.layer.cornerRadius = 5
        textBubble.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textBubble)
        
        textBubble2.image = UIImage(named: "text bubble")
        textBubble2.contentMode = .scaleAspectFill
        textBubble2.clipsToBounds = true
        textBubble2.layer.cornerRadius = 5
        textBubble2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textBubble2)
        
        username.text = "Username"
        username.textColor = .red
        username.font = .systemFont(ofSize: 30, weight: .bold)
        username.translatesAutoresizingMaskIntoConstraints = false
        //purpose of ^^code line is so XCode does not use wtheir preferred display
        view.addSubview(username)
        
        password.text = "Password"
        password.textColor = .red
        password.font = .systemFont(ofSize: 30, weight: .bold)
        password.translatesAutoresizingMaskIntoConstraints = false
        //purpose of ^^code line is so XCode does not use wtheir preferred display
        view.addSubview(password)
        
        usernameText.font = .systemFont(ofSize: 20, weight: .bold)
        usernameText.textColor = .black
        usernameText.contentMode = .scaleAspectFill
        usernameText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameText)
        
        passwordText.font = .systemFont(ofSize: 20, weight: .bold)
        passwordText.textColor = .black
        passwordText.contentMode = .scaleAspectFill
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordText)
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.red, for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        loginButton.backgroundColor = UIColor(red: 0.961, green: 0.259, blue: 0.376, alpha: 0.5)
        loginButton.layer.borderWidth = 5
        loginButton.layer.borderColor = UIColor.red.cgColor
        loginButton.layer.cornerRadius = 10
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        loginButton.addTarget(self, action: #selector(Login), for: .touchUpInside)
        setupConstraints()
        
        
    }
    //Variable Constraints
    func setupConstraints() {
        NSLayoutConstraint.activate([
            welcome.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            welcome.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            cornellLogo.topAnchor.constraint(equalTo: welcome.bottomAnchor, constant: 40),
            cornellLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cornellLogo.widthAnchor.constraint(equalToConstant: 200),
            cornellLogo.heightAnchor.constraint(equalToConstant: 200)
        ])
        NSLayoutConstraint.activate([
            textBubble.topAnchor.constraint(equalTo: cornellLogo.bottomAnchor, constant: 40),
            textBubble.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textBubble.widthAnchor.constraint(equalToConstant: 300),
            textBubble.heightAnchor.constraint(equalToConstant: 60),
                ])
        NSLayoutConstraint.activate([
            textBubble2.topAnchor.constraint(equalTo: textBubble.bottomAnchor, constant: 40),
            textBubble2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textBubble2.widthAnchor.constraint(equalToConstant: 300),
            textBubble2.heightAnchor.constraint(equalToConstant: 60),
                ])
        NSLayoutConstraint.activate([
            username.bottomAnchor.constraint(equalTo: textBubble.topAnchor, constant: 10),
            username.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            password.bottomAnchor.constraint(equalTo: textBubble2.topAnchor, constant: 10),
            password.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            usernameText.centerYAnchor.constraint(equalTo: textBubble.centerYAnchor, constant: 0),
            usernameText.centerXAnchor.constraint(equalTo: textBubble.centerXAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            passwordText.centerYAnchor.constraint(equalTo: textBubble2.centerYAnchor, constant: 0),
            passwordText.centerXAnchor.constraint(equalTo: textBubble2.centerXAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: textBubble2.bottomAnchor, constant: 45),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 100),
            loginButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
    }
    @objc func Login() {
        let email: String = usernameText.text!
        let password: String = passwordText.text!
        Auth.auth().signIn(withEmail: email, password: password){result, error in
            if error != nil{
                print(error!.localizedDescription)
                self.loginButton.setTitle("Failed", for: .normal)
                self.loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
            }
            else{
                print("Passed")
                let vc = MainPage() //change pages here
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        }
    }

}

