//
//  EditProfileVC.swift
//  MySidebar
//
//  Created by Jeremiah Ufot on 10/5/18.
//  Copyright © 2018 Jeremiah Ufot. All rights reserved.
//

import UIKit

class EditProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        //Adds label to the subview and declaration of constraints
        self.view.addSubview(lbl)
        lbl.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        lbl.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        lbl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        lbl.heightAnchor.constraint(equalToConstant: 60).isActive = true

    }
    
    //Create label and set properties
    let lbl: UILabel = {
        let label = UILabel()
        label.text = "Edit Profile"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false //Allows auto alyout to be used with constraints
        return label
    }()
}
