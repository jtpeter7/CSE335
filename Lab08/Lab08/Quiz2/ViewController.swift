//
//  ViewController.swift
//  Quiz2
//
//  Created by jtpeter7 on 2/5/20.
//  Copyright © 2020 jtpeter7. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Monkey: UIImageView!
    @IBOutlet weak var a1: UIImageView!
    @IBOutlet weak var a2: UIImageView!
    @IBOutlet weak var a3: UIImageView!
    @IBOutlet weak var a4: UIImageView!
    @IBOutlet weak var thetimer: UILabel!
    var seconds = 20;
    var timer = Timer()
    
    var ix = 0;
    var iy = 0;
    var t1=false;
    var t2=false;
    var t3=false;
    var t4=false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runTimer()
    }
    
    func runTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if(!(t1 && t2 && t3 && t4)){
            if(seconds > 0){
                seconds -= 1;
                thetimer.text = "\(seconds)"
            }
        }
        if (seconds == 0){
            thetimer.text = "loser"
            
        }
        if(seconds == -1){
            thetimer.text = "winner"
        }
        
        if(t1 && t2 && t3 && t4){
            print("test")
            seconds = -1;
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collide(){
        var pos1 = self.Monkey.center.x + CGFloat(16*ix)
        var pos11 = self.Monkey.center.y + CGFloat(16*iy)
        var pos2 = self.a1.center
        var pos3 = self.a2.center
        var pos4 = self.a3.center
        var pos5 = self.a4.center
        //print( pos1, ",",pos11)
        if(abs(pos1-pos2.x) < 32 && abs(pos11-pos2.y) < 32 ){
            self.a1.isHidden=true
            t1=true;
        }
        if(abs(pos1-pos3.x) < 32 && abs(pos11-pos3.y) < 32 ){
            self.a2.isHidden=true
            t2=true;
        }
        if(abs(pos1-pos4.x) < 32 && abs(pos11-pos4.y) < 32 ){
            self.a3.isHidden=true
            t3=true;
        }
        if(abs(pos1-pos5.x) < 32 && abs(pos11-pos5.y) < 32 ){
            self.a4.isHidden=true
            t4=true;
        }
    }
    
    @IBAction func Up(_ sender: Any) {
        iy -= 1
        self.Monkey.transform = CGAffineTransform(translationX: CGFloat(16 * ix), y: CGFloat(16 * iy))
        collide();
    }
    @IBAction func Right(_ sender: Any) {
        ix += 1
        self.Monkey.transform = CGAffineTransform(translationX: CGFloat(16 * ix), y: CGFloat(16 * iy))
        collide();
    }
    @IBAction func Down(_ sender: Any) {
        iy += 1
        self.Monkey.transform = CGAffineTransform(translationX: CGFloat(16 * ix), y: CGFloat(16 * iy))
        collide();
    }
    @IBAction func Left(_ sender: Any) {
        ix -= 1
        self.Monkey.transform = CGAffineTransform(translationX: CGFloat(16 * ix), y: CGFloat(16 * iy))
        collide();
    }
}
