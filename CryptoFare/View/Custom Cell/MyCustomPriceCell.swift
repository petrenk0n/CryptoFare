//
//  CustomPriceCell.swift
//  CryptoFare
//
//  Created by Nikita Petrenko on 2/19/18.
//  Copyright © 2018 Nikita Petrenko. All rights reserved.
//

import UIKit

class MyCustomPriceCell: UITableViewCell {
    
    @IBOutlet weak var cryptoImage: UIImageView!
    @IBOutlet weak var cryptoName: UILabel!
    @IBOutlet weak var cryptoAbbreviation: UILabel!
    @IBOutlet weak var cryptoPrice: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
}
