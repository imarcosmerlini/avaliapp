//
//  MapaViewController.swift
//  Avaliapp
//
//  Created by Student on 9/26/16.
//  Copyright © 2016 Debiasi. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapaViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var userLocation = CLLocation()
    var listaEstabelecimentos = [Estabelecimento]()
    let regionRadius: CLLocationDistance = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let initialLocation = CLLocation(latitude: -27.0701637, longitude: -52.6262802)
        EstabelecimentoDAO.inserirDadosPadroes();
        listaEstabelecimentos = EstabelecimentoDAO.buscarTodos()
        
        mapView.delegate = self
        
        centerMapOnLocation(initialLocation)
        checkLocationAuthorizationStatus()
        setupLocation()
        setupEstabelecimentos()
        
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
    
    
    func checkLocationAuthorizationStatus(){
        if CLLocationManager.authorizationStatus() != .AuthorizedWhenInUse {
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.startUpdatingLocation()
    }
    
    func setupLocation(){
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
    }
    
    func setupEstabelecimentos(){
        for estabelecimento in self.listaEstabelecimentos {
            self.mapView.addAnnotation(estabelecimento.getPinMap())
        }
    }
    
    
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if !(annotation is PinMap) {
            return nil
        }
        let reuseId = "pinEstabelecimento"
        var anView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
        if anView == nil {
            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            anView!.canShowCallout = true
            
            let calloutButton = UIButton(type: UIButtonType.DetailDisclosure)
            anView!.rightCalloutAccessoryView = calloutButton
        }
        else {
            anView!.annotation = annotation
        }
        
        let cpa = annotation as! PinMap
        anView!.image = cpa.logo
        return anView
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            performSegueWithIdentifier("segueEstabelecimento", sender: view.annotation)
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "segueEstabelecimento" )
        {
            if let estabelecimentoView = segue.destinationViewController as? EstabelecimentoViewController {
                let pinEstabelecimento = sender as! PinMap
                estabelecimentoView.estabelecimento = pinEstabelecimento.estabelecimento
            }
        }
        
    }
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
