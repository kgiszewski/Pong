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
                self.performRound1Animation {
                    self.performFightAnimation({})
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
        let round1Label = UILabel(frame: CGRectMake(0, 0, 800, 400))
        round1Label.font = UIFont.boldSystemFontOfSize(200)
        round1Label.text = "Round 1"
        round1Label.textAlignment = .Center
        round1Label.textColor = UIColor.redColor()
        round1Label.backgroundColor = UIColor.clearColor()
        round1Label.center = self.view.center
        
        let round1Image = round1Label.image
        let round1ImageView = UIImageView(image: round1Image)
        round1ImageView.frameSize = CGSizeZero;
        round1ImageView.center = self.view.center
        self.view.addSubview(round1ImageView);
        
        UIView.animateWithDuration(0.2, animations: {
            round1ImageView.frame = CGRectMake(self.view.center.x - round1Image.size.width / 2, self.view.center.y - round1Image.size.height / 2, round1Image.size.width, round1Image.size.height)
            }, completion: { finished in
                
                UIView.animateWithDuration(0.2, delay: 0.5, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                    
                    round1ImageView.frameSize = CGSizeMake(0, 0)
                    round1ImageView.center = self.view.center
                    
                    }, completion: { finished in
                        if(finished)
                        {
                            round1ImageView.removeFromSuperview()
                            completion()
                        }
                })
        })
    }
    
    func performFightAnimation( completion: Void -> Void) {
        let fightLabel = UILabel(frame: CGRectMake(0, 0, 800, 400))
        fightLabel.font = UIFont.boldSystemFontOfSize(200)
        fightLabel.text = "Fight"
        fightLabel.textAlignment = .Center
        fightLabel.textColor = UIColor.redColor()
        fightLabel.backgroundColor = UIColor.clearColor()
        fightLabel.center = self.view.center
        
        let fightImage = fightLabel.image
        let fightImageView = UIImageView(image: fightImage)
        fightImageView.frameSize = CGSizeZero;
        fightImageView.center = self.view.center
        self.view.addSubview(fightImageView);
        
        UIView.animateWithDuration(0.2, animations: {
            fightImageView.frame = CGRectMake(self.view.center.x - fightImage.size.width / 2, self.view.center.y - fightImage.size.height / 2, fightImage.size.width, fightImage.size.height)
            }, completion: { finished in
                
                UIView.animateWithDuration(0.2, delay: 0.5, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                    
                    fightImageView.frameSize = CGSizeMake(0, 0)
                    fightImageView.center = self.view.center
                    
                    }, completion: { finished in
                        if(finished)
                        {
                            fightImageView.removeFromSuperview()
                            completion()
                        }
                })
        })
    }
    
    

}

