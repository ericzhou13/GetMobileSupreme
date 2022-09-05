//
//  NavigationBarController.swift
//  Login Page
//
//  Created by Jeffrey Hong on 8/12/22.
//

import UIKit

class NavigationBarController: UITabBarController {
    //set up Navigation Bar
    var calendar: CalendarViewController?
    var restaurants: RestaurantsViewController?
    var main: MainPageController?
    var social: SocialViewController?
    var subviewControllers: [UIViewController] = []
    let profileImage = UIImage(named: "bric-modified")
    let profileButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.tabBar.backgroundColor = .white
        profileButton.setImage(profileImage, for: .normal)
        profileButton.layer.borderWidth = 2
        profileButton.layer.borderColor = UIColor.systemPink.cgColor
        profileButton.layer.cornerRadius = 17
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.addTarget(self, action: #selector(Settings), for: .touchUpInside)
        profileButton.sizeToFit()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileButton)
        setupConstraints()
        
        calendar = CalendarViewController()
        restaurants = RestaurantsViewController()
        main = MainPageController()
        social = SocialViewController()
        
        //Create subviews
        subviewControllers.append(calendar!)
        subviewControllers.append(restaurants!)
        subviewControllers.append(main!)
        subviewControllers.append(social!)
        
        //Create Navigation Bar
        calendar?.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "calendarIcon"), selectedImage: UIImage(named: "calendarIcon"))
        calendar?.tabBarItem.tag = 0
        restaurants?.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "restaurantIcon"), selectedImage: UIImage(named: "restaurantIcon"))
        restaurants?.tabBarItem.tag = 1
        main?.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "fundIcon"), selectedImage: UIImage(named: "fundIcon"))
        main?.tabBarItem.tag = 2
        social?.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "socialIcon"), selectedImage: UIImage(named: "socialIcon"))
        social?.tabBarItem.tag = 3
        
        self.setViewControllers(subviewControllers, animated: true)
        self.selectedIndex = 2
        self.selectedViewController = main
        // Do any additional setup after loading the view.
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 0:
            self.tabBar.tintColor = .systemPink
            self.navigationItem.title = "Calendar"
        case 1:
            self.tabBar.tintColor = .systemPink
            self.navigationItem.title = "Restaurants"
        case 2:
            self.tabBar.tintColor = .systemPink
            self.navigationItem.title = "GetMobile Supreme"
        case 3:
            self.tabBar.tintColor = .systemPink
            self.navigationItem.title = "Study Groups"
        default:
            print("bruh")
            self.tabBar.tintColor = .systemPink
            self.navigationItem.title = "GetMobile Supreme"
        }
    }
    @objc func Settings() {
        let viewC = SettingsViewController()
        self.navigationController?.pushViewController(viewC, animated: true)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            profileButton.widthAnchor.constraint(equalToConstant: 34),
            profileButton.heightAnchor.constraint(equalToConstant: 34)
        ])
    }
}
