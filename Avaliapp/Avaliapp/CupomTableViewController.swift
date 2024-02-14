//
//  CupomTableViewController.swift
//  Avaliapp
//
//  Created by Student on 9/28/16.
//  Copyright © 2016 Debiasi. All rights reserved.
//

import UIKit

class CupomTableViewController: UITableViewController {
    
    var cupons: [Cupom] = [Cupom]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cupons = CupomDAO.buscarTodos()
        if (self.cupons.count == 0) {
            CupomDAO.inserirDadosPadroes()
            self.cupons = CupomDAO.buscarTodos()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.cupons.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cupomIdentifier", forIndexPath: indexPath) as! CupomTableViewCell
        
        let cupomAux = self.cupons[indexPath.row]
        let nomeEstabelecimento = EstabelecimentoDAO.buscarTodos()[indexPath.row]
        let statusCupom: String
        
        if cupomAux.status == 0 {
            statusCupom = "Resgatado"
            
            let cor = UIColor(red: 255, green: 0, blue: 0, alpha: 1)
            cell.statusCupom.textColor = cor
        } else {
            statusCupom = "Não resgatado"
            
            let cor = UIColor(red: 0, green: 128, blue: 0, alpha: 1)
            cell.statusCupom.textColor = cor
        }
        
        cell.nomeEmpresa.text = nomeEstabelecimento.nome
        cell.statusCupom.text = statusCupom
        
        cell.logoEmpresa.image = UIImage(named: (nomeEstabelecimento.logo)!)
        cell.recompensa.text = cupomAux.descricao
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cupomAux = self.cupons[indexPath.row]
        let nomeEstabelecimento = EstabelecimentoDAO.buscarTodos()[indexPath.row]
        
        let alert = UIAlertController(title: cupomAux.codigo, message:nomeEstabelecimento.nome , preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title:"Fechar", style: UIAlertActionStyle.Default, handler:nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
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
