//
//  CalendarViewController.swift
//  Login Page
//
//  Created by Zhangzhi Zhou on 8/23/22.
//

import UIKit

class CalendarViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 40, height: 40))
        button.setTitle("+", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        

        view.addSubview(button)
        button.addTarget(self, action: #selector(eventCreation), for: .touchUpInside)
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 200, width: view.frame.size.width, height: view.frame.size.height - 200))
        scrollView.backgroundColor = .white
        view.addSubview(scrollView)
        
        for i in 1...24{
            let lineView = UIView(frame: CGRect(x: 0, y: CGFloat(50 * i), width: view.frame.size.width, height: 1.0))
            lineView.layer.borderWidth = 1.0
            lineView.layer.borderColor = UIColor.black.cgColor
            scrollView.addSubview(lineView)
        }
        
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1200)
        
        let recognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        scrollView.addGestureRecognizer(recognizer)
        
        
        
    }
    @objc func longpressed(){
        eventCreation()
    }
    
    @objc func handleLongPress(sender: UILongPressGestureRecognizer){
        if(sender.state == UIGestureRecognizer.State.began){
            longpressed()
        }
        else if (sender.state == UIGestureRecognizer.State.ended){
            print("shit ended")
        }
    }
    /*func displayAddEventButton(){
        let button = UIButton(frame: CGRect(x: 10, y: view.frame.size.width - 40, width: 40, height: 40))
        
        button.setTitle("+", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        view.addSubview(button)
    }*/
    
    
    
    @objc func eventCreation(){
        
        let vc = EventCreationViewController() //change pages here
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
