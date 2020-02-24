//
//  ViewController.swift
//  ImageFileManager
//
//  Created by HanulYun-Comp on 2020/02/24.
//  Copyright © 2020 Yun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate let imageView: UIImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
            
        // Save Image
        let uniqueFileName: String
          = "(ProcessInfo.processInfo.globallyUniqueString).jpeg"
        ImageFileManager.shared.saveImage(image: UIImage(), name: uniqueFileName) { [weak self] onSuccess in
          print("saveImage onSuccess: \(onSuccess)")
        }
        
        // Get Image
        if let image: UIImage = ImageFileManager.shared.getSavedImage(named: uniqueFileName) {
            imageView.image = image
        }
        
        // Delete Image
        ImageFileManager.shared.deleteImage(named: uniqueFileName) { [weak self] onSuccess in
            print("delete = \(onSuccess)")
        }
    }
}

