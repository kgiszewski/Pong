//
//  ViewController.swift
//  Pong
//
//  Created by Bryce Hammond on 8/30/14.
//  Copyright (c) 2014 Imulus. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
                            
    @IBOutlet weak var player1ContainerView: UIView!
    @IBOutlet weak var player2ContainerView: UIView!
    
    lazy var player1SelectionController : PlayerSelectionViewController = {
        let selectionController = UIStoryboard.mainStoryboard().instantiateViewControllerWithIdentifier("Player Selection") as PlayerSelectionViewController
        return selectionController
    }()
    
    lazy var player2SelectionController : PlayerSelectionViewController = {
        let selectionController = UIStoryboard.mainStoryboard().instantiateViewControllerWithIdentifier("Player Selection") as PlayerSelectionViewController
        return selectionController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

