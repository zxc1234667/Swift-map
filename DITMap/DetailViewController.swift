//
//  DetailViewController.swift
//  DITMap
//
//  Created by D7702_09 on 2017. 9. 13..
//  Copyright © 2017년 김종현. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var mapImg: UIImageView!
    
    @IBOutlet weak var mapText: UILabel!
    
    var mapImg1: String?
    var mapText1: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapText.text = mapText1
        mapImg.image = UIImage(named: mapImg1!)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
