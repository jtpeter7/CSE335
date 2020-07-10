//
//  PartIIViewController.swift
//  Lab#1
//
//  Created by jtpeter7 on 1/30/20.
//  Copyright © 2020 jtpeter7. All rights reserved.
//

import UIKit

class PartIIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        return(CalcRFM());

        // Do any additional setup after loading the view.
    }
    @IBOutlet var HValue: UILabel!
    @IBOutlet var WValue: UILabel!
    
    @IBOutlet var Height: UISlider!
    @IBOutlet var Waist: UISlider!
    @IBOutlet var Gender: UISegmentedControl!
    @IBOutlet var RFM: UILabel!
    @IBOutlet var Health: UILabel!
    
    @IBAction func NewGender(_ sender: Any) {
        return(CalcRFM());
    }
    @IBAction func NewWaist(_ sender: Any) {
        return(CalcRFM());
    }
    @IBAction func NewHeight(_ sender: Any) {
        return(CalcRFM());
    }
    
    @IBAction func CalcRFM() {
        HValue.text = String(Int(Height.value));
        WValue.text = String(Int(Waist.value));
        let first :Double? = Double(Height.value)
        let second :Double? = Double(Waist.value)
        guard first != nil && second != nil else{
            return
        }
        let RFM1 = 20*(first!/second!);
        switch Gender.selectedSegmentIndex{
        case 1:
            let  RFMValue = 64 - (RFM1)+(12);
            self.RFM.text = String(format: "%.2f",RFMValue);
            if(RFMValue <= 21){ self.Health.text = "Underfat"; self.Health.textColor = UIColor.blue;}
            else if(RFMValue <= 33){ self.Health.text = "Healthy"; self.Health.textColor=UIColor.green;}
            else if(RFMValue <= 39){ self.Health.text = "Overfat"; self.Health.textColor=UIColor.yellow;}
            else{ self.Health.text = "Obese"; self.Health.textColor=UIColor.red;}
        case 0:
            let  RFMValue: Double = 64 - (RFM1);
            self.RFM.text = String(format: "%.2f",RFMValue);
            if(RFMValue <= 8){ self.Health.text = "Underfat"; self.Health.textColor=UIColor.blue;}
            else if(RFMValue <= 19){ self.Health.text = "Healthy"; self.Health.textColor=UIColor.green;}
            else if(RFMValue <= 25){ self.Health.text = "Overfat"; self.Health.textColor=UIColor.yellow;}
            else{ self.Health.text = "Obese"; self.Health.textColor=UIColor.red;}
        default:
            self.RFM.text = "Not valid Gender";
        }
    }

}
