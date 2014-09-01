//
//  PersonCollectionViewCell.swift
//  Pong
//
//  Created by Bryce Hammond on 8/31/14.
//  Copyright (c) 2014 Imulus. All rights reserved.
//

import UIKit

class PersonCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    required init(coder aDecoder: NSCoder) {
        self.person = nil
        super.init(coder: aDecoder)
    }
    
    var person : Person? {
        didSet {
            self.imageView.image = person?.image
        }
    }
    
}
