//
//  ViewControllerGames.swift
//  HMWK1
//
//  Created by jtpeter7 on 3/7/20.
//  Copyright © 2020 jtpeter7. All rights reserved.
//

import UIKit

class ViewControllerGames: UIViewController {

    @IBOutlet weak var game1: UILabel!
    @IBOutlet weak var game2: UILabel!
    @IBOutlet weak var game3: UILabel!
    @IBOutlet weak var game4: UILabel!
    @IBOutlet weak var game5: UILabel!
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
    var t1="";
    var t2="";
    var t3="";
    var t4="";
    var t5="";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game1.text=t1;
        game2.text=t2;
        game3.text=t3;
        game4.text=t4;
        game5.text=t5;
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "ret1"){
            if let viewController: ViewController = segue.destination as? ViewController {
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
    }
}
