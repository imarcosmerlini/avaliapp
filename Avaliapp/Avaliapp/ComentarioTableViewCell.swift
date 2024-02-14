//
//  ComentarioTableViewCell.swift
//  Avaliapp
//
//  Created by Student on 9/27/16.
//  Copyright © 2016 Debiasi. All rights reserved.
//

import UIKit

class ComentarioTableViewCell: UITableViewCell {

    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var comentarioLabel: UILabel!
    @IBOutlet weak var avatarLabel: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
