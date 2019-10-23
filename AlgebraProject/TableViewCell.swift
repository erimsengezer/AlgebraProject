//
//  TableViewCell.swift
//  AlgebraProject
//
//  Created by Erim Şengezer on 23.10.2019.
//  Copyright © 2019 Erim Şengezer. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    //MARK - IBOulets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
