//
//  EstabelecimentoTableViewController.swift
//  Avaliapp
//
//  Created by Student on 9/26/16.
//  Copyright © 2016 Debiasi. All rights reserved.
//

import UIKit

class EstabelecimentoTableViewController: UITableViewController {

    
    var estabelecimentos: [Estabelecimento]? // = [Estabelecimento]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.estabelecimentos = EstabelecimentoDAO.buscarTodos()
        if (self.estabelecimentos!.count == 0) {
            EstabelecimentoDAO.inserirDadosPadroes()
            self.estabelecimentos = EstabelecimentoDAO.buscarTodos()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.estabelecimentos!.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("estabelecimentoCell", forIndexPath: indexPath) as! EstabelecimentoTableViewCell
        
        cell.empresaNome.text = self.estabelecimentos![indexPath.row].nome!
        cell.empresaLogo.image = UIImage(named:self.estabelecimentos![indexPath.row].logo!)
        let estab = self.estabelecimentos![indexPath.row]
        let total = Int(estab.ambiente!) + Int(estab.atendimento!) + Int(estab.produto!)
        if (total >= 8){
            cell.star1.image = UIImage(named:"star")
        }
        if (total >= 15){
            cell.star2.image = UIImage(named:"star")
        } 
        if (total >= 18){
            cell.star3.image = UIImage(named:"star")
        }
        if (total >= 21){
            cell.star4.image = UIImage(named:"star")
        }
        if (total >= 25){
            cell.star5.image = UIImage(named:"star")
        }
        
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if  segue.identifier == "estabelecimentoSegue" {
            if let estabelecimentoView = segue.destinationViewController as? EstabelecimentoViewController {
                let indexRow = self.tableView.indexPathForSelectedRow?.row
                estabelecimentoView.estabelecimento = self.estabelecimentos![indexRow!]
            }
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
