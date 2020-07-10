//
//  ViewController.swift
//  Quiz2
//
//  Created by jtpeter7 on 2/5/20.
//  Copyright © 2020 jtpeter7. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var ComingFromMoon:String!;
    @IBOutlet weak var EarthWeight: UITextField!
    @IBOutlet weak var FromMoon: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        FromMoon.text=ComingFromMoon;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let des = segue.destination as! ViewController2;
        if(segue.identifier == "toView2"){
            des.FirstString = EarthWeight.text;
            des.ComingFromJupiter="Coming From Earth";
        }
    }
}

