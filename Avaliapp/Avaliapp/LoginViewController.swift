//
//  ViewController.swift
//  Avaliapp
//
//  Created by Student on 9/26/16.
//  Copyright © 2016 Debiasi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UsuarioDAO.insertDefaultData()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueLogin" {
            let usuarioLogado = UsuarioDAO.buscarTodos()[0]
            UsuarioDAO.setAuthenticatedUser(usuarioLogado)
        }
    }

}

