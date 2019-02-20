//
//  HomeController.swift
//  CollegeProject
//
//  Created by Sandiaa on 11/02/19.
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
        
        cell.populateWith(product: allProducts[indexPath.row])
        cell.delegate = self
        
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
    
    func didTapAddButton(productId: String) {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        var quantity = ProductList.getQuantity(productId: productId)
        quantity += 1
        
        if quantity > 1 {
            let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Products")
            fetchRequest.predicate = NSPredicate(format: "id = %@", productId)
            do {
                let test = try managedContext.fetch(fetchRequest)
                let objectUpdate = test[0] as! NSManagedObject
                objectUpdate.setValue(quantity, forKey: "quantity")
                try managedContext.save()
            }
            catch let error {
                print(error)
            }
        }
        else if quantity <= 1 {
            quantity = 1
            let productEntity = NSEntityDescription.entity(forEntityName: "Products", in: managedContext)!
                let product = NSManagedObject(entity: productEntity, insertInto: managedContext)
                product.setValue(productId, forKeyPath: "id")
                product.setValue(quantity, forKey: "quantity")
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
        
        productTableView.performBatchUpdates({
            self.productTableView.reloadRows(at: [self.getindexpathFor(productId: productId)], with: .none)
        }) { (finished) in
        }
    }
    
    func didTapMinusButton(productId: String) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate!.persistentContainer.viewContext
        var quantity = ProductList.getQuantity(productId: productId)
        quantity -= 1
        
        if quantity <= 0 {
            quantity = 0
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Products")
            fetchRequest.predicate = NSPredicate(format: "id = %@", productId)
            do
            {
                let test = try managedContext.fetch(fetchRequest)
                
                let objectToDelete = test[0] as! NSManagedObject
                managedContext.delete(objectToDelete)
                try managedContext.save()
            }
            catch let error {
                print(error)
            }
        }
        else if quantity > 0 {
            let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Products")
            fetchRequest.predicate = NSPredicate(format: "id = %@", productId)
            do
            {
                let test = try managedContext.fetch(fetchRequest)
                let objectUpdate = test[0] as! NSManagedObject
                objectUpdate.setValue(quantity, forKey: "quantity")
                try managedContext.save()
            }
            catch let error {
                print(error)
            }
        }
        
        productTableView.performBatchUpdates({
            self.productTableView.reloadRows(at: [self.getindexpathFor(productId: productId)], with: .none)
        }) { (finished) in
        }
    }
    
    func getindexpathFor(productId:String) -> IndexPath {
        let section = 0
        var row = 0
        
        for i in 0..<allProducts.count {
            let product = allProducts[i]
            
            if (product["productID"] as! String) == productId {
                row = i
                break
            }
        }
        return IndexPath(row: row, section: section)
    }
}
