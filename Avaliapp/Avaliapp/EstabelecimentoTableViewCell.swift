//
//  EstabelecimentoTableViewCell.swift
//  Avaliapp
//
//  Created by Student on 9/26/16.
//  Copyright © 2016 Debiasi. All rights reserved.
//

import UIKit

class EstabelecimentoTableViewCell: UITableViewCell {

    @IBOutlet weak var empresaNome: UILabel!
    @IBOutlet weak var empresaLogo: UIImageView!
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
