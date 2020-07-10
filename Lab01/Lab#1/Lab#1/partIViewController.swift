//
//  partIViewController.swift
//  Lab#1
//
//  Created by jtpeter7 on 1/30/20.
//  Copyright © 2020 jtpeter7. All rights reserved.
//

import UIKit

class partIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBOutlet weak var Height: UITextField!
    @IBOutlet weak var Waist: UITextField!
    @IBOutlet weak var Gender: UITextField!
    @IBOutlet var RFM: UILabel!
    @IBOutlet weak var Health: UILabel!
    
    @IBAction func CalcRFM(_ sender: Any) {
        let cases = self.Gender.text;
        let first :Double? = Double(Height.text!)
        let second :Double? = Double(Waist.text!)
        guard first != nil && second != nil else{
            return
        }
        let RFM1 = 20*(first!/second!);
        switch cases{
        case "F":
            let  RFMValue = 64 - (RFM1)+(12);
            self.RFM.text = String(format: "%.2f",RFMValue);
            if(RFMValue <= 21){ self.Health.text = "Underfat"; self.Health.textColor = UIColor.blue;}
            else if(RFMValue <= 33){ self.Health.text = "Healthy"; self.Health.textColor=UIColor.green;}
            else if(RFMValue <= 39){ self.Health.text = "Overfat"; self.Health.textColor=UIColor.yellow;}
            else{ self.Health.text = "Obese"; self.Health.textColor=UIColor.red;}
        case "M":
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
