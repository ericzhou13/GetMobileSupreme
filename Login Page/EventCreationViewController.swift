//
//  EventCreationViewController.swift
//  Login Page
//
//  Created by Zhangzhi Zhou on 8/24/22.
//

import UIKit

class EventCreationViewController: UIViewController {
    @IBOutlet var Name: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        
        let Text1 = UITextField(frame: CGRect(x: 150, y: 300, width: 100, height: 20))
        Text1.text = "Input"
        Text1.font = .systemFont(ofSize: 20)
        
        view.addSubview(Text1)
        // Do any additional setup after loading the view.
    }
    
    @objc func StoreValues(){
        
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
