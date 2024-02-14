//
//  EstabelecimentoViewController.swift
//  Avaliapp
//
//  Created by Student on 9/26/16.
//  Copyright © 2016 Debiasi. All rights reserved.
//

import UIKit
import MapKit

class EstabelecimentoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MKMapViewDelegate {

    var estabelecimento : Estabelecimento! //= Estabelecimento()
    var comentarios : [Avaliacao] = [Avaliacao]()
    let regionRadius: CLLocationDistance = 200
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var empresaLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var atendimentoLabel: UILabel!
    @IBOutlet weak var produtoLabel: UILabel!
    @IBOutlet weak var ambienteLabel: UILabel!
    @IBOutlet weak var tableViewComentario: UITableView!
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.estabelecimento.updateAvaliacoes()
        self.empresaLabel.text = estabelecimento.nome
        self.imageLabel.image  = UIImage(named:self.estabelecimento.logo!)
        self.ambienteLabel.text = String(estabelecimento.ambiente!)
        self.produtoLabel.text = String(estabelecimento.produto!)
        self.atendimentoLabel.text = String(estabelecimento.atendimento!)
        self.comentarios = self.estabelecimento.getComentarios()
        self.tableViewComentario.dataSource = self
        self.tableViewComentario.delegate = self
        let total = Int(estabelecimento.ambiente!) + Int(estabelecimento.atendimento!) + Int(estabelecimento.produto!)
        if (total >= 8){
           star1.image = UIImage(named:"star")
        }
        if (total >= 15){
            star2.image = UIImage(named:"star")
        }
        if (total >= 18){
            star3.image = UIImage(named:"star")
        }
        if (total >= 21){
            star4.image = UIImage(named:"star")
        }
        if (total >= 25){
            star5.image = UIImage(named:"star")
        }

        
        
        let initialLocation = CLLocation(latitude: Double(estabelecimento.latitude!), longitude: Double(estabelecimento.longitude!))
        centerMapOnLocation(initialLocation)
        
        mapView.delegate = self
        
        self.mapView.addAnnotation(estabelecimento.getPinMap())
        // Do any additional setup after loading the view.
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.comentarios.count
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("comentariosCell", forIndexPath: indexPath) as! ComentarioTableViewCell
        
        cell.nomeLabel.text = self.comentarios[indexPath.row].usuario?.nome
        cell.comentarioLabel.text = self.comentarios[indexPath.row].comentario
        cell.avatarLabel.image = UIImage(named: (self.comentarios[indexPath.row].usuario?.avatar!)!)
        
        return cell
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        if !(annotation is PinMap) {
            return nil
        }
        let reuseId = "test"
        var anView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
        if anView == nil {
            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            anView!.canShowCallout = true
        }
        else {
            anView!.annotation = annotation
        }
        
        //Set annotation-specific properties **AFTER**
        //the view is dequeued or created...
        
        let cpa = annotation as! PinMap
        anView!.image = cpa.logo
        return anView
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueQuestionario" {
            if let viewCupom = segue.destinationViewController as? CupomFiscalViewController {
                viewCupom.estabelecimento = self.estabelecimento
            }
        }
    }
}
