//
//  ViewController.swift
//  QR Gen
//
//  Created by Andrew on 3/11/20.
//  Copyright © 2020 Andrii Halabuda. All rights reserved.
//

import UIKit
import EFQRCode
import CoreImage

class ViewController: UIViewController {
    
    @IBOutlet weak var qrImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
         
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
//        qrImage.image = UIImage(ciImage: QrManager.generateQR(from: "hello")!)
        if let tryImage = EFQRCode.generate(
            content: "https://github.com/EFPrefix/EFQRCode",
            watermark: UIImage(named: "circle.png")?.cgImage,
            pointShape: .diamond
        ) {
            print("Create QRCode image success: \(tryImage)")
            qrImage.image = UIImage(cgImage: tryImage)
        } else {
            print("Create QRCode image failed!")
        }
    }


}

