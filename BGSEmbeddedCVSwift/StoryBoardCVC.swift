//
//  StoryBoardCVC.swift
//  BGSEmbeddedCVSwift
//
//  Created by Peter Todd Air on 05/12/2016.
//  Copyright © 2016 Bright Green Star. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class StoryBoardCVC: UICollectionViewController {

    var screenSize : CGRect!
    var screenWidth : CGFloat!
    var screenHeight : CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //    screenSize = UIScreen.mainScreen().bounds
        screenSize = self.view.frame
        
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        // Do any additional setup after loading the view, typically from a nib.
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: screenWidth/3, height: screenWidth/3)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        print(collectionView?.frame.width)
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView!.backgroundColor = UIColor.greenColor()
        self.view.addSubview(collectionView!)
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if indexPath.row == 0
        {
            return CGSize(width: screenWidth, height: screenWidth/3)
        }
        return CGSize(width: screenWidth/3, height: screenWidth/3);
        
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as! CollectionViewCell
        if indexPath.row == 0
        {
            cell.backgroundColor = UIColor.blueColor()
        }else
        {
            cell.backgroundColor = UIColor.whiteColor()
        }
        cell.layer.borderColor = UIColor.blackColor().CGColor
        cell.layer.borderWidth = 0.5
        
        //    println(cell.frame.size.width)
        
        cell.textLabel?.text = "\(indexPath.section):\(indexPath.row)"
        return cell
    }

}
