//
//  UIColor.swift
//  KnowNotes3
//
//  Created by Wylan L Neely on 2/18/24.
//

import Foundation
import UIKit


extension UIImage {
    
    
    func returnBlackWhiteImage()->UIImage?{
        guard let currentCGImage = self.cgImage else {
            print("Error Converting UIImage to CGI Image")
            return nil
        }
        
        let currentCIImage = CIImage(cgImage: currentCGImage)
        
        let filter = CIFilter(name: "CIColorMonochrome")
        filter?.setValue(currentCIImage, forKey: "inputImage")
        
        // set a gray value for the tint color
        filter?.setValue(CIColor(red: 0.7, green: 0.7, blue: 0.7), forKey: "inputColor")
        
        filter?.setValue(1.0, forKey: "inputIntensity")
        guard let outputImage = filter?.outputImage else {
            print("Error applying filter to UIImage")
            return nil
        }
        
        let context = CIContext()
        
        guard let cgimg = context.createCGImage(outputImage, from: outputImage.extent) else {
            print("error creating cgiimage")
            return nil
        }
        
        return UIImage(cgImage: cgimg)
    }
    
    
}
