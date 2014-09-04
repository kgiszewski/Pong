//
//  ViewController.swift
//  Pong
//
//  Created by Bryce Hammond on 8/30/14.
//  Copyright (c) 2014 Imulus. All rights reserved.
//

import UIKit
import AVFoundation

class RootViewController: UIViewController, PlayerSelectionViewControllerDelegate {
                            
    @IBOutlet weak var player1ContainerView: UIView!
    @IBOutlet weak var player2ContainerView: UIView!
    
    var player1 : Person?
    var player2 : Person?
    
    lazy var backgroundAudioPlayer : AVAudioPlayer = {
        let backgroundPlayer = AVAudioPlayer(contentsOfURL: NSBundle.mainBundle().URLForResource("Theme Song", withExtension: "m4a"), error: nil)
        backgroundPlayer.numberOfLoops = -1
        return backgroundPlayer
    }()
    
    var animationAudioPlayer : AVAudioPlayer?
    
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
        
        self.backgroundAudioPlayer.play()
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
            
            self.backgroundAudioPlayer.stop()
            
            self.performVsAnimation {
                self.performRound1Animation {
                    self.performFightAnimation({})
                }
            }
            
        }
    }
    
    //MARK: Match sounds
    
    //MARK: Match animations
    
    func performVsAnimation( completion: Void -> Void) {
        
        self.animationAudioPlayer = AVAudioPlayer(contentsOfURL: NSBundle.mainBundle().URLForResource("VS", withExtension: "m4a"), error: nil)
        self.animationAudioPlayer?.play()
        self.animateText("VS", withDuration: 0.2, middleDelay: 1.5, completion: completion)
    }
    
    func performRound1Animation( completion: Void -> Void) {
        
        self.animateText("Round 1", withDuration: 0.2, middleDelay: 0.5, completion: completion)
    }
    
    func performFightAnimation( completion: Void -> Void) {
        
        self.animationAudioPlayer = AVAudioPlayer(contentsOfURL: NSBundle.mainBundle().URLForResource("Fight", withExtension: "mp3"), error: nil)
        self.animationAudioPlayer?.play()
        self.animateText("Fight", withDuration: 0.2, middleDelay: 0.5, completion: completion)
    }
    
    func animateText(bannerText: String, withDuration duration : NSTimeInterval, middleDelay delay: NSTimeInterval, completion: Void -> Void) {
        
        let image = self.imageForBannerText(bannerText)
        let imageView = UIImageView(image: image)
        imageView.frameSize = CGSizeZero;
        imageView.center = self.view.center
        self.view.addSubview(imageView);
        
        UIView.animateWithDuration(duration, animations: {
            imageView.frame = CGRectMake(self.view.center.x - image.size.width / 2, self.view.center.y - image.size.height / 2, image.size.width, image.size.height)
            }, completion: { finished in
                
                UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                    
                    imageView.frameSize = CGSizeMake(0, 0)
                    imageView.center = self.view.center
                    
                    }, completion: { finished in
                        if(finished)
                        {
                            imageView.removeFromSuperview()
                            completion()
                        }
                })
        })
    }
    
    
    func imageForBannerText(bannerText : String) -> UIImage {
        let label = UILabel(frame: CGRectMake(0, 0, 800, 400))
        label.font = UIFont.boldSystemFontOfSize(200)
        label.text = bannerText
        label.textAlignment = .Center
        label.textColor = UIColor.redColor()
        label.backgroundColor = UIColor.clearColor()
        label.center = self.view.center
        
        return label.image
    }

}

