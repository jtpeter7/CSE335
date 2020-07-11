//
//  DetailViewController.swift
//  fruitsTableExample
//
//  Created by user on 2/8/18.
//  Copyright © 2018 ASU. All rights reserved.
//

import UIKit
import MapKit
import WebKit

class DetailViewController: UIViewController, MKMapViewDelegate {
    var selectedCity:String?
    var testing:String?
    //var points: [MKAnnotation] = [];
    
    @IBOutlet weak var cityLat: UILabel!
    @IBOutlet weak var cityLong: UILabel!
    @IBOutlet weak var TheMap: MKMapView!
    @IBOutlet weak var Place: UITextField!
    @IBOutlet weak var Search: UIButton!
    @IBOutlet weak var Quakes: UIButton!
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var QuakeList: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func FindPlaces(_ sender: Any) {
        test();
    }
    
    @IBAction func EarthQuakes(_ sender: Any) {
        /*self.cityLat.text = NSString(format: "%.4f", self.TheMap.centerCoordinate.latitude) as String;
        self.cityLong.text = NSString(format: "%.4f", self.TheMap.centerCoordinate.longitude) as String*/
        if(self.TheMap.centerCoordinate.latitude<0){
            self.cityLat.text = NSString(format: "%.4f", (self.TheMap.centerCoordinate.latitude * -1)) as String + "S";
        }else{
            self.cityLat.text = NSString(format: "%.4f", self.TheMap.centerCoordinate.latitude) as String + "N";
        }
        if(self.TheMap.centerCoordinate.longitude<0){
            self.cityLong.text = NSString(format: "%.4f", (self.TheMap.centerCoordinate.longitude * -1)) as String + "W";
        }else{
            self.cityLong.text = NSString(format: "%.4f", self.TheMap.centerCoordinate.longitude) as String + "E";
        }
        let north = NSString(format: "%.2f",self.TheMap.centerCoordinate.latitude+10)as String ;
        let south = NSString(format: "%.2f",self.TheMap.centerCoordinate.latitude-10)as String ;
        let east = NSString(format: "%.2f",self.TheMap.centerCoordinate.longitude-10)as String ;
        let west = NSString(format: "%.2f",self.TheMap.centerCoordinate.longitude+10)as String ;
        let urlAsString = "http://api.geonames.org/earthquakesJSON?north="+north+"&south="+south+"&east="+east+"&west="+west+"&username=doof";
        print(urlAsString);
        var test = Place.text! + " Quakes:\n";
        if let url = URL(string: urlAsString){
            URLSession.shared.dataTask(with: url){data,response,error in
                if let data = data{
                    if let jsonString = String(data: data, encoding: .utf8){
                        print(jsonString)
                        let separators = CharacterSet(charactersIn: "\"{} ")
                        let array = jsonString.components(separatedBy: separators)
                        for(index,element) in array.enumerated(){
                            if(element == "datetime"){
                                test += "Date: " + array[index+2] as String;
                                test += "\n Lat" + array[index+20] as String;
                                test += " Long" + array[index+8] as String;
                                test += " Mag" + array[index+18] as String;
                                test += "\n"
                                self.QuakeList.text=test;
                            }
                        }

                        //print(test);
                    }
                }
            }.resume()
        }
    }
    
    
    func test(){
        let geoCoder = CLGeocoder();
        //let addressString = "699, S. Mill Ave, Tempe, AZ, 85281"
        let addressString = Place.text!
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
                }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
