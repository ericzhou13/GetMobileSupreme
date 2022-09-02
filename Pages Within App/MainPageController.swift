//
//  PushViewController.swift
//  Login Page
//
//  Created by Jeffrey Hong on 8/9/22.
//

import UIKit

class MainPageController: UIViewController {
    //variables
    var bigRed = UIImageView()
    var profileImage = UIImage(named: "bric-modified")
    var profileButton = UIButton()
    var payButton = UIButton()
    var fundsButton = UIButton()
    var accountBalance = UILabel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "Funds"
        //Variable Specifications
        bigRed.image = UIImage(named: "bigred")
        bigRed.contentMode = .scaleAspectFill
        bigRed.clipsToBounds = true
        bigRed.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bigRed)
        
        payButton.setTitle("Pay", for: .normal)
        payButton.setTitleColor(.red, for: .normal)
        payButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        payButton.backgroundColor = UIColor(red: 0.961, green: 0.259, blue: 0.376, alpha: 0.5)
        payButton.layer.borderWidth = 5
        payButton.layer.borderColor = UIColor.red.cgColor
        payButton.layer.cornerRadius = 10
        payButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(payButton)
        payButton.addTarget(self, action: #selector(Pay), for: .touchUpInside)
        
        fundsButton.setTitle("Transactions", for: .normal)
        fundsButton.setTitleColor(.red, for: .normal)
        fundsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22.5)
        fundsButton.backgroundColor = UIColor(red: 0.961, green: 0.259, blue: 0.376, alpha: 0.5)
        fundsButton.layer.borderWidth = 5
        fundsButton.layer.borderColor = UIColor.red.cgColor
        fundsButton.layer.cornerRadius = 10
        fundsButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fundsButton)
        fundsButton.addTarget(self, action: #selector(addMoney), for: .touchUpInside)
        
        accountBalance.text = "$10"
        accountBalance.textColor = .red
        accountBalance.font = .systemFont(ofSize: 80, weight: .bold)
        accountBalance.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(accountBalance)
        setupConstraints()
    }
    //Variable Constraints
    func setupConstraints() {
        NSLayoutConstraint.activate([
            bigRed.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            bigRed.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bigRed.widthAnchor.constraint(equalToConstant: 350),
            bigRed.heightAnchor.constraint(equalToConstant: 375)
        ])
        NSLayoutConstraint.activate([
            payButton.topAnchor.constraint(equalTo: bigRed.bottomAnchor, constant: 50),
            payButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            payButton.widthAnchor.constraint(equalToConstant: 150),
            payButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        NSLayoutConstraint.activate([
            fundsButton.topAnchor.constraint(equalTo: payButton.bottomAnchor, constant: 25),
            fundsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fundsButton.widthAnchor.constraint(equalToConstant: 150),
            fundsButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            accountBalance.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            accountBalance.centerYAnchor.constraint(equalTo: bigRed.centerYAnchor, constant: 20)
        ])
    }
    @objc func Pay() {
        let vc = PayViewController()
        present(vc, animated: true, completion: nil)
    }
    @objc func addMoney() {
        let VC = TransactionsViewController()
        self.navigationController?.pushViewController(VC, animated: true)
    }
}

