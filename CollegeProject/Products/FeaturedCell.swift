//
//  FeaturedCell.swift
//  CollegeProject
//
//  Created by Manoj Kumar on 12/02/19.
//  Copyright © 2019 Sandiaa. All rights reserved.
//

import UIKit

class FeaturedCell: UITableViewCell , UICollectionViewDelegate, UICollectionViewDataSource{
   

    @IBOutlet weak var featuredProductsCollection: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        featuredProductsCollection.register(UINib(nibName: "FeaturedProductCell", bundle: nil), forCellWithReuseIdentifier: "FeaturedProductCell")
        let flowLayout = UPCarouselFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 60, height: featuredProductsCollection.frame.height)
        flowLayout.scrollDirection = .horizontal
        flowLayout.sideItemScale = 0.8
        flowLayout.sideItemAlpha = 1.0
        flowLayout.spacingMode = .fixed(spacing: 5.0)
        featuredProductsCollection.collectionViewLayout = flowLayout
        
        featuredProductsCollection.delegate = self
        featuredProductsCollection.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = featuredProductsCollection.dequeueReusableCell(withReuseIdentifier: "FeaturedProductCell", for: indexPath) as! FeaturedProductCell
        return cell
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let layout = self.featuredProductsCollection.collectionViewLayout as! UPCarouselFlowLayout
        let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
        let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        currentPage = Int(floor((offset - pageSide / 2) / pageSide) + 1)
    }
    
    fileprivate var currentPage: Int = 0 {
        didSet {
            print("at center is = \(currentPage)")
        }
    }
    
    fileprivate var pageSize: CGSize {
        let layout = self.featuredProductsCollection.collectionViewLayout as! UPCarouselFlowLayout
        var pageSize = layout.itemSize
        if layout.scrollDirection == .horizontal {
            pageSize.width += layout.minimumLineSpacing
        } else {
            pageSize.height += layout.minimumLineSpacing
        }
        return pageSize
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
