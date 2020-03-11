//
//  QRManager.swift
//  QR Gen
//
//  Created by Andrew on 3/11/20.
//  Copyright © 2020 Andrii Halabuda. All rights reserved.
//

import Foundation
import CoreImage

public class QrManager {
    static func generateQR(from: String) -> CIImage?  {
        let data = from.data(using: .utf8, allowLossyConversion: false)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setValue(data, forKey: "inputMessage")
        filter?.setValue("Q", forKey: "inputCorrectionLevel")
        return filter?.outputImage
    }
}
