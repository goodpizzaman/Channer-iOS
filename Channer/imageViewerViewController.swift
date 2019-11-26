//
//  imageViewerViewController.swift
//  Channer
//
//  Created by x on 3/31/19.
//  Copyright © 2019 x. All rights reserved.
//

import UIKit



class imageViewerViewController: UIViewController, UIScrollViewDelegate{

    @IBOutlet weak var imageScroll: UIScrollView!
    @IBOutlet weak var image: UIImageView!
    var filename = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageScroll.minimumZoomScale = 1.0
        imageScroll.maximumZoomScale = 5.0

        let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let nsUserDomainMask    = FileManager.SearchPathDomainMask.userDomainMask
        let paths               = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
        if let dirPath          = paths.first
        {
            let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent("images/\(filename)")
            print("imageURL: \(imageURL.path)")
            let imagePass    = UIImage(contentsOfFile: imageURL.path)

            image.image = imagePass
            
        }

    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return image
    }
   
}
