//
//  PlayerScoreViewController.swift
//  Pong
//
//  Created by Bryce Hammond on 8/30/14.
//  Copyright (c) 2014 Imulus. All rights reserved.
//

import UIKit

class PlayerScoreViewController: UIViewController {

    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var player : Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scoreLabel.alpha = 0.0
        self.scoreLabel.text = "0"

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.playerImageView.image = player?.image
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.animateInitialLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animateInitialLayout() {
        
        UIView.animateWithDuration(0.3, animations: {
            
            self.playerImageView.frameSize = CGSizeMake(200, 150)
            self.playerImageView.centerHorizontallyInSuperviewWithYOrigin(20)
            self.scoreLabel.alpha = 1.0
            
            }, completion: { finished in
                
        })
        
        
        
    }

}
