//
//  ProfileController.swift
//  CollegeProject
//
//  Created by Manoj Kumar on 13/02/19.
//  Copyright © 2019 Sandiaa. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
  let search = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Profile"
       
       // search.searchResultsUpdater = self
        self.navigationItem.searchController = search
        // Do any additional setup after loading the view.
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
