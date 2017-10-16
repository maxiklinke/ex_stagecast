//
//  TimelineViewController.swift
//  Stagecast
//
//  Created by Maximilian Klinke on 14.10.17.
//  Copyright © 2017 Maximilian Klinke. All rights reserved.
//

import Foundation
import UIKit

class TimelineViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    let reuseIdentifier = "TimelineCollectionCell"
    var items: [Int]=[-1, 1,0,0,0,0,0,0,0,0]
    
    
    //---------------------------------------------- FUNCTIONS ------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let circle = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
        
        circle.center = self.view.center
        circle.layer.cornerRadius = 50
        circle.layer.borderWidth = 4
        circle.layer.borderColor = UIColor.white.cgColor
        circle.backgroundColor = UIColor.black.withAlphaComponent(0.0)
        circle.clipsToBounds = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(TimelineViewController.tabOnCircle(_:)))
        // or for swift 2 +
        //let gestureSwift2AndHigher = UITapGestureRecognizer(target: self, action:  #selector (self.someAction (_:)))
        circle.addGestureRecognizer(gesture)
        /*
        var darkBlur = UIBlurEffect(style: UIBlurEffectStyle.extraLight)
        var blurView = UIVisualEffectView(effect: darkBlur)
        
        blurView.frame = circle.bounds
        
        circle.addSubview(blurView)*/
        self.view.addSubview(circle)
    }
    
    func tabOnCircle(_ sender:UITapGestureRecognizer){
        performSegue(withIdentifier: "Segue", sender: nil)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? TimelineCollectionCell {
            if !cell.button.isHidden {
                performSegue(withIdentifier: "Segue", sender: nil)
            }
        }
    }
    
    
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CreateNewPostSegue" {
            
            if let createNewViewController = segue.destination as? CreateNewViewController{
                if let object = sender as? PFObject{
                    print("Segue")
                    createNewViewController.gameObject = object
                    createNewViewController.isLive = true
                }
            }
            
        }
    }*/
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! TimelineCollectionCell
        
        if(items[indexPath.row] == 1){
            cell.button.layer.cornerRadius = cell.button.frame.width/2.0
            
        }else if items[indexPath.row] == -1{
            cell.labelTitle.isHidden = true
            cell.labelTime.isHidden = true
            cell.button.isHidden = true
        }else{
            cell.labelTitle.isHidden = true
            cell.labelTime.isHidden = true
            cell.button.isHidden = true
        }
            
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var height = 100.0
        
        if items[indexPath.row] == -1{
            height = Double(self.view.frame.height/2.0 - 125.0 - CGFloat(3*height/4.0))
        }
        
        return CGSize(width: collectionView.bounds.size.width, height: CGFloat(height))
    }
    
}
