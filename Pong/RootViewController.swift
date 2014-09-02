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
    
    var player1 : Person?
    var player2 : Person?
    
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
        if(controller == self.player1SelectionController) {
            self.player1 = person
        }
        else if(controller == self.player2SelectionController) {
            self.player2 = person
        }
        
        if(self.player1 != nil && self.player2 != nil) {
            //both players have been selected so instigate the match
            
            
        }
    }
    
    //MARK: Match animations
    
    func performVsAnimation() {
        
    }
    
    func performRound1Animation() {
        
    }
    
    func performFightAnimation() {
        
    }

}

