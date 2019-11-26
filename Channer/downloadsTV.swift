//
//  downloadsTV.swift
//  Channer
//
//  Created by x on 3/31/19.
//  Copyright © 2019 x. All rights reserved.
//

import UIKit
import DeviceKit

class downloadsTV: UITableViewController {
    
    var fileLocations = [URL]()
    var filenames = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("fileLocations: \(fileLocations)")
        print("filenames: \(filenames)")
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fileLocations.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "downloadsCell", for: indexPath) as! downloadsCell

        cell.filename.text = filenames[indexPath.row]

        return cell
    }

}
