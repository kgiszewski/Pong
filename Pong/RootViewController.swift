//
//  ViewController.swift
//  Pong
//
//  Created by Bryce Hammond on 8/30/14.
//  Copyright (c) 2014 Imulus. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, PlayerSelectionViewControllerDelegate {
                            
    @IBOutlet weak var player1ContainerView: UIView!
    @IBOutlet weak var player2ContainerView: UIView!
    
    lazy var player1SelectionController : PlayerSelectionViewController = {
        let selectionController = UIStoryboard.mainStoryboard().instantiateViewControllerWithIdentifier("Player Selection") as PlayerSelectionViewController
        self.addChildViewController(selectionController)
        return selectionController
    }()
    
    lazy var player2SelectionController : PlayerSelectionViewController = {
        let selectionController = UIStoryboard.mainStoryboard().instantiateViewControllerWithIdentifier("Player Selection") as PlayerSelectionViewController
        self.addChildViewController(selectionController)
        return selectionController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.player1SelectionController.view.frame = self.player1ContainerView.bounds
        self.player2SelectionController.view.frame = self.player2ContainerView.bounds
        
        self.player1ContainerView.addSubview(self.player1SelectionController.view)
        self.player2ContainerView.addSubview(self.player2SelectionController.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: PlayerSelectionViewControllerDelegate
    
    func playerSelectionViewController(controller : PlayerSelectionViewController, didSelectPerson person : Person) {
        
    }

}

