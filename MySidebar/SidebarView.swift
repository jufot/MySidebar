//
//  SidebarView.swift
//  MySidebar
//
//  Created by Jeremiah Ufot on 10/4/18.
//  Copyright © 2018 Jeremiah Ufot. All rights reserved.
//

import UIKit

//Protocol: the rules/contract for the delegate
protocol SidebarViewDelegate: class {
    func sidebarDidSelectRow(row: Row)
}

//Replaces the integer numbers with a string
enum Row: String {
    case editProfile
    case messages
    case contact
    case settings
    case history
    case help
    case signOut
    case none
    
    
    //Integer numbers for each case
    init(row: Int) {
        switch row {
            case 0: self = .editProfile
            case 1: self = .messages
            case 2: self = .contact
            case 3: self = .settings
            case 4: self = .history
            case 5: self = .help
            case 6: self = .signOut
            default: self = .none
        }
    }
}





class SidebarView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var titleArr = [String]()
    
    //Delegate: It is declared weak because if it is not it can cause memory leak
    weak var delegate: SidebarViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.2117647059, green: 0.2156862745, blue: 0.2196078431, alpha: 1)
        self.clipsToBounds = true
        
        titleArr = ["Jeremiah Ufot", "Messages", "Contact", "Settings", "History", "Help", "Sign Out"]
        
        setupViews()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        myTableView.tableFooterView = UIView()
        myTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        myTableView.allowsSelection = true
        myTableView.bounces = false
        myTableView.showsVerticalScrollIndicator = false
        myTableView.backgroundColor = UIColor.clear
    }
    
    //Number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArr.count
    }
    
    //Create cells for the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        if indexPath.row == 0 {
            cell.backgroundColor = #colorLiteral(red: 0.3019607843, green: 0.3019607843, blue: 0.3019607843, alpha: 1)
            let cellImg: UIImageView!
            cellImg = UIImageView(frame: CGRect(x: 15, y: 10, width: 80, height: 80))
            cellImg.layer.cornerRadius = 40
            cellImg.layer.masksToBounds = true
            cellImg.contentMode = .scaleAspectFill
            cellImg.layer.masksToBounds = true
            cellImg.image = UIImage(named: "lion.jpeg")
            cell.addSubview(cellImg)
            
            let cellLbl = UILabel(frame: CGRect(x: 110, y: cell.frame.height/2-15, width: 250, height: 30))
            cell.addSubview(cellLbl)
            cellLbl.text = titleArr[indexPath.row]
            cellLbl.font = UIFont.systemFont(ofSize: 17)
            cellLbl.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        } else {
            cell.textLabel?.text = titleArr[indexPath.row]
            cell.textLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        return cell
    }
    
    //When an item in the table is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.sidebarDidSelectRow(row: Row(row: indexPath.row))
    }
    
    //The height for each row/cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100
        } else {
            return 60
        }
    }
    
    // Assign the attributes of the view to myTableView
    
    func setupViews() {
        self.addSubview(myTableView)
        myTableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        myTableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        myTableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    //Defined Table View variable in a closure: create a UITableView and returns it
    
    let myTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}






























