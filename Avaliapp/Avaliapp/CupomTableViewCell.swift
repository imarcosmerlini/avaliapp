//
//  CupomTableViewCell.swift
//  Avaliapp
//
//  Created by Student on 9/29/16.
//  Copyright © 2016 Debiasi. All rights reserved.
//

import UIKit

class CupomTableViewCell: UITableViewCell {

    @IBOutlet weak var logoEmpresa: UIImageView!
    @IBOutlet weak var nomeEmpresa: UILabel!
    @IBOutlet weak var statusCupom: UILabel!
    
    @IBOutlet weak var recompensa: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
