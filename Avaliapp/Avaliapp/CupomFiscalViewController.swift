//
//  CupomFiscalViewController.swift
//  Avaliapp
//
//  Created by Student on 9/29/16.
//  Copyright © 2016 Debiasi. All rights reserved.
//

import UIKit

class CupomFiscalViewController: UIViewController {

    @IBOutlet weak var cupomFiscalTextField: UITextField!
    var estabelecimento : Estabelecimento!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueQuestionario" {
            if let viewQuestionario = segue.destinationViewController as? AvaliacaoPageViewController {
                viewQuestionario.cupomFiscal = cupomFiscalTextField.text!
                viewQuestionario.estabelecimento = estabelecimento
            }
        }
    }
}
