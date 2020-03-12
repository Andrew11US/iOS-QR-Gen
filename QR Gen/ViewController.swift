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
    @IBOutlet weak var contentTextField: UITextField!
    @IBOutlet weak var generateBtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentTextField.delegate = self
    }
    
    @IBAction func generateBtnTapped(sender: Any) {
        contentTextField.resignFirstResponder()
        guard let content = contentTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
        
        if let tryImage = EFQRCode.generate(
            content: content,
            backgroundColor: UIColor.clear.cgColor,
            foregroundColor: UIColor.label.cgColor,
//            watermark: UIImage(named: "circle.png")?.cgImage,
            pointShape: .diamond
        ) {
            qrImage.image = UIImage(cgImage: tryImage)
            shareBtn.isHidden = false
        } else {
            print("Create QRCode image failed!")
        }
    }
    
    @IBAction func shareBtnTapped(sender: Any) {
        let items = [qrImage.image!]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
    }
}

extension ViewController: UITextFieldDelegate {
    // Dismiss keyboard function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Dismiss when return btn pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        contentTextField.resignFirstResponder()
        return true
    }
}

