//
//  HomeController.swift
//  CollegeProject
//
//  Created by Manoj Kumar on 11/02/19.
//  Copyright © 2019 Sandiaa. All rights reserved.
//

import UIKit
import Hero

class HomeController: UIViewController , UITableViewDelegate,UITableViewDataSource, UIScrollViewDelegate {
    let search = UISearchController(searchResultsController: nil)
 
    @IBOutlet weak var cart: UIImageView!
    var ar : [String] = ["hey","hello","m robot","hey","hello","m robot","hello","m robot","hey","hello","m robot"]
    @IBOutlet weak var productTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = UIColor.white
        navigationItem.title = "ios app"
     
        self.navigationItem.searchController = search
       productTableView.register(UINib(nibName: "FeaturedView", bundle: nil), forHeaderFooterViewReuseIdentifier: "FeaturedView")
   
        productTableView.register(UINib(nibName: "ProductsCell", bundle: nil), forCellReuseIdentifier: "ProductsCell")
    
        let featuredView:FeaturedView = Bundle.main.loadNibNamed("FeaturedView", owner: self, options: nil)![0] as! FeaturedView
        featuredView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 450)
        productTableView.tableHeaderView = featuredView
        
        productTableView.delegate = self
        productTableView.dataSource = self
        productTableView.separatorStyle = .none
    }
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let cell = productTableView.dequeueReusableCell(withIdentifier: "ProductsCell", for: indexPath) as! ProductsCell
        
        let str = "\(indexPath.section)" + "-" + "\(indexPath.row)"
        cell.productImage.hero.id = str
            
            return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsController = ProductDetailsController()
        let str = "\(indexPath.section)" + "-" + "\(indexPath.row)"
        detailsController.myHeroId = str
        self.present(detailsController, animated: true, completion: nil)
    }
   
 
}
