//
//  ViewController2.swift
//  Quiz2
//
//  Created by jtpeter7 on 2/5/20.
//  Copyright © 2020 jtpeter7. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    var FirstString:String!;
    var fromFirst:Int!;
    var data:String?
    var ComingFromJupiter:String!
    @IBOutlet weak var EarthWeight: UILabel!
    @IBOutlet weak var MoonWeight: UILabel!
    @IBOutlet weak var FromJupiter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FromJupiter.text=ComingFromJupiter;
        print(FirstString);
        EarthWeight.text = FirstString;
        var Moon = (FirstString as NSString).floatValue;
        //var Moon:Int! = fromFirst;
        Moon = (Moon/6);
        print(Moon)
        MoonWeight.text = String(format: "%.2f", Moon)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if(segue.identifier == "FromSecond"){
            let des = segue.destination as! ViewController;
            des.ComingFromMoon="Coming From The Moon";
        }
        if(segue.identifier == "toView3"){
            let nes = segue.destination as! ViewController3;
            nes.ComingFromMoon="Coming From The Moon";
            nes.FirstString = FirstString
        }
    }
}
