//
//  RecompensaViewController.swift
//  Avaliapp
//
//  Created by Student on 9/29/16.
//  Copyright © 2016 Debiasi. All rights reserved.
//

import UIKit

class RecompensaViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logo.image = UIImage(named: AvaliacaoDAO.estabelecimento.logo!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func redirecionar(sender: AnyObject) {
        print("click")
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        print("segue")
    }

}
