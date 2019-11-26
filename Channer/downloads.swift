//
//  downloads.swift
//  Channer
//
//  Created by x on 3/31/19.
//  Copyright © 2019 x. All rights reserved.
//

import UIKit
import DeviceKit

class downloads: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func showDLTV(type: String){
        print("showDLTV")
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = URL(fileURLWithPath: paths).appendingPathComponent(type)
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        do {
            let fileURLs = try fileManager.contentsOfDirectory(at: url, includingPropertiesForKeys: nil)
            print("📌Picture paths:")
            print(fileURLs)
            
            //filenames
            var filenames = [String]()
            let test = String(describing: url)
            print("test: \(test)")
            
            for i in 0...fileURLs.count - 1{
                print("fileURLs: " + String(describing: fileURLs[i]))
                
                
                //Simulator
                //filenames.append(String(describing: fileURLs[i]).replacingOccurrences(of: String(describing: url), with: ""))
                //Real device
                let text2 = url.absoluteString.replacingOccurrences(of: "file:///var/", with: "file:///private/var/")
                print("text2: \(text2)")
                filenames.append(String(describing: fileURLs[i]).replacingOccurrences(of: String(describing: text2), with: ""))
            }
            
            // process files
            let device = Device.current
            if type == "images"{
                
                if device.isPhone == true{
                    
                    if device == .iPhone11ProMax || device == .iPhoneXSMax || device == .simulator(.iPhone11ProMax){
                            let dlvc = UIStoryboard(name: "iPhone Max", bundle: nil).instantiateViewController(withIdentifier: "downloadImages") as! downloadedImagesPreview
                            dlvc.fileLocations = fileURLs
                            dlvc.filenames = filenames
                            self.navigationController?.pushViewController(dlvc, animated: true)
                    }
                        
                    else if device == .iPhone11Pro || device == .iPhoneXS || device == .iPhoneX{
                            let dlvc = UIStoryboard(name: "iPhone X", bundle: nil).instantiateViewController(withIdentifier: "downloadImages") as! downloadedImagesPreview
                            dlvc.fileLocations = fileURLs
                            dlvc.filenames = filenames
                            self.navigationController?.pushViewController(dlvc, animated: true)
                    }
                    
                    else if device == .iPhone11 || device == .iPhoneXR || device == .simulator(.iPhone11){
                            let dlvc = UIStoryboard(name: "iPhone 11", bundle: nil).instantiateViewController(withIdentifier: "downloadImages") as! downloadedImagesPreview
                            dlvc.fileLocations = fileURLs
                            dlvc.filenames = filenames
                            self.navigationController?.pushViewController(dlvc, animated: true)
                    }
                    
                    else if device == .iPhone8 || device == .iPhone7 || device == .iPhone6s || device == .simulator(.iPhone8){
                        let dlvc = UIStoryboard(name: "iPhone 8", bundle: nil).instantiateViewController(withIdentifier: "downloadImages") as! downloadedImagesPreview
                        dlvc.fileLocations = fileURLs
                        dlvc.filenames = filenames
                        self.navigationController?.pushViewController(dlvc, animated: true)
                    }
                    else if device == .iPhone8Plus || device == .iPhone7Plus || device == .iPhone6sPlus || device == .simulator(.iPhone8Plus){
                        let dlvc = UIStoryboard(name: "iPhone 8 Plus", bundle: nil).instantiateViewController(withIdentifier: "downloadImages") as! downloadedImagesPreview
                        dlvc.fileLocations = fileURLs
                        dlvc.filenames = filenames
                        self.navigationController?.pushViewController(dlvc, animated: true)
                    }
                    else if device == .iPhoneSE || device == .simulator(.iPhoneSE) || device == .iPodTouch7{
                        let dlvc = UIStoryboard(name: "iPhone SE", bundle: nil).instantiateViewController(withIdentifier: "downloadImages") as! downloadedImagesPreview
                        dlvc.fileLocations = fileURLs
                        dlvc.filenames = filenames
                        self.navigationController?.pushViewController(dlvc, animated: true)
                    }
                }
                
                else if device.isPad == true{
                        
                    if device == .iPadPro12Inch3 || device == .iPadPro12Inch || device == .iPadPro12Inch2 || device == .simulator(.iPadPro12Inch3){
                            let dlvc = UIStoryboard(name: "iPad13", bundle: nil).instantiateViewController(withIdentifier: "downloadImages") as! downloadedImagesPreview
                            dlvc.fileLocations = fileURLs
                            dlvc.filenames = filenames
                            self.navigationController?.pushViewController(dlvc, animated: true)
                    }
                    else if device == .iPadPro11Inch || device == .simulator(.iPadPro11Inch){
                        let dlvc = UIStoryboard(name: "iPad11", bundle: nil).instantiateViewController(withIdentifier: "downloadImages") as! downloadedImagesPreview
                        dlvc.fileLocations = fileURLs
                        dlvc.filenames = filenames
                        self.navigationController?.pushViewController(dlvc, animated: true)
                    }
                    else if device == .iPadPro10Inch || device == .simulator(.iPadPro10Inch) || device == .iPadAir3{
                    
                        let dlvc = UIStoryboard(name: "iPad105", bundle: nil).instantiateViewController(withIdentifier: "downloadImages") as! downloadedImagesPreview
                        dlvc.fileLocations = fileURLs
                        dlvc.filenames = filenames
                        self.navigationController?.pushViewController(dlvc, animated: true)
                    
                    }
                    else if device == .iPad7 || device == .simulator(.iPad7){
                    
                       let dlvc = UIStoryboard(name: "iPad102", bundle: nil).instantiateViewController(withIdentifier: "downloadImages") as! downloadedImagesPreview
                       dlvc.fileLocations = fileURLs
                       dlvc.filenames = filenames
                       self.navigationController?.pushViewController(dlvc, animated: true)
                    
                    }
                    else if device == .iPadPro9Inch || device == .simulator(.iPadPro9Inch) || device == .iPad6 || device == .iPad5 || device == .iPadAir2 || device == .iPadMini5 || device == .iPadMini4{
                        let dlvc = UIStoryboard(name: "iPad97", bundle: nil).instantiateViewController(withIdentifier: "downloadImages") as! downloadedImagesPreview
                        dlvc.fileLocations = fileURLs
                        dlvc.filenames = filenames
                        self.navigationController?.pushViewController(dlvc, animated: true)
                    }
                }
            }
            else if type == "webms"{
                
                if device.isPhone == true{
                    
                    if device == .iPhone11ProMax || device == .iPhoneXSMax || device == .simulator(.iPhone11ProMax){
                            let dlvc = UIStoryboard(name: "iPhone Max", bundle: nil).instantiateViewController(withIdentifier: "downloadTV") as! downloadsTV
                            dlvc.fileLocations = fileURLs
                            dlvc.filenames = filenames
                            self.navigationController?.pushViewController(dlvc, animated: true)
                    }
                        
                    else if device == .iPhone11Pro || device == .iPhoneXS || device == .iPhoneX{
                            let dlvc = UIStoryboard(name: "iPhone X", bundle: nil).instantiateViewController(withIdentifier: "downloadTV") as! downloadsTV
                            dlvc.fileLocations = fileURLs
                            dlvc.filenames = filenames
                            self.navigationController?.pushViewController(dlvc, animated: true)
                    }
                    
                    else if device == .iPhone11 || device == .iPhoneXR || device == .simulator(.iPhone11){
                            let dlvc = UIStoryboard(name: "iPhone 11", bundle: nil).instantiateViewController(withIdentifier: "downloadTV") as! downloadsTV
                            dlvc.fileLocations = fileURLs
                            dlvc.filenames = filenames
                            self.navigationController?.pushViewController(dlvc, animated: true)
                    }
                    
                    else if device == .iPhone8 || device == .iPhone7 || device == .iPhone6s || device == .simulator(.iPhone8){
                        let dlvc = UIStoryboard(name: "iPhone 8", bundle: nil).instantiateViewController(withIdentifier: "downloadTV") as! downloadsTV
                        dlvc.fileLocations = fileURLs
                        dlvc.filenames = filenames
                        self.navigationController?.pushViewController(dlvc, animated: true)
                    }
                    else if device == .iPhone8Plus || device == .iPhone7Plus || device == .iPhone6sPlus || device == .simulator(.iPhone8Plus){
                        let dlvc = UIStoryboard(name: "iPhone 8 Plus", bundle: nil).instantiateViewController(withIdentifier: "downloadTV") as! downloadsTV
                        dlvc.fileLocations = fileURLs
                        dlvc.filenames = filenames
                        self.navigationController?.pushViewController(dlvc, animated: true)
                    }
                    else if device == .iPhoneSE || device == .simulator(.iPhoneSE) || device == .iPodTouch7{
                        let dlvc = UIStoryboard(name: "iPhone SE", bundle: nil).instantiateViewController(withIdentifier: "downloadTV") as! downloadsTV
                        dlvc.fileLocations = fileURLs
                        dlvc.filenames = filenames
                        self.navigationController?.pushViewController(dlvc, animated: true)
                    }
                }
                
                else if device.isPad == true{
                        
                    if device == .iPadPro12Inch3 || device == .iPadPro12Inch || device == .iPadPro12Inch2 || device == .simulator(.iPadPro12Inch3){
                            let dlvc = UIStoryboard(name: "iPad13", bundle: nil).instantiateViewController(withIdentifier: "downloadTV") as! downloadsTV
                            dlvc.fileLocations = fileURLs
                            dlvc.filenames = filenames
                            self.navigationController?.pushViewController(dlvc, animated: true)
                    }
                    else if device == .iPadPro11Inch || device == .simulator(.iPadPro11Inch){
                        let dlvc = UIStoryboard(name: "iPad11", bundle: nil).instantiateViewController(withIdentifier: "downloadTV") as! downloadsTV
                        dlvc.fileLocations = fileURLs
                        dlvc.filenames = filenames
                        self.navigationController?.pushViewController(dlvc, animated: true)
                    }
                    else if device == .iPadPro10Inch || device == .simulator(.iPadPro10Inch) || device == .iPadAir3{
                    
                        let dlvc = UIStoryboard(name: "iPad105", bundle: nil).instantiateViewController(withIdentifier: "downloadTV") as! downloadsTV
                        dlvc.fileLocations = fileURLs
                        dlvc.filenames = filenames
                        self.navigationController?.pushViewController(dlvc, animated: true)
                    
                    }
                    else if device == .iPad7 || device == .simulator(.iPad7){
                        let dlvc = UIStoryboard(name: "iPad102", bundle: nil).instantiateViewController(withIdentifier: "downloadTV") as! downloadsTV
                        dlvc.fileLocations = fileURLs
                        dlvc.filenames = filenames
                        self.navigationController?.pushViewController(dlvc, animated: true)
                       
                    
                    }
                    else if device == .iPadPro9Inch || device == .simulator(.iPadPro9Inch) || device == .iPad6 || device == .iPad5 || device == .iPadAir2 || device == .iPadMini5 || device == .iPadMini4{
                        let dlvc = UIStoryboard(name: "iPad97", bundle: nil).instantiateViewController(withIdentifier: "downloadTV") as! downloadsTV
                        dlvc.fileLocations = fileURLs
                        dlvc.filenames = filenames
                        self.navigationController?.pushViewController(dlvc, animated: true)
                    }
                }
            }
            
        } catch {
            print("Error while enumerating files \(documentsURL.path): \(error.localizedDescription)")
            //Need pop up message
        }
        
    }

    @IBAction func images(_ sender: Any) {
        print("user viewing images")
        showDLTV(type: "images")
    }
    
    
    
    @IBAction func gifs(_ sender: Any) {
        print("user viewing gifs")
        showDLTV(type: "gifs")
    }
    
    
    @IBAction func webms(_ sender: Any) {
        print("user viewing webms")
        showDLTV(type: "webms")
    }
    
}
