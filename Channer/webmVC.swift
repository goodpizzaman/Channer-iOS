//
//  webmVC.swift
//  Channer
//
//  Created by x on 3/30/19.
//  Copyright © 2019 x. All rights reserved.
//

import UIKit
import OGVKit
import Alamofire
import PMAlertController
import Async

class webmVC: UIViewController {

    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var webmViewer: UIView!
    var url = ""
    var filename = ""
    var playerView = OGVPlayerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad - webmVC")
        print("url: \(url)")
        
        if url != ""{
            //Internet
            toolbar.isHidden = false
            let webmUrl = URL(string: url)
            playerView.sourceURL = webmUrl
        }
        else{
            //Local
            toolbar.isHidden = true
            
            let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
            let nsUserDomainMask    = FileManager.SearchPathDomainMask.userDomainMask
            let paths               = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
            if let dirPath          = paths.first
            {
                let webmURL = URL(fileURLWithPath: dirPath).appendingPathComponent("webms/\(filename)")
                print("webmURL: \(webmURL.path)")
                playerView.sourceURL = webmURL
            }
        }
        
        playerView.frame = CGRect(x: 0, y: 0, width: webmViewer.frame.width, height: webmViewer.frame.height)
        playerView.contentMode = .scaleAspectFit
        webmViewer.addSubview(playerView)
        playerView.play()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
        playerView.pause()
    }
    
    func download(url: URL, to localUrl: URL) {
        print("Downloading - \(url)")
        
        let sessionConfig = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: sessionConfig)
        let request = try! URLRequest(url: url, method: .get)
        
        let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
            print("webm task")
            
            if let tempLocalUrl = tempLocalUrl, error == nil {
                // Success
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    print("Success: \(statusCode)")
                    if statusCode == 206{
                        print("‼️Partial download")
                        //Need pop up message - error
                        Async.main({
                        let alertVC = PMAlertController(title: "Partial Download", description: "Try again.", image: nil, style: .alert)
                        alertVC.addAction(PMAlertAction(title: "OK", style: .default, action: { () in
                            print("Capture action OK - Partial Download")
                        }))
                        self.present(alertVC, animated: true, completion: nil)
                            })
                    }
                    else if statusCode == 200{
                        
                        do {
                            try FileManager.default.copyItem(at: tempLocalUrl, to: localUrl)
                            print("Download completed")
                            //Need pop up message
                            Async.main({
                            let alertVC = PMAlertController(title: "Download Completed", description: "🥳", image: nil, style: .alert)
                            alertVC.addAction(PMAlertAction(title: "OK", style: .default, action: { () in
                                print("Capture action OK - Download Completed")
                                
                                
                            }))
                            self.present(alertVC, animated: true, completion: nil)
                                })
                            
                        } catch (let writeError) {
                            print("error writing file \(localUrl) : \(writeError)")
                            if writeError.localizedDescription.contains("item with the same name already exists."){
                                print("‼️file name exists")
                                //Need pop up message
                                Async.main({
                                let alertVC = PMAlertController(title: "File exists", description: "You have downloaded this before.", image: nil, style: .alert)
                                alertVC.addAction(PMAlertAction(title: "OK", style: .default, action: { () in
                                    print("Capture action OK - file name exists")
                                }))
                                self.present(alertVC, animated: true, completion: nil)
                                    })
                            }
                        }
                        
                    }
                    
                }
     
            } else {
                print("Failure: %@", error?.localizedDescription);
            }
        }
        task.resume()
    }
   
    @IBAction func downloadWebm(_ sender: Any) {
        print("User wants to download webm")
        var createDirectory = true
        
        let fileManager = FileManager.default
        if let tDocumentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let filePath =  tDocumentDirectory.appendingPathComponent("webms")
            if !fileManager.fileExists(atPath: filePath.path) {
                do {
                    try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                } catch {
                    print("Couldn't create document directory")
                    createDirectory = false
                }
            }
            print("Document directory is \(filePath)")
            
            if createDirectory == true{
                print("Saving webm now")
                
                let filename = url.replacingOccurrences(of: "https://i.4cdn.org/", with: "").replacingOccurrences(of: "/", with: "-")
                download(url: URL(string: url)!, to: URL(string: "\(tDocumentDirectory)/webms/\(filename)")!)
                
            }
            
        }
        
    }

}
