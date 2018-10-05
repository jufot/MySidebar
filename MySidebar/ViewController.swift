//
//  ViewController.swift
//  MySidebar
//
//  Created by Jeremiah Ufot on 10/4/18.
//  Copyright © 2018 Jeremiah Ufot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var sideBarView: SidebarView!
    var blackScreen: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Title of Navigation Bar
        self.title = "Home"
        
        //Menu Button declaration
        let btnMenu = UIBarButtonItem(image: UIImage(named: "menu.jpeg"), style: .plain, target: self, action: #selector(btnMenuAction))
        btnMenu.tintColor = #colorLiteral(red: 0.2117647059, green: 0.2156862745, blue: 0.2196078431, alpha: 1)
        self.navigationItem.leftBarButtonItem = btnMenu
        
        //Side Bar declaration and addition to the navigation controller
        sideBarView = SidebarView(frame: CGRect(x: 0, y: 0, width: 0, height: self.view.frame.height))
        sideBarView.delegate = self as! SidebarViewDelegate
        sideBarView.layer.zPosition = 100
        self.view.isUserInteractionEnabled = true
        self.navigationController?.view.addSubview(sideBarView)
        
        //Black Screen covers the all the screen and addition to the navigation controller
        blackScreen = UIView(frame: self.view.bounds)
        blackScreen.backgroundColor = UIColor(white: 0, alpha: 0.5)
        blackScreen.isHidden = true
        self.navigationController?.view.addSubview(blackScreen)
        blackScreen.layer.zPosition = 99
        let tapGestRecognizer = UITapGestureRecognizer(target: self, action: #selector(blackScreenTapAction(sender:)))
        blackScreen.addGestureRecognizer(tapGestRecognizer)
    }
    
    //When the Button is pressed and the action it performs: sidebar appears and expands
    @objc func btnMenuAction() {
        blackScreen.isHidden = false
        UIView.animate(withDuration: 0.3, animations: {
            self.sideBarView.frame = CGRect(x: 0, y: 0, width: 250, height: self.sideBarView.frame.height)
            }) { (complete) in
                self.blackScreen.frame = CGRect(x: self.sideBarView.frame.width, y: 0, width: self.view.frame.width-self.sideBarView.frame.width, height: self.view.bounds.height+100)
        }
    }
    
    //When the black screen is tapped; it will hide itself
    @objc func blackScreenTapAction(sender: UITapGestureRecognizer) {
        blackScreen.isHidden = true
        blackScreen.frame = self.view.bounds
        UIView.animate(withDuration: 0.3) {
            self.sideBarView.frame = CGRect(x: 0, y: 0, width: 0, height: self.sideBarView.frame.height)
        }
    }
    
}
    
//Whenever the an item in the Side Bar is tapped, notify the view controller to perform an action, and triggers Edit Profile
extension ViewController: SidebarViewDelegate {
    func sidebarDidSelectRow(row: Row) {
        blackScreen.isHidden = true
        blackScreen.frame = self.view.bounds
        UIView.animate(withDuration: 0.3) {
            self.sideBarView.frame = CGRect(x: 0, y: 0, width: 0, height: self.sideBarView.frame.height)
        }
        switch row {
        case .editProfile:
            let vc = EditProfileVC()
            self.navigationController?.pushViewController(vc, animated: true) //We push the view controller to the navigation controller
        case .messages:
            print("Messages")
        case .contact:
            print("Contact")
        case .settings:
            print("Settings")
        case .history:
            print("History")
        case .help:
            print("Help")
        case .signOut:
            print("Sign Out")
        case .none:
            break
//      default: Default will never be executed
//          break
        }
    }
}
    
    
    
    


