//
//  PayViewController.swift
//  Login Page
//
//  Created by Jeffrey Hong on 8/21/22.
//

import UIKit

class PayViewController: UIViewController {
    //variables
    var background = UIButton()
    var profile = UIImageView()
    var QRCode = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //variable specifications
        background.backgroundColor = .white
        background.layer.borderWidth = 15
        background.layer.borderColor = UIColor.black.cgColor
        background.layer.cornerRadius = 10
        background.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(background)
        
        profile.image = UIImage(named: "bric")
        profile.contentMode = .scaleAspectFill
        profile.clipsToBounds = true
        profile.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profile)
        
        QRCode.image = UIImage(named: "text bubble")
        QRCode.contentMode = .scaleAspectFill
        QRCode.clipsToBounds = true
        QRCode.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(QRCode)
        
        
        
        setupConstraints()
        
        // Do any additional setup after loading the view.
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            background.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            background.widthAnchor.constraint(equalToConstant: 420),
            background.heightAnchor.constraint(equalToConstant: 420)
        ])
        NSLayoutConstraint.activate([
            profile.centerYAnchor.constraint(equalTo: background.centerYAnchor),
            profile.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profile.widthAnchor.constraint(equalToConstant: 400),
            profile.heightAnchor.constraint(equalToConstant: 400)
        ])
        NSLayoutConstraint.activate([
            QRCode.topAnchor.constraint(equalTo: background.bottomAnchor, constant: 50),
            QRCode.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            QRCode.widthAnchor.constraint(equalToConstant: 400),
            QRCode.heightAnchor.constraint(equalToConstant: 200)
        ])
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
