//
//  ViewController.swift
//  HMWK1
//
//  Created by jtpeter7 on 3/7/20.
//  Copyright © 2020 jtpeter7. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var s1: UISegmentedControl!
    @IBOutlet weak var s2: UISegmentedControl!
    @IBOutlet weak var s3: UISegmentedControl!
    @IBOutlet weak var s4: UISegmentedControl!
    @IBOutlet weak var s5: UISegmentedControl!
    @IBOutlet weak var s6: UISegmentedControl!
    @IBOutlet weak var s7: UISegmentedControl!
    @IBOutlet weak var s8: UISegmentedControl!
    @IBOutlet weak var s9: UISegmentedControl!
    @IBOutlet weak var s10: UISegmentedControl!
    @IBOutlet weak var AddGame: UIButton!
    @IBOutlet weak var ShowStats: UIButton!
    @IBOutlet weak var ShowRisk: UIButton!
    
    var g1t:Int = 0;
    var g2t:Int = 0;
    var g3t:Int = 0;
    var g4t:Int = 0;
    var g5t:Int = 0;
    
    var g1s:Int = 0;
    var g2s:Int = 0;
    var g3s:Int = 0;
    var g4s:Int = 0;
    var g5s:Int = 0;
    
    var g1o:String="";
    var g2o:String="";
    var g3o:String="";
    var g4o:String="";
    var g5o:String="";
    
    var t1 = "",t2="",t3="",t4="",t5="";
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func NewGame(_ sender: Any) {
        var temp_total: Int = 0;
        var temp_count: Int = 0;
        temp_total += s1.selectedSegmentIndex;
        temp_total += s2.selectedSegmentIndex;
        temp_total += s3.selectedSegmentIndex;
        temp_total += s4.selectedSegmentIndex;
        temp_total += s5.selectedSegmentIndex;
        temp_total += s6.selectedSegmentIndex;
        temp_total += s7.selectedSegmentIndex;
        temp_total += s8.selectedSegmentIndex;
        temp_total += s9.selectedSegmentIndex;
        temp_total += s10.selectedSegmentIndex;
        if (s1.selectedSegmentIndex != 0){
            temp_count+=1;
        }
        if (s2.selectedSegmentIndex != 0){
            temp_count+=1;
        }
        if (s3.selectedSegmentIndex != 0){
            temp_count+=1;
        }
        if (s4.selectedSegmentIndex != 0){
            temp_count+=1;
        }
        if (s5.selectedSegmentIndex != 0){
            temp_count+=1;
        }
        if (s6.selectedSegmentIndex != 0){
            temp_count+=1;
        }
        if (s7.selectedSegmentIndex != 0){
            temp_count+=1;
        }
        if (s8.selectedSegmentIndex != 0){
            temp_count+=1;
        }
        if (s9.selectedSegmentIndex != 0){
            temp_count+=1;
        }
        if (s10.selectedSegmentIndex != 0){
            temp_count+=1;
        }
        newGame(a: temp_count, b: temp_total);
    }
    
    
    func newGame(a:Int, b:Int){
        g5o=g4o;g4o=g3o;g3o=g2o;g2o=g1o;
        g5s=g4s;g4s=g3s;g3s=g2s;g2s=g1s;
        g5t=g4t;g4t=g3t;g3t=g2t;g2t=g1t;
        g1t=a;
        g1s=b;
        if(abs(g1s-g2s)<=10){
            g1o="No Difference";
        }else if(abs(g1s-g2s) <= 15){
            g1o="Unsure";
        }else{
            g1o="Very Different";
        }
        t1 = "Total Symptoms: \(g1t) \nSymptom Severity Scope: \(g1s) \nRating: \(g1o)";
        t2 = "Total Symptoms: \(g2t) \nSymptom Severity Scope: \(g2s) \nRating: \(g2o)";
        t3 = "Total Symptoms: \(g3t) \nSymptom Severity Scope: \(g3s) \nRating: \(g3o)";
        t4 = "Total Symptoms: \(g4t) \nSymptom Severity Scope: \(g4s) \nRating: \(g4o)";
        t5 = "Total Symptoms: \(g5t) \nSymptom Severity Scope: \(g5s) \nRating: \(g5o)";
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "gameview"){
            if let viewController: ViewControllerGames = segue.destination as? ViewControllerGames {
                viewController.t1=t1;
                viewController.t2=t2;
                viewController.t3=t3;
                viewController.t4=t4;
                viewController.t5=t5;
                viewController.g1o=g1o;
                viewController.g2o=g2o;
                viewController.g3o=g3o;
                viewController.g4o=g4o;
                viewController.g5o=g5o;
                viewController.g1s=g1s;
                viewController.g2s=g2s;
                viewController.g3s=g3s;
                viewController.g4s=g4s;
                viewController.g5s=g5s;
                viewController.g1t=g1t;
                viewController.g2t=g2t;
                viewController.g3t=g3t;
                viewController.g4t=g4t;
                viewController.g5t=g5t;
            }
        }
        if(segue.identifier == "riskview"){
            if let viewController: ViewControllerRisk = segue.destination as? ViewControllerRisk {
                print(abs(g1s-g2s))
                viewController.Testvalue = abs(g1s-g2s);
                
                viewController.t1=t1;
                viewController.t2=t2;
                viewController.t3=t3;
                viewController.t4=t4;
                viewController.g1o=g1o;
                viewController.g2o=g2o;
                viewController.g3o=g3o;
                viewController.g4o=g4o;
                viewController.g5o=g5o;
                viewController.g1s=g1s;
                viewController.g2s=g2s;
                viewController.g3s=g3s;
                viewController.g4s=g4s;
                viewController.g5s=g5s;
                viewController.g1t=g1t;
                viewController.g2t=g2t;
                viewController.g3t=g3t;
                viewController.g4t=g4t;
                viewController.g5t=g5t;
            }
        }
    }
    
    
}

