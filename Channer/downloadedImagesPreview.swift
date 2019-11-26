//
//  downloadedImagesPreview.swift
//  Channer
//
//  Created by x on 9/10/19.
//  Copyright © 2019 x. All rights reserved.
//

import UIKit
import DeviceKit

private let reuseIdentifier = "downloadedImages"

class downloadedImagesPreview: UICollectionViewController {
    
    var fileLocations = [URL]()
    var filenames = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("fileLocations: \(fileLocations)")
        print("filenames: \(filenames)")

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return fileLocations.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let device = Device.current
        
        if filenames[indexPath.row].contains(".jpg") || filenames[indexPath.row].contains(".png"){
            
            if device.isPhone == true{
                           
                if device == .iPhone11ProMax || device == .iPhoneXSMax || device == .simulator(.iPhone11ProMax){
                    let imageVC = UIStoryboard(name: "iPhone Max", bundle: nil).instantiateViewController(withIdentifier: "imageViewer") as! imageViewerViewController
                    imageVC.filename = filenames[indexPath.row]
                    self.navigationController?.pushViewController(imageVC, animated: true)
                }
                               
                else if device == .iPhone11Pro || device == .iPhoneXS || device == .iPhoneX{
                    let imageVC = UIStoryboard(name: "iPhone X", bundle: nil).instantiateViewController(withIdentifier: "imageViewer") as! imageViewerViewController
                    imageVC.filename = filenames[indexPath.row]
                    self.navigationController?.pushViewController(imageVC, animated: true)
                }
                
                else if device == .iPhone11 || device == .iPhoneXR || device == .simulator(.iPhone11){
                    let imageVC = UIStoryboard(name: "iPhone 11", bundle: nil).instantiateViewController(withIdentifier: "imageViewer") as! imageViewerViewController
                    imageVC.filename = filenames[indexPath.row]
                    self.navigationController?.pushViewController(imageVC, animated: true)
                }
                else if device == .iPhone8 || device == .iPhone7 || device == .iPhone6s || device == .simulator(.iPhone8){
                    let imageVC = UIStoryboard(name: "iPhone 8", bundle: nil).instantiateViewController(withIdentifier: "imageViewer") as! imageViewerViewController
                    imageVC.filename = filenames[indexPath.row]
                    self.navigationController?.pushViewController(imageVC, animated: true)
                }
                else if device == .iPhone8Plus || device == .iPhone7Plus || device == .iPhone6sPlus || device == .simulator(.iPhone8Plus){
                    let imageVC = UIStoryboard(name: "iPhone 8 Plus", bundle: nil).instantiateViewController(withIdentifier: "imageViewer") as! imageViewerViewController
                    imageVC.filename = filenames[indexPath.row]
                    self.navigationController?.pushViewController(imageVC, animated: true)
                }
                else if device == .iPhoneSE || device == .simulator(.iPhoneSE) || device == .iPodTouch7{
                    let imageVC = UIStoryboard(name: "iPhone SE", bundle: nil).instantiateViewController(withIdentifier: "imageViewer") as! imageViewerViewController
                    imageVC.filename = filenames[indexPath.row]
                    self.navigationController?.pushViewController(imageVC, animated: true)
                }
            }
                       
            else if device.isPad == true{
                               
                if device == .iPadPro12Inch3 || device == .iPadPro12Inch || device == .iPadPro12Inch2 || device == .simulator(.iPadPro12Inch3){
                    let imageVC = UIStoryboard(name: "iPad13", bundle: nil).instantiateViewController(withIdentifier: "imageViewer") as! imageViewerViewController
                    imageVC.filename = filenames[indexPath.row]
                    self.navigationController?.pushViewController(imageVC, animated: true)
                }
                else if device == .iPadPro11Inch || device == .simulator(.iPadPro11Inch){
                    let imageVC = UIStoryboard(name: "iPad11", bundle: nil).instantiateViewController(withIdentifier: "imageViewer") as! imageViewerViewController
                    imageVC.filename = filenames[indexPath.row]
                    self.navigationController?.pushViewController(imageVC, animated: true)
                }
                else if device == .iPadPro10Inch || device == .simulator(.iPadPro10Inch) || device == .iPadAir3{
                    let imageVC = UIStoryboard(name: "iPad105", bundle: nil).instantiateViewController(withIdentifier: "imageViewer") as! imageViewerViewController
                    imageVC.filename = filenames[indexPath.row]
                    self.navigationController?.pushViewController(imageVC, animated: true)
                    
                
                }
                else if device == .iPad7 || device == .simulator(.iPad7){
                    let imageVC = UIStoryboard(name: "iPad102", bundle: nil).instantiateViewController(withIdentifier: "imageViewer") as! imageViewerViewController
                    imageVC.filename = filenames[indexPath.row]
                    self.navigationController?.pushViewController(imageVC, animated: true)
                   
                
                }
                else if device == .iPadPro9Inch || device == .simulator(.iPadPro9Inch) || device == .iPad6 || device == .iPad5 || device == .iPadAir2 || device == .iPadMini5 || device == .iPadMini4{
                    let imageVC = UIStoryboard(name: "iPad97", bundle: nil).instantiateViewController(withIdentifier: "imageViewer") as! imageViewerViewController
                    imageVC.filename = filenames[indexPath.row]
                    self.navigationController?.pushViewController(imageVC, animated: true)
                }
            }
            
            
        }
        else if filenames[indexPath.row].contains(".webm"){
            
            if device.isPhone == true{
                           
                if device == .iPhone11ProMax || device == .iPhoneXSMax || device == .simulator(.iPhone11ProMax){
                    let webmVC = UIStoryboard(name: "iPhone Max", bundle: nil).instantiateViewController(withIdentifier: "webmVC") as! webmVC
                    webmVC.filename = filenames[indexPath.row]
                    self.navigationController?.pushViewController(webmVC, animated: true)
                }
                               
                else if device == .iPhone11Pro || device == .iPhoneXS || device == .iPhoneX{
                    let webmVC = UIStoryboard(name: "iPhone X", bundle: nil).instantiateViewController(withIdentifier: "webmVC") as! webmVC
                    webmVC.filename = filenames[indexPath.row]
                    self.navigationController?.pushViewController(webmVC, animated: true)
                }
                
                else if device == .iPhone11 || device == .iPhoneXR || device == .simulator(.iPhone11){
                    let webmVC = UIStoryboard(name: "iPhone 11", bundle: nil).instantiateViewController(withIdentifier: "webmVC") as! webmVC
                    webmVC.filename = filenames[indexPath.row]
                    self.navigationController?.pushViewController(webmVC, animated: true)
                }
                else if device == .iPhone8 || device == .iPhone7 || device == .iPhone6s || device == .simulator(.iPhone8){
                    let webmVC = UIStoryboard(name: "iPhone 8", bundle: nil).instantiateViewController(withIdentifier: "webmVC") as! webmVC
                    webmVC.filename = filenames[indexPath.row]
                    self.navigationController?.pushViewController(webmVC, animated: true)
                }
                else if device == .iPhone8Plus || device == .iPhone7Plus || device == .iPhone6sPlus || device == .simulator(.iPhone8Plus){
                    let webmVC = UIStoryboard(name: "iPhone 8 Plus", bundle: nil).instantiateViewController(withIdentifier: "webmVC") as! webmVC
                    webmVC.filename = filenames[indexPath.row]
                    self.navigationController?.pushViewController(webmVC, animated: true)
                }
                else if device == .iPhoneSE || device == .simulator(.iPhoneSE) || device == .iPodTouch7{
                    let webmVC = UIStoryboard(name: "iPhone SE", bundle: nil).instantiateViewController(withIdentifier: "webmVC") as! webmVC
                    webmVC.filename = filenames[indexPath.row]
                    self.navigationController?.pushViewController(webmVC, animated: true)
                }
            }
                       
            else if device.isPad == true{
                               
                if device == .iPadPro12Inch3 || device == .iPadPro12Inch || device == .iPadPro12Inch2 || device == .simulator(.iPadPro12Inch3){
                    let webmVC = UIStoryboard(name: "iPad13", bundle: nil).instantiateViewController(withIdentifier: "webmVC") as! webmVC
                    webmVC.filename = filenames[indexPath.row]
                    self.navigationController?.pushViewController(webmVC, animated: true)
                }
                else if device == .iPadPro11Inch || device == .simulator(.iPadPro11Inch){
                    let webmVC = UIStoryboard(name: "iPad11", bundle: nil).instantiateViewController(withIdentifier: "webmVC") as! webmVC
                    webmVC.filename = filenames[indexPath.row]
                    self.navigationController?.pushViewController(webmVC, animated: true)
                }
                else if device == .iPadPro10Inch || device == .simulator(.iPadPro10Inch) || device == .iPadAir3{
                    let webmVC = UIStoryboard(name: "iPad105", bundle: nil).instantiateViewController(withIdentifier: "webmVC") as! webmVC
                    webmVC.filename = filenames[indexPath.row]
                    self.navigationController?.pushViewController(webmVC, animated: true)
                    
                
                }
                else if device == .iPad7 || device == .simulator(.iPad7){
                    let webmVC = UIStoryboard(name: "iPad102", bundle: nil).instantiateViewController(withIdentifier: "webmVC") as! webmVC
                    webmVC.filename = filenames[indexPath.row]
                    self.navigationController?.pushViewController(webmVC, animated: true)
                   
                
                }
                else if device == .iPadPro9Inch || device == .simulator(.iPadPro9Inch) || device == .iPad6 || device == .iPad5 || device == .iPadAir2 || device == .iPadMini5 || device == .iPadMini4{
                    let webmVC = UIStoryboard(name: "iPad97", bundle: nil).instantiateViewController(withIdentifier: "webmVC") as! webmVC
                    webmVC.filename = filenames[indexPath.row]
                    self.navigationController?.pushViewController(webmVC, animated: true)
                }
            }
    
        }
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! downloadedImageCell

        let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let nsUserDomainMask    = FileManager.SearchPathDomainMask.userDomainMask
        let paths               = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
        if let dirPath          = paths.first
        {
            let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent("images/\(filenames[indexPath.row])")
            print("imageURL: \(imageURL.path)")
            let imagePass    = UIImage(contentsOfFile: imageURL.path)

            cell.imagePreview.image = imagePass
            
        }
        
        
    
        return cell
    }

}
