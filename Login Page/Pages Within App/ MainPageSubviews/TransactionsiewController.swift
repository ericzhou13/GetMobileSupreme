//
//  AddMoneyViewController.swift
//  Login Page
//
//  Created by Jeffrey Hong on 8/21/22.
//

import UIKit

class TransactionsViewController: UIViewController {
    let backbutton = UIBarButtonItem(
        title: "",
        style: UIBarButtonItem.Style.plain,
        target: nil,
            action: nil
    );
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backbutton;
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
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
