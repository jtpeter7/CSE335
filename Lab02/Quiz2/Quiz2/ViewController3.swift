//
//  ViewController3.swift
//  Quiz2
//
//  Created by jtpeter7 on 2/5/20.
//  Copyright © 2020 jtpeter7. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    var FirstString:String!;
    var fromFirst:Int!;
    var data:String?
    var ComingFromMoon:String!
    @IBOutlet weak var EarthWeight: UILabel!
    @IBOutlet weak var MoonWeight: UILabel!
    @IBOutlet weak var JupiterWeight: UILabel!
    @IBOutlet weak var FromMoon: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(FirstString);
        FromMoon.text=ComingFromMoon;
        EarthWeight.text = FirstString;
        var Moon = (FirstString as NSString).floatValue;
        //var Moon:Int! = fromFirst;
        Moon = (Moon/6);
        print(Moon)
        MoonWeight.text = String(format: "%.2f", Moon)
        var Jupiter = (FirstString as NSString).floatValue;
        Jupiter = Jupiter*2.4;
        print(Jupiter)
        JupiterWeight.text = String(format: "%.2f", Jupiter)
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if(segue.identifier == "fromThirdToFirst"){
            let des = segue.destination as! ViewController;
            des.ComingFromMoon="Coming From Jupiter";
        }
        if(segue.identifier == "FromThird"){
            let nes = segue.destination as! ViewController2;
            nes.ComingFromJupiter = "Coming From Jupiter"
            nes.FirstString = FirstString
        }
    }
}
