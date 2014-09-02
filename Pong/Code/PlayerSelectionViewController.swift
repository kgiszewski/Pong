//
//  PlayerSelectionViewController.swift
//  Pong
//
//  Created by Bryce Hammond on 8/30/14.
//  Copyright (c) 2014 Imulus. All rights reserved.
//

import UIKit

protocol PlayerSelectionViewControllerDelegate {
    func playerSelectionViewController(controller : PlayerSelectionViewController, didSelectPerson person : Person)
}

class PlayerSelectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var people : [Person]
    
    var delegate : PlayerSelectionViewControllerDelegate?
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        self.people = [Person]()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init(coder aDecoder: NSCoder) {
        self.people = [Person]()
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.people = Person.allPeople
        self.collectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDelegate/Datasource
    
    func collectionView(collectionView: UICollectionView!, didSelectItemAtIndexPath indexPath: NSIndexPath!) {
        
        //Put an image of the cell over the selected cell, hide the cell and then animate it forward while fading out
        //the collection view
        
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        cell.alpha = 0.0
        let selectedPerson = self.people[indexPath.row]
        let cellFrame = collectionView.convertRect(cell.frame, toView: self.view)
        
        let imageView = UIImageView(image: selectedPerson.image)
        imageView.frame = cellFrame
        self.view.addSubview(imageView)
        
        //fade out the collection view and move the selection to the middle and enlarge
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 50.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            
                collectionView.alpha = 0.0
                imageView.frame = CGRect(x: 0, y: 0, width: imageView.frame.size.width * 2, height: imageView.frame.size.height * 2)
                imageView.center = self.view.center
            
            }, completion: { finished in
                
                if(finished) {
                    self.delegate?.playerSelectionViewController(self, didSelectPerson: selectedPerson)
                }
                
            })
        
        
    }
    
    func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int {
        return self.people.count
    }
    
    func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell! {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Person", forIndexPath: indexPath) as PersonCollectionViewCell
        cell.person = self.people[indexPath.row]
        
        return cell
    }
    
}
