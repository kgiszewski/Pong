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
        selectionController.delegate = self
        self.addChildViewController(selectionController)
        return selectionController
    }()
    
    lazy var player2SelectionController : PlayerSelectionViewController = {
        let selectionController = UIStoryboard.mainStoryboard().instantiateViewControllerWithIdentifier("Player Selection") as PlayerSelectionViewController
        selectionController.delegate = self
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
            self.performVsAnimation {
                self.performFightAnimation {
                    
                }
            }
            
        }
    }
    
    //MARK: Match animations
    
    func performVsAnimation( completion: Void -> Void) {
        let vsLabel = UILabel(frame: CGRectMake(0, 0, 400, 400))
        vsLabel.font = UIFont.boldSystemFontOfSize(200)
        vsLabel.text = "VS"
        vsLabel.textAlignment = .Center
        vsLabel.textColor = UIColor.redColor()
        vsLabel.backgroundColor = UIColor.clearColor()
        vsLabel.center = self.view.center
        
        let vsImage = vsLabel.image
        let vsImageView = UIImageView(image: vsImage)
        vsImageView.frameSize = CGSizeZero;
        vsImageView.center = self.view.center
        self.view.addSubview(vsImageView);
        
        UIView.animateWithDuration(0.2, animations: {
                vsImageView.frame = CGRectMake(self.view.center.x - vsImage.size.width / 2, self.view.center.y - vsImage.size.height / 2, vsImage.size.width, vsImage.size.height)
            }, completion: { finished in
                
                UIView.animateWithDuration(0.2, delay: 1.5, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                    
                    vsImageView.frameSize = CGSizeMake(0, 0)
                    vsImageView.center = self.view.center
                    
                    }, completion: { finished in
                        if(finished)
                        {
                            vsImageView.removeFromSuperview()
                            completion()
                        }
                })
        })
    }
    
    func performRound1Animation( completion: Void -> Void) {
        
    }
    
    func performFightAnimation( completion: Void -> Void) {
        
    }
    
    

}

