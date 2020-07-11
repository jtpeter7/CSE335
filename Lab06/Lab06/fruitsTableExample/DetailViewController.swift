//
//  DetailViewController.swift
//  fruitsTableExample
//
//  Created by user on 2/8/18.
//  Copyright © 2018 ASU. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController, MKMapViewDelegate {
    var selectedCity:String?
    var testing:String?
    //var points: [MKAnnotation] = [];
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityLat: UILabel!
    @IBOutlet weak var cityLong: UILabel!
    @IBOutlet weak var TheMap: MKMapView!
    @IBOutlet weak var Toggle: UISegmentedControl!
    @IBOutlet weak var Place: UITextField!
    @IBOutlet weak var Search: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityName.text = selectedCity;
        testing=selectedCity;
        ShowLocation();
        //cityDescription.text=selectedDescription;
        //cityImage.image = UIImage(named: selectedImage!);
        
    }
    
    func ShowLocation() {
        let geoCoder = CLGeocoder();
        //let addressString = "699, S. Mill Ave, Tempe, AZ, 85281"
        let addressString = testing!
        CLGeocoder().geocodeAddressString(addressString, completionHandler:
            {(placemarks, error) in
                
                if error != nil {
                    print("Geocode failed: \(error!.localizedDescription)")
                } else if placemarks!.count > 0 {
                    let placemark = placemarks![0]
                    let location = placemark.location
                    let coords = location!.coordinate
                    print(location)
                   
                    let span = MKCoordinateSpan.init(latitudeDelta: 0.05, longitudeDelta: 0.05)
                    let region = MKCoordinateRegion(center: placemark.location!.coordinate, span: span)
                    self.TheMap.setRegion(region, animated: true)
                    let ani = MKPointAnnotation()
                    ani.coordinate = placemark.location!.coordinate
                    ani.title = placemark.locality
                    ani.subtitle = placemark.subLocality
                    
                    self.TheMap.addAnnotation(ani)
                    self.cityLat.text = NSString(format: "%.4f", self.TheMap.centerCoordinate.latitude) as String;
                    self.cityLong.text = NSString(format: "%.4f", self.TheMap.centerCoordinate.longitude) as String
                }
        })
    
    }
    
    @IBAction func SwitchView(_ sender: Any) {
        if(Toggle.selectedSegmentIndex==0){
            TheMap.mapType = MKMapType.standard;
        }
        if(Toggle.selectedSegmentIndex==1){
            TheMap.mapType = MKMapType.satellite;
        }
    }
    @IBAction func FindPlaces(_ sender: Any) {
        //let annotations = self.TheMap.annotations
        //self.TheMap.removeAnnotations(annotations);
            let request = MKLocalSearch.Request()
            request.naturalLanguageQuery = self.Place.text//"pizza"
            request.region = TheMap.region
            let search = MKLocalSearch(request: request)
        
            search.start { response, _ in
                guard let response = response else {
                    return
                }
                //print( response.mapItems )
                var matchingItems:[MKMapItem] = []
                matchingItems = response.mapItems
                if(matchingItems.count > 0){
                    for i in 0...matchingItems.count - 1
                    {
                        let place = matchingItems[i].placemark
                         /*print(place.location?.coordinate.latitude)
                         print(place.location?.coordinate.longitude)*/
                         print(place.name)
                    //self.points.append(place);
                    /*let point = MKPointAnnotation();
                    point.coordinate = place.location?.coordinate as! CLLocationCoordinate2D;
                    point.title = place.name;*/
                    
                    self.TheMap.addAnnotation(place);
                    }
                //self.TheMap.addAnnotations(self.points);
                }
            }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
