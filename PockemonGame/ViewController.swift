//
//  ViewController.swift
//  PockemonGame
//
//  Created by Mac on 10/16/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import GoogleMaps


class ViewController: UIViewController , GMSMapViewDelegate , CLLocationManagerDelegate {
    
    var mapView:GMSMapView!
    let locationManger = CLLocationManager()
    var listPockemons = [Pockemons]()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.locationManger.requestAlwaysAuthorization()
        self.locationManger.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled()
        {
            locationManger.delegate=self
            locationManger.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManger.startUpdatingLocation()
        }

        
        let camera = GMSCameraPosition.camera(withLatitude: 40.90 , longitude: 105.30, zoom: 10.0)
        mapView=GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.delegate = self
        self.view=mapView
        
        laodPockemon()
    }
    
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D)
    {
        print("you tapped at \(coordinate.latitude):\(coordinate.longitude)")
    }


    // ta7did mawk3y 3la el5areta b el GPS
    var locValue : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        
        if manager.location!.coordinate.latitude==locValue.latitude && manager.location!.coordinate.longitude==locValue.longitude
        {
            return
        }
        
        locValue = manager.location!.coordinate
        print("you tapped at \(locValue.latitude):\( locValue.longitude)")
        self.mapView.clear()
        
        // add marker the catch man
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: locValue.latitude , longitude: locValue.longitude)
        marker.title = "me"
        marker.snippet = "hi for me"
        marker.icon = UIImage(named:"mario")
        marker.map = mapView
        
        
        
        var index=0  //34an manmsk4y nafs elpokemon tany aw 7ad yemsko 8erna tany = ne4elo mn 3la el5areta
        // add marker of pockemons
        for pockemon in listPockemons
        {
            if pockemon.isCatch==false
            {
                let markerPockemon = GMSMarker()
                markerPockemon.position = CLLocationCoordinate2D(latitude: pockemon.latitude!, longitude: pockemon.longitude!)
                markerPockemon.title = pockemon.name!
                markerPockemon.snippet = "\(pockemon.des!),his power is \(pockemon.power!)"
                markerPockemon.icon = UIImage(named:pockemon.image!)
                markerPockemon.map = mapView
                
                if locValue.latitude==pockemon.latitude && locValue.longitude==pockemon.longitude
                {
                    listPockemons[index].isCatch=true
                    alertDialog(power: pockemon.power!)
                }
                
            }
            index=index+1
        }
        
        let camera = GMSCameraPosition.camera(withLatitude: locValue.latitude , longitude: locValue.longitude, zoom: 10.0)
        self.mapView.camera = camera
        
    }
    
    
    
    func laodPockemon()
    {
        self.listPockemons.append(Pockemons(latitude: 37.77, longitude: 100.40, name: "C1", image: "C1", des: "C1 living in japan", power: 50))
        self.listPockemons.append(Pockemons(latitude: 37.78, longitude: 100.41, name: "C2", image: "C2", des: "C1 living in iraq", power: 90))
        self.listPockemons.append(Pockemons(latitude: 37.79, longitude: 100.42, name: "C3", image: "C3", des: "C1 living in egypt", power: 80))
        self.listPockemons.append(Pockemons(latitude: 37.80, longitude: 100.43, name: "C4", image: "C4", des: "C1 living in USA", power: 120))
        self.listPockemons.append(Pockemons(latitude: 37.81, longitude: 100.44, name: "C5", image: "C5", des: "C1 living in KSA", power: 150))
        self.listPockemons.append(Pockemons(latitude: 37.82, longitude: 100.45, name: "C6", image: "C6", des: "C1 living in france", power: 45))
        self.listPockemons.append(Pockemons(latitude: 37.83, longitude: 100.46, name: "C7", image: "C7", des: "C1 living in italia", power: 60))
        self.listPockemons.append(Pockemons(latitude: 37.84, longitude: 100.47, name: "C8", image: "C8", des: "C1 living in espania", power: 100))
    }
    
    
    
    
    var totalGain=0.0
    func alertDialog(power:Double) {
        self.totalGain = self.totalGain + power
        let alert = UIAlertController(title: "Coins", message: "Catch new pockemon with power \(power)", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
            print("+ one")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    

}

