//
//  HomeController.swift
//  CollegeProject
//
//  Created by Manoj Kumar on 11/02/19.
//  Copyright © 2019 Sandiaa. All rights reserved.
//

import UIKit
import Hero
import CoreData

class HomeController: UIViewController , UITableViewDelegate,UITableViewDataSource, UIScrollViewDelegate, ProductCellDelegate {
    let dbArray = DatabaseArray()
    var products: [NSManagedObject] = []
    let search = UISearchController(searchResultsController: nil)
 
    @IBOutlet weak var cart: UIImageView!
    @IBOutlet weak var productTableView: UITableView!
    
    
    var allProducts = [[String:Any]]()
   
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
        
        fetchProducts()
    }
    
    private func fetchProducts() {
        allProducts = ProductList.getAllProducts()
        productTableView.reloadData()
    }
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = productTableView.dequeueReusableCell(withIdentifier: "ProductsCell", for: indexPath) as! ProductsCell
      
        cell.populateWith(product: allProducts[indexPath.row], quantity: getQuantity(productID: allProducts[indexPath.row]["productIDs"] as! String))
        cell.delegate = self
        
        let str = "\(indexPath.section)" + "-" + "\(indexPath.row)"
        cell.productImage.hero.id = str
            return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let detailsController = ProductDetailsController()
//        let str = "\(indexPath.section)" + "-" + "\(indexPath.row)"
//        detailsController.myHeroId = str
//        self.present(detailsController, animated: true, completion: nil)
    }
   
    
    func getQuantity(productID:String)->Int {
        
        return 5
    }
    
    func didTapAddButton(productId: String) {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Products",in: managedContext)!
        
        let product = NSManagedObject(entity: entity,insertInto: managedContext)
        
        product.setValue(productId, forKeyPath: "id")
        
        do {
            try managedContext.save()
            products.append(product)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
    func didTapMinusButton(productId: String) {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Products")
        
        do {
            let product = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
 
}
}
