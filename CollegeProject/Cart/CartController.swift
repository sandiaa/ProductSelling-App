//
//  CartController.swift
//  CollegeProject
//
//  Created by  Sandiaa on 13/02/19.
//  Copyright © 2019 Sandiaa. All rights reserved.
//

import UIKit

class CartController: UIViewController ,UITableViewDelegate , UITableViewDataSource {
    @IBOutlet weak var cartProductTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        navigationItem.title = "Cart"
        cartProductTableView.register(UINib(nibName: "CartProductCell", bundle: nil), forCellReuseIdentifier: "CartProductCell")
        cartProductTableView.delegate = self
        cartProductTableView.dataSource = self
        cartProductTableView.separatorStyle = .none
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartProductTableView.dequeueReusableCell(withIdentifier: "CartProductCell", for: indexPath) as! CartProductCell
        return cell
    }
    

}
