//
//  MapViewController.swift
//  GestorDeViajesiOS
//
//  Created by user198227 on 11/18/21.
//

import MapKit
import UIKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let zocalo = MKPointAnnotation()
        zocalo.coordinate = CLLocationCoordinate2D(latitude: 19.4326018, longitude: -99.1332049)
        zocalo.title = "Centro de Mexico"
        zocalo.subtitle = "Viaje Recomendado"
        
        let piramides = MKPointAnnotation()
        piramides.coordinate = CLLocationCoordinate2D(latitude: -98.8473000, longitude: 19.6891100)
        piramides.title = "Piramides de Teotihuacan"
        piramides.subtitle = "Viaje Recomendado"
        
        mapView.addAnnotations([zocalo,piramides])
        
        let region = MKCoordinateRegion(center: zocalo.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
    }
}
