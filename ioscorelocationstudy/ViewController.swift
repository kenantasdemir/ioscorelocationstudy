//
//  ViewController.swift
//  ioscorelocationstudy
//
//  Created by kenan on 11.08.2024.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    var locationManeger:CLLocationManager = CLLocationManager()
    
    
    @IBOutlet weak var latLabel: UILabel!
    
    @IBOutlet weak var longLabel: UILabel!
    
    @IBOutlet weak var speedLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        speedLabel.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        speedLabel.addGestureRecognizer(tapGesture)
        
        locationManeger.desiredAccuracy = kCLLocationAccuracyBest
        locationManeger.delegate = self
        locationManeger.requestWhenInUseAuthorization()
        locationManeger.startUpdatingLocation()
        
    }
    
    @objc func labelTapped(){
        print("Speed Label Tapped")
    }
}

extension ViewController:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let actualLocation:CLLocation = locations[locations.count - 1]
        latLabel.text = "Latitude: \(actualLocation.coordinate.latitude)"
        longLabel.text = "Longitude: \(actualLocation.coordinate.longitude)"
        speedLabel.text = "Speed: \(actualLocation.speed)"
    }
}
