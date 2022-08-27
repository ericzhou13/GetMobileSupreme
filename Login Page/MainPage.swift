//
//  PushViewController.swift
//  Login Page
//
//  Created by Jeffrey Hong on 8/9/22.
//

import UIKit
import FirebaseDatabase

class MainPage: UIViewController {
    private let database = Database.database().reference()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(frame: CGRect(x: 20, y: 200, width: view.frame.size.width - 40, height: 50))
        button.setTitle("Add Entry", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .link
        view.addSubview(button)
        button.addTarget(self, action: #selector(addNewEntry), for: .touchUpInside)
        
        let button1 = UIButton(frame: CGRect(x: 20, y: 300, width: view.frame.size.width - 40, height: 50))
        
        button1.setTitle("Change pages", for: .normal)
        button1.setTitleColor(.white, for: .normal)
        button1.backgroundColor = .link
        
        view.addSubview(button1)
        button1.addTarget(self, action: #selector(newpage), for: .touchUpInside)
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc private func addNewEntry(){
        let object: [String: Any] = [
            "Skyler White": "Marie Schrader" as NSObject,
            "Walter White": "Jesse Pinkman"
        ]
        database.child("Breaking Bad_\(Int.random(in: 0..<100))").setValue(object)
    }
    @objc private func newpage(){
        let vc = CalendarViewController()
        self.navigationController?.pushViewController(vc, animated: true)
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
