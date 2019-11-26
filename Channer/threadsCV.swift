//
//  threadsCV.swift
//  
//
//  Created by x on 4/15/19.
//

import UIKit
import Alamofire
import SwiftyJSON
import Haneke
import DeviceKit

private let reuseIdentifier = "boardCVCell"

class threadsCV: UICollectionViewController {
    
    @IBOutlet var threadsCVOutlet: UICollectionView!
    
    var boardName = ""
    var boardAbv = ""
    var totalThreadCount = 0
    var allThreadNumbers = [String]()
    
    //Threads First Reply Data
    var threadStats = [String]()
    var threadFirstComments = [String]()
    var threadImages = [String]()
    var threadTitles = [String]()


    override func viewDidLoad() {
        super.viewDidLoad()

        getBoardData(page: 1)

        // Do any additional setup after loading the view.
    }

    func getBoardData(page: Int){
        print("getting boardData for: \(boardName) - \(boardAbv)")
        print("https://a.4cdn.org/\(boardAbv)/\(page).json")
        
        request("https://a.4cdn.org/\(boardAbv)/\(page).json", method: .get)
            .responseJSON { response in
                if response.data != nil {
                    //print(response)
                    
                    do{
                        let json = try JSON(data: response.data!)
                        
                        let threadsCount = json["threads"].count
                        print("threadsCount: \(threadsCount)")
                        self.totalThreadCount = self.totalThreadCount + threadsCount
                        
                        /*
                         for i in 0...threadsCount-1{
                         print("📌 \(i)")
                         
                         let threadNumber = json["threads"][i]["posts"][0]["no"]
                         print("threadNumber: \(threadNumber)")
                         
                         request("https://a.4cdn.org/b/thread/\(threadNumber).json", method: .get)
                         .responseJSON { response in
                         if response.data != nil {
                         //print(response)
                         
                         do{
                         let json = try JSON(data: response.data!)
                         print("⭕️⭕️⭕️⭕️⭕️⭕️⭕️⭕️")
                         print("Replies: \(json)")
                         }
                         catch{
                         print("error threadJSON")
                         }
                         }
                         }
                         }
                         */
                        
                        
                        for i in 0...threadsCount-1{
                            
                            let threadNumber = json["threads"][i]["posts"][0]["no"]
                            //print("threadNumber: \(threadNumber)")
                            
                            
                            request("https://a.4cdn.org/\(self.boardAbv)/thread/\(threadNumber).json", method: .get)
                                .responseJSON { response in
                                    if response.data != nil {
                                        //print(response)
                                        
                                        do{
                                            
                                            self.allThreadNumbers.append(String(describing: threadNumber))
                                            
                                            let json = try JSON(data: response.data!)
                                            print("⭕️⭕️⭕️⭕️⭕️⭕️⭕️⭕️")
                                            //print("Replies: \(json)")
                                            print("💡")
                                            let replyOne = json["posts"][0]
                                            //print("replyOne: \(replyOne)")
                                            
                                            //--- Replies Count/Images Count
                                            let newStat = "\(json["posts"][0]["replies"])/\(json["posts"][0]["images"])"
                                            print("newStat: \(newStat)")
                                            self.threadStats.append(newStat)
                                            
                                            //--- Thread titles
                                            var threadTitle = String(describing: json["posts"][0]["sub"])
                                            print("threadTitle: \(threadTitle)")
                                            
                                            //Green quote - <span class="quote">&gt; and </span>
                                            threadTitle = threadTitle.replacingOccurrences(of: "<span class=\"quote\">&gt;", with: "⭕️")
                                            threadTitle = threadTitle.replacingOccurrences(of: "</span>", with: "")
                                            
                                            
                                            //Next line - <br>
                                            threadTitle = threadTitle.replacingOccurrences(of: "<br>", with: "\n")
                                            
                                            //' - &#039;
                                            threadTitle = threadTitle.replacingOccurrences(of: "&#039;", with: "'")
                                            
                                            //Spoilers - <s> and </s>
                                            threadTitle = threadTitle.replacingOccurrences(of: "<s>", with: "‼️")
                                            threadTitle = threadTitle.replacingOccurrences(of: "</s>", with: "‼️")
                                            
                                            //> - &gt;
                                            threadTitle = threadTitle.replacingOccurrences(of: "&gt;", with: ">")
                                            
                                            //" - &quot;
                                            threadTitle = threadTitle.replacingOccurrences(of: "&quot;", with: "\"")
                                            
                                            //word break - <wbr>
                                            threadTitle = threadTitle.replacingOccurrences(of: "<wbr>", with: "")
                                            
                                            //& - &amp;
                                            threadTitle = threadTitle.replacingOccurrences(of: "&amp;", with: "&")
                                            
                                            
                                            self.threadTitles.append(threadTitle)
                                            
                                            
                                            
                                            
                                            //--- First comment
                                            var firstComment = String(describing: json["posts"][0]["com"])
                                            print("firstComment: \(firstComment)")
                                            
                                            if firstComment == "null"{
                                                firstComment = ""
                                            }
                                            
                                            //--- Format comment - decode html
                                            
                                            //Green quote - <span class="quote">&gt; and </span>
                                            firstComment = firstComment.replacingOccurrences(of: "<span class=\"quote\">&gt;", with: "⭕️")
                                            firstComment = firstComment.replacingOccurrences(of: "</span>", with: "")
                                            
                                            
                                            //Next line - <br>
                                            firstComment = firstComment.replacingOccurrences(of: "<br>", with: "\n")
                                            
                                            //' - &#039;
                                            firstComment = firstComment.replacingOccurrences(of: "&#039;", with: "'")
                                            
                                            //Spoilers - <s> and </s>
                                            firstComment = firstComment.replacingOccurrences(of: "<s>", with: "‼️")
                                            firstComment = firstComment.replacingOccurrences(of: "</s>", with: "‼️")
                                            
                                            //> - &gt;
                                            firstComment = firstComment.replacingOccurrences(of: "&gt;", with: ">")
                                            
                                            //" - &quot;
                                            firstComment = firstComment.replacingOccurrences(of: "&quot;", with: "\"")
                                            
                                            //word break - <wbr>
                                            firstComment = firstComment.replacingOccurrences(of: "<wbr>", with: "")
                                            
                                            //& - &amp;
                                            firstComment = firstComment.replacingOccurrences(of: "&amp;", with: "&")
                                            
                                            self.threadFirstComments.append(String(describing: firstComment))
                                            
                                            //---Picture name
                                            let pictureName = "\(json["posts"][0]["tim"])\(json["posts"][0]["ext"])"
                                            //print("pictureName: \(pictureName)")
                                            let completePicture =  "https://i.4cdn.org/\(self.boardAbv)/\(pictureName)"
                                            print("complete picture URL: \(completePicture)")
                                            self.threadImages.append(completePicture)
                                            
                                            //---Reload data of tableview ???
                                            print("totalThreadCount: \(self.totalThreadCount)")
                                            print("threadFirstComments.count: \(self.threadFirstComments.count)")
                                            if self.totalThreadCount == self.threadFirstComments.count{
                                                print("🏁🏁🏁🏁🏁🏁🏁")
                                                self.threadsCVOutlet.reloadData()
                                            }
                                            
                                        }
                                        catch{
                                            print("error threadJSON")
                                        }
                                    }
                            }
                            
                        }
                        
                        
                        print("page: \(page)")
                        if page != 10{
                            print("📌Next page")
                            self.getBoardData(page: page + 1)
                        }
                        
                        
                        /*
                         let firstReply = json["threads"][0]["posts"][0]
                         print(firstReply)
                         
                         let threadNumber = json["threads"][0]["posts"][0]["no"]
                         print("threadNumber: \(threadNumber)")
                         */
                        
                        
                        
                        
                    }
                    catch{
                        print("error getBoardData")
                    }
                    
                }
        }
        
    }

    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return totalThreadCount
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "threadsCell", for: indexPath) as! threadsCell
    
        if totalThreadCount == 0{
            cell.topicStats.text = "Loading..."
            cell.topicTextNoTitle.text = "Loading..."
        }
        else{
            cell.topicStats.text = threadStats[indexPath.row]
            
            if threadTitles[indexPath.row] == "null"{
                cell.topicTextTitle.isHidden = true
                cell.topicTextNoTitle.isHidden = false
                cell.topicTextNoTitle.text = threadFirstComments[indexPath.row]
                cell.topicTitle.isHidden = true
                cell.topicTitle.text = ""
            }
            else{
                cell.topicTextTitle.isHidden = false
                cell.topicTextNoTitle.isHidden = true
                cell.topicTextTitle.text = threadFirstComments[indexPath.row]
                cell.topicTitle.isHidden = false
                cell.topicTitle.text = threadTitles[indexPath.row]
            }
            
            if threadImages[indexPath.row].contains(".webm"){
                print("📌cell image is a webm")
                var webmThumb = threadImages[indexPath.row]
                webmThumb = webmThumb.replacingOccurrences(of: ".webm", with: "")
                webmThumb = webmThumb + "s.jpg"
                print("webmThumb: \(webmThumb)")
                
                let imageURL = URL(string: webmThumb)
                cell.topicImage.hnk_setImageFromURL(imageURL!)
                cell.topicImage.layer.cornerRadius = 12
            }
            else{
                let imageURL = URL(string: threadImages[indexPath.row])
                cell.topicImage.hnk_setImageFromURL(imageURL!)
            }
            
            cell.topicImage.layer.cornerRadius = 12
            
        }
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let device = Device.current
        
        if device.isPhone == true{
            
            
            if device == .iPhone11ProMax || device == .iPhoneXSMax || device == .simulator(.iPhone11ProMax){
                let vc = UIStoryboard(name: "iPhone Max", bundle: nil).instantiateViewController(withIdentifier: "threadRepliesTV") as! threadRepliesTV
                vc.boardAbv = boardAbv
                print("boardAbv: \(boardAbv)")
                vc.threadNumber = allThreadNumbers[indexPath.row]
                print("threadNumber: \(allThreadNumbers[indexPath.row])")
                
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else if device == .iPhone11Pro || device == .iPhoneXS || device == .iPhoneX{
                let vc = UIStoryboard(name: "iPhone X", bundle: nil).instantiateViewController(withIdentifier: "threadRepliesTV") as! threadRepliesTV
                vc.boardAbv = boardAbv
                print("boardAbv: \(boardAbv)")
                vc.threadNumber = allThreadNumbers[indexPath.row]
                print("threadNumber: \(allThreadNumbers[indexPath.row])")
                
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else if device == .iPhone11 || device == .iPhoneXR || device == .simulator(.iPhone11){
                let vc = UIStoryboard(name: "iPhone 11", bundle: nil).instantiateViewController(withIdentifier: "threadRepliesTV") as! threadRepliesTV
                vc.boardAbv = boardAbv
                print("boardAbv: \(boardAbv)")
                vc.threadNumber = allThreadNumbers[indexPath.row]
                print("threadNumber: \(allThreadNumbers[indexPath.row])")
                
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else if device == .iPhone8 || device == .iPhone7 || device == .iPhone6s || device == .simulator(.iPhone8){
                let vc = UIStoryboard(name: "iPhone 8", bundle: nil).instantiateViewController(withIdentifier: "threadRepliesTV") as! threadRepliesTV
                vc.boardAbv = boardAbv
                print("boardAbv: \(boardAbv)")
                vc.threadNumber = allThreadNumbers[indexPath.row]
                print("threadNumber: \(allThreadNumbers[indexPath.row])")
                
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else if device == .iPhone8Plus || device == .iPhone7Plus || device == .iPhone6sPlus || device == .simulator(.iPhone8Plus){
                let vc = UIStoryboard(name: "iPhone 8 Plus", bundle: nil).instantiateViewController(withIdentifier: "threadRepliesTV") as! threadRepliesTV
                vc.boardAbv = boardAbv
                print("boardAbv: \(boardAbv)")
                vc.threadNumber = allThreadNumbers[indexPath.row]
                print("threadNumber: \(allThreadNumbers[indexPath.row])")
            }
            else if device == .iPhoneSE || device == .simulator(.iPhoneSE) || device == .iPodTouch7{
                let vc = UIStoryboard(name: "iPhone SE", bundle: nil).instantiateViewController(withIdentifier: "threadRepliesTV") as! threadRepliesTV
                vc.boardAbv = boardAbv
                print("boardAbv: \(boardAbv)")
                vc.threadNumber = allThreadNumbers[indexPath.row]
                print("threadNumber: \(allThreadNumbers[indexPath.row])")
            }
            
        }
        else if device.isPad == true{
            
            
            if device == .iPadPro12Inch || device == .iPadPro12Inch2 || device == .iPadPro12Inch3 || device == .simulator(.iPadPro12Inch3){
                let vc = UIStoryboard(name: "iPad13", bundle: nil).instantiateViewController(withIdentifier: "threadRepliesCV") as! threadRepliesCV
                vc.boardAbv = boardAbv
                print("boardAbv: \(boardAbv)")
                vc.threadNumber = allThreadNumbers[indexPath.row]
                print("threadNumber: \(allThreadNumbers[indexPath.row])")
            
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else if device == .iPadPro11Inch || device == .simulator(.iPadPro11Inch){
                let vc = UIStoryboard(name: "iPad11", bundle: nil).instantiateViewController(withIdentifier: "threadRepliesCV") as! threadRepliesCV
                    vc.boardAbv = boardAbv
                    print("boardAbv: \(boardAbv)")
                    vc.threadNumber = allThreadNumbers[indexPath.row]
                    print("threadNumber: \(allThreadNumbers[indexPath.row])")
                
                    self.navigationController?.pushViewController(vc, animated: true)
            }
            else if device == .iPadPro10Inch || device == .simulator(.iPadPro10Inch) || device == .iPadAir3{
            
                let vc = UIStoryboard(name: "iPad105", bundle: nil).instantiateViewController(withIdentifier: "threadRepliesCV") as! threadRepliesCV
                    vc.boardAbv = boardAbv
                    print("boardAbv: \(boardAbv)")
                    vc.threadNumber = allThreadNumbers[indexPath.row]
                    print("threadNumber: \(allThreadNumbers[indexPath.row])")
                
                    self.navigationController?.pushViewController(vc, animated: true)
            
            }
            else if device == .iPad7 || device == .simulator(.iPad7){
            
               let vc = UIStoryboard(name: "iPad102", bundle: nil).instantiateViewController(withIdentifier: "threadRepliesCV") as! threadRepliesCV
                   vc.boardAbv = boardAbv
                   print("boardAbv: \(boardAbv)")
                   vc.threadNumber = allThreadNumbers[indexPath.row]
                   print("threadNumber: \(allThreadNumbers[indexPath.row])")
               
                   self.navigationController?.pushViewController(vc, animated: true)
            
            }
            else if device == .iPadPro9Inch || device == .simulator(.iPadPro9Inch) || device == .iPad6 || device == .iPad5 || device == .iPadAir2 || device == .iPadMini5 || device == .iPadMini4{
                let vc = UIStoryboard(name: "iPad97", bundle: nil).instantiateViewController(withIdentifier: "threadRepliesCV") as! threadRepliesCV
                    vc.boardAbv = boardAbv
                    print("boardAbv: \(boardAbv)")
                    vc.threadNumber = allThreadNumbers[indexPath.row]
                    print("threadNumber: \(allThreadNumbers[indexPath.row])")
                
                    self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
        /*
        //iPhone - threadRepliesTV
        //iPad - threadRepliesCV
        
        vc.boardAbv = boardAbv
        print("boardAbv: \(boardAbv)")
        vc.threadNumber = allThreadNumbers[indexPath.row]
        print("threadNumber: \(allThreadNumbers[indexPath.row])")
        
        self.navigationController?.pushViewController(vc, animated: true)
        */
    }
 
}
