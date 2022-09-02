//
//  SettingsViewController.swift
//  Login Page
//
//  Created by Jeffrey Hong on 8/23/22.
//

import UIKit

class SettingsViewController: UIViewController {
    //Remove BackButton
    let backbutton = UIBarButtonItem(
        title: "",
        style: UIBarButtonItem.Style.plain,
        target: nil,
            action: nil
    );
    //Variables
    var tableView = UITableView()
    var settingOptions: [Settings] = []
    let reuseIdentifier = "settingsCellReuse"
    let cellHeight: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backbutton;
        view.backgroundColor = .white
        title = "Settings"
        //Options
        let account = Settings(option: "account")
        let balance = Settings(option: "balance")
        let report = Settings(option: "report an issue")
        let logOut = Settings(option: "log out")
        settingOptions = [account,balance,report,logOut]
        //tableView Setup
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        setupConstraints()
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
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

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingOptions.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? SettingsTableViewCell {
            let settings = settingOptions[indexPath.row]
            cell.configure(settings: settings)
            return cell
        } else {
            return UITableViewCell()
        }
        // whichever row the cell is in
    }
    
}


extension SettingsViewController: UITableViewDelegate {
    
}
