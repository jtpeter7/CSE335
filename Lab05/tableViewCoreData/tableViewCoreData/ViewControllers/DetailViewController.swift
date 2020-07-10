//
//  DetailViewController.swift
//  tableViewCoreData
//
//  Created by jtpeter7 on 3/19/20.
//  Copyright © 2020 ASU. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var selectedCity:String?
    var selectedImage:NSData?
    var selectedDescription:String?
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var cityDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityName.text = selectedCity;
        cityDescription.text=selectedDescription;
        //cityImage.image = UIImage(data: selectedImage as! Data);
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
