//
//  urlWeb.swift
//  Channer
//
//  Created by x on 5/17/16.
//  Copyright © 2016 x. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import PMAlertController
import Async

class urlWeb: UIViewController, UIWebViewDelegate{
    
    @IBOutlet var urlWebView: UIWebView!
    @IBOutlet var activity: UIActivityIndicatorView!
    var urlPass = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let yourBackImage = UIImage(named: "backButton")
        self.navigationController?.navigationBar.backIndicatorImage = yourBackImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
        
        print("urlPass: \(urlPass)")
        let url: URL = URL(string: urlPass)!
        let request: URLRequest = URLRequest(url: url)
        print("request: \(request)")
        urlWebView.loadRequest(request)
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        activity.isHidden = false
        activity.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activity.isHidden = true
        activity.stopAnimating()
    }
    
    @IBAction func closeWVNL(_ sender: Any) {
        print("Closed WV NL")
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func download(url: URL, to localUrl: URL) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        let request = try! URLRequest(url: url, method: .get)
        
        let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
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
    
    @IBAction func downloadData(_ sender: Any) {
        print("Download data")
        
        var folderName = ""
        if urlPass.contains("png") || urlPass.contains("jpg"){
            print("Data is a picture")
            folderName = "images"
        }
        else if urlPass.contains("gif"){
            print("Data is a gif")
            folderName = "gifs"
        }
        
        var createDirectory = true
        let fileManager = FileManager.default
        if let tDocumentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let filePath =  tDocumentDirectory.appendingPathComponent("\(folderName)")
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
                print("Saving data now")
                
                let filename = urlPass.replacingOccurrences(of: "https://i.4cdn.org/", with: "").replacingOccurrences(of: "/", with: "-")
                
                
                
                download(url: URL(string: urlPass)!, to: URL(string: "\(tDocumentDirectory)/\(folderName)/\(filename)")!)
                
            }
        }
        
    }
    
    
}

