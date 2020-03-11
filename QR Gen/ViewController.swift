//
//  ViewController.swift
//  QR Gen
//
//  Created by Andrew on 3/11/20.
//  Copyright © 2020 Andrii Halabuda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var qrImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
         
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        qrImage.image = UIImage(ciImage: QrManager.generateQR(from: "hello")!)
    }


}

