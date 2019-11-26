//
//  threadRepliesTV.swift
//  Channer
//
//  Created by x on 3/24/19.
//  Copyright © 2019 x. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Haneke
import DeviceKit

class threadRepliesTV: UITableViewController {
    
    @IBOutlet var threadTV: UITableView!
    var boardAbv = ""
    var threadNumber = ""
    
    //Thread Data
    var replyCount = 0
    //New
    var threadReplies = [String]()
    var threadBoardReplyNumber = [String]()
    var threadBoardReplies = [String : [String]]()
    var threadRepliesImages = [String]()
    //Old
    var threadRepliesOld = [String]()
    var threadBoardReplyNumberOld = [String]()
    var threadRepliesImagesOld = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("threadRepliesTV")
        
        let refreshButton = UIBarButtonItem(image: UIImage(named: "refreshWVx50"), style: .plain, target: self, action: #selector(threadRepliesTV.refresh))
        let goDown = UIBarButtonItem(image: UIImage(named: "downx50"), style: .plain, target: self, action: #selector(threadRepliesTV.down))
        navigationItem.rightBarButtonItems = [refreshButton, goDown]

        getThreadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @objc func refresh(){
        //Refresh thread
        print("Refreshing thread")
        replyCount = 0
        threadReplies.removeAll()
        threadBoardReplyNumber.removeAll()
        threadRepliesImages.removeAll()
        threadBoardReplies.removeAll()
        threadTV.reloadData()
        getThreadData()
    }
    
    @objc func down(){
        //go down the tableview
        print("Down the TV")
        let lastRow: Int = self.threadTV.numberOfRows(inSection: 0) - 1
        let indexPath = IndexPath(row: lastRow, section: 0);
        self.threadTV.scrollToRow(at: indexPath, at: .top, animated: false)
    }

    func getThreadData(){
        print("getThreadData")
        print("Getting data from \(boardAbv) of \(threadNumber)")
        
        request("https://a.4cdn.org/\(self.boardAbv)/thread/\(self.threadNumber).json", method: .get)
            .responseJSON { response in
                if response.data != nil {
                    //print(response)
                    //Get data of (1)board reply number, (Tableview indexPath.row) thread reply number, (2)reply image, (3)reply text
                    
                    do{
                        let json = try JSON(data: response.data!)
                        print("⭕️⭕️⭕️⭕️⭕️⭕️⭕️⭕️")
                        //print("Replies: \(json)")
                        print("💡")
                        
                        
                        //--- Replies Count
                        self.replyCount = Int(json["posts"][0]["replies"].stringValue)!
                        print("replyCount: \(self.replyCount)")
                        
                        var forLimit = 0
                        if self.replyCount == 1{
                            forLimit = 1
                            print("1🏁🏁🏁🏁🏁🏁🏁")
                        }
                        else if self.replyCount == 0{
                            
                            //---(1)Thread board reply number
                            print(String(describing: json["posts"][0]["no"]))
                            self.threadBoardReplyNumber.append(String(describing: json["posts"][0]["no"]))
                            
                            //---(2)Reply image url
                            let pictureName = "\(json["posts"][0]["tim"])\(json["posts"][0]["ext"])"
                            //print("pictureName: \(pictureName)")
                            let completePicture =  "https://i.4cdn.org/\(self.boardAbv)/\(pictureName)"
                            print("complete picture URL: \(completePicture)")
                            self.threadRepliesImages.append(completePicture)
                            
                            //---(3)comment
                            var comment = String(describing: json["posts"][0]["com"])
                            print("🔺comment: \(comment)")
                            
                            //--- Format comment - decode html
                            
                            //Green quote - <span class="quote">&gt; and </span>
                            comment = comment.replacingOccurrences(of: "<span class=\"quote\">&gt;", with: "⭕️")
                            comment = comment.replacingOccurrences(of: "</span>", with: "")
                            
                            
                            //Next line - <br>
                            comment = comment.replacingOccurrences(of: "<br>", with: "\n")
                            
                            //' - &#039;
                            comment = comment.replacingOccurrences(of: "&#039;", with: "'")
                            
                            //Spoilers - <s> and </s>
                            comment = comment.replacingOccurrences(of: "<s>", with: "‼️")
                            comment = comment.replacingOccurrences(of: "</s>", with: "‼️")
                            
                            //> - &gt;
                            comment = comment.replacingOccurrences(of: "&gt;", with: ">")
                            
                            //" - &quot;
                            comment = comment.replacingOccurrences(of: "&quot;", with: "\"")
                            
                            //word break - <wbr>
                            comment = comment.replacingOccurrences(of: "<wbr>", with: "")
                            
                            //& - &amp;
                            comment = comment.replacingOccurrences(of: "&amp;", with: "&")
                            
                            self.threadReplies.append(String(describing: comment))
       
                        }
                        else{
                            forLimit = self.replyCount - 1
                        }
                        
                        if self.replyCount != 0{
                        print("📌FOR")
                            for i in 0...forLimit{
                        
                                //---(1)Thread board reply number
                                self.threadBoardReplyNumber.append(String(describing: json["posts"][i]["no"]))
                                
                                //---(2)Reply image url
                                let pictureName = "\(json["posts"][i]["tim"])\(json["posts"][i]["ext"])"
                                //print("pictureName: \(pictureName)")
                                let completePicture =  "https://i.4cdn.org/\(self.boardAbv)/\(pictureName)"
                                print("complete picture URL: \(completePicture)")
                                self.threadRepliesImages.append(completePicture)
                        
                                //---(3)comment
                                var comment = String(describing: json["posts"][i]["com"])
                                print("🔺comment: \(comment)")
                        
                                //--- Format comment - decode html
                        
                                //Green quote - <span class="quote">&gt; and </span>
                                comment = comment.replacingOccurrences(of: "<span class=\"quote\">&gt;", with: "⭕️")
                                comment = comment.replacingOccurrences(of: "</span>", with: "")
                        
                        
                                //Next line - <br>
                                comment = comment.replacingOccurrences(of: "<br>", with: "\n")
                        
                                //' - &#039;
                                comment = comment.replacingOccurrences(of: "&#039;", with: "'")
                        
                                //Spoilers - <s> and </s>
                                comment = comment.replacingOccurrences(of: "<s>", with: "‼️")
                                comment = comment.replacingOccurrences(of: "</s>", with: "‼️")
                        
                                //> - &gt;
                                comment = comment.replacingOccurrences(of: "&gt;", with: ">")
                        
                                //" - &quot;
                                comment = comment.replacingOccurrences(of: "&quot;", with: "\"")
                                
                                //word break - <wbr>
                                comment = comment.replacingOccurrences(of: "<wbr>", with: "")
                                
                                //& - &amp;
                                comment = comment.replacingOccurrences(of: "&amp;", with: "&")
                        
                                self.threadReplies.append(String(describing: comment))

                                //---🏁 Reload data of tableview ???
                                print("self.replyCount \(self.replyCount)")
                                print("self.threadReplies.count: \(self.threadReplies.count)")
                                if self.replyCount == self.threadReplies.count{
                                    print(">1🏁🏁🏁🏁🏁🏁🏁")
                                    
                                    self.structureThreadReplies()
                                    //self.threadTV.reloadData()
                                }
                            }
                        }
                        else if self.replyCount == 0{
                            print("0🏁🏁🏁🏁🏁🏁🏁")
                            self.replyCount = 1
                                                      
                            self.structureThreadReplies()
                            //self.threadTV.reloadData()
                        }
                    }
                    catch{
                        print("error threadJSON")
                    }
                }
    }
        
        
    }
    
    func structureThreadReplies(){
        //Structure replies of comments
        //<a href="#p477639035" class="quotelink">&gt;&gt;477639035</a>
        
        for i in 0...threadReplies.count-1{
            print("threadReplies[i]: \(threadReplies[i])")
            if threadReplies[i].contains("class=\"quotelink\""){
                
                for a in 0...threadBoardReplyNumber.count - 1{
                    
                    if threadReplies[i].contains(threadBoardReplyNumber[a]){
                        //Remove quoteLink
                        print("🔶Before threadReplies[i]: \(threadReplies[i])")
                        let removeString = "<a href=\"#p\(threadBoardReplyNumber[a])\" class=\"quotelink\">>>\(threadBoardReplyNumber[a])</a>"
                        print("removeString: \(removeString)")
                        threadReplies[i] = threadReplies[i].replacingOccurrences(of: removeString, with: "").replacingOccurrences(of: "^\\s*", with: "", options: .regularExpression)
                        print("🔷After threadReplies[i]: \(threadReplies[i])")
                        
                        //Add to threadBoardReplies
                        if threadBoardReplies[threadBoardReplyNumber[a]] == nil{
                            threadBoardReplies[threadBoardReplyNumber[a]] = [threadBoardReplyNumber[i]]
                        }
                        else{
                            threadBoardReplies[threadBoardReplyNumber[a]]!.append(threadBoardReplyNumber[i])
                        }
                        print("threadBoardReplies[threadBoardReplyNumber[a]]: \(String(describing: threadBoardReplies[threadBoardReplyNumber[a]]))")
                        
                    }
                    
                }
                
            }
            
        }
        
        print("threadBoardReplies: \(threadBoardReplies)")
        
        self.threadTV.reloadData()
    }
    
    @objc func threadContentOpen(sender: UIButton){
        print("threadContentOpen")
        
        let content = threadRepliesImages[sender.tag]
        print("content: \(content)")
        let device = Device.current
        
        if content.contains(".png") || content.contains(".jpg")  || content.contains(".gif"){
            print("content is a picture")
            
            if device.isPhone == true{
            
                if device == .iPhone11ProMax || device == .iPhoneXSMax || device == .simulator(.iPhone11ProMax){
                    let urlVC = UIStoryboard(name: "iPhone Max", bundle: nil).instantiateViewController(withIdentifier: "urlWebview") as! urlWeb
                    urlVC.urlPass = content
                    self.navigationController?.pushViewController(urlVC, animated: true)
                }
                
                else if device == .iPhone11Pro || device == .iPhoneXS || device == .iPhoneX{
                    let urlVC = UIStoryboard(name: "iPhone X", bundle: nil).instantiateViewController(withIdentifier: "urlWebview") as! urlWeb
                    urlVC.urlPass = content
                    self.navigationController?.pushViewController(urlVC, animated: true)
                }
                
                else if device == .iPhone11 || device == .iPhoneXR || device == .simulator(.iPhone11){
                    let urlVC = UIStoryboard(name: "iPhone 11", bundle: nil).instantiateViewController(withIdentifier: "urlWebview") as! urlWeb
                    urlVC.urlPass = content
                    self.navigationController?.pushViewController(urlVC, animated: true)
                }
                else if device == .iPhone8 || device == .iPhone7 || device == .iPhone6s || device == .simulator(.iPhone8){
                    let urlVC = UIStoryboard(name: "iPhone 8", bundle: nil).instantiateViewController(withIdentifier: "urlWebview") as! urlWeb
                    urlVC.urlPass = content
                    self.navigationController?.pushViewController(urlVC, animated: true)
                }
                else if device == .iPhone8Plus || device == .iPhone7Plus || device == .iPhone6sPlus || device == .simulator(.iPhone8Plus){
                    let urlVC = UIStoryboard(name: "iPhone 8 Plus", bundle: nil).instantiateViewController(withIdentifier: "urlWebview") as! urlWeb
                    urlVC.urlPass = content
                    self.navigationController?.pushViewController(urlVC, animated: true)
                }
                else if device == .iPhoneSE || device == .simulator(.iPhoneSE) || device == .iPodTouch7{
                    let urlVC = UIStoryboard(name: "iPhone SE", bundle: nil).instantiateViewController(withIdentifier: "urlWebview") as! urlWeb
                    urlVC.urlPass = content
                    self.navigationController?.pushViewController(urlVC, animated: true)
                }
            }
        
            else if device.isPad == true{
                
                if device == .iPadPro12Inch3 || device == .iPadPro12Inch || device == .iPadPro12Inch2 || device == .simulator(.iPadPro12Inch3){
                    let urlVC = UIStoryboard(name: "iPad13", bundle: nil).instantiateViewController(withIdentifier: "urlWebview") as! urlWeb
                    urlVC.urlPass = content
                    self.navigationController?.pushViewController(urlVC, animated: true)
                }
                else if device == .iPadPro11Inch || device == .simulator(.iPadPro11Inch){
                    let urlVC = UIStoryboard(name: "iPad11", bundle: nil).instantiateViewController(withIdentifier: "urlWebview") as! urlWeb
                    urlVC.urlPass = content
                    self.navigationController?.pushViewController(urlVC, animated: true)
                }
                else if device == .iPadPro10Inch || device == .simulator(.iPadPro10Inch) || device == .iPadAir3{
                    let urlVC = UIStoryboard(name: "iPad105", bundle: nil).instantiateViewController(withIdentifier: "urlWebview") as! urlWeb
                    urlVC.urlPass = content
                    self.navigationController?.pushViewController(urlVC, animated: true)
                    
                
                }
                else if device == .iPad7 || device == .simulator(.iPad7){
                    let urlVC = UIStoryboard(name: "iPad102", bundle: nil).instantiateViewController(withIdentifier: "urlWebview") as! urlWeb
                    urlVC.urlPass = content
                    self.navigationController?.pushViewController(urlVC, animated: true)
                   
                
                }
                else if device == .iPadPro9Inch || device == .simulator(.iPadPro9Inch) || device == .iPad6 || device == .iPad5 || device == .iPadAir2 || device == .iPadMini5 || device == .iPadMini4{
                    let urlVC = UIStoryboard(name: "iPad97", bundle: nil).instantiateViewController(withIdentifier: "urlWebview") as! urlWeb
                    urlVC.urlPass = content
                    self.navigationController?.pushViewController(urlVC, animated: true)
                }
            }

        }
        
        else if content.contains(".webm"){
            
            if device.isPhone == true{
                
                    if device == .iPhone11ProMax || device == .iPhoneXSMax || device == .simulator(.iPhone11ProMax) || device == .simulator(.iPhone11ProMax){
                        let webmVC = UIStoryboard(name: "iPhone Max", bundle: nil).instantiateViewController(withIdentifier: "webmVC") as! webmVC
                        webmVC.url = content
                        self.navigationController?.pushViewController(webmVC, animated: true)
                    }
                    
                    else if device == .iPhone11Pro || device == .iPhoneXS || device == .iPhoneX{
                       let webmVC = UIStoryboard(name: "iPhone X", bundle: nil).instantiateViewController(withIdentifier: "webmVC") as! webmVC
                       webmVC.url = content
                       self.navigationController?.pushViewController(webmVC, animated: true)
                    }
                
                    else if device == .iPhone11 || device == .iPhoneXR || device == .simulator(.iPhone11){
                       let webmVC = UIStoryboard(name: "iPhone 11", bundle: nil).instantiateViewController(withIdentifier: "webmVC") as! webmVC
                       webmVC.url = content
                       self.navigationController?.pushViewController(webmVC, animated: true)
                    }
                    else if device == .iPhone8 || device == .iPhone7 || device == .iPhone6s || device == .simulator(.iPhone8){
                        let webmVC = UIStoryboard(name: "iPhone 8", bundle: nil).instantiateViewController(withIdentifier: "webmVC") as! webmVC
                        webmVC.url = content
                        self.navigationController?.pushViewController(webmVC, animated: true)
                    }
                    else if device == .iPhone8Plus || device == .iPhone7Plus || device == .iPhone6sPlus || device == .simulator(.iPhone8Plus){
                        let webmVC = UIStoryboard(name: "iPhone 8 Plus", bundle: nil).instantiateViewController(withIdentifier: "webmVC") as! webmVC
                        webmVC.url = content
                        self.navigationController?.pushViewController(webmVC, animated: true)
                    }
                    else if device == .iPhoneSE || device == .simulator(.iPhoneSE) || device == .iPodTouch7{
                        let webmVC = UIStoryboard(name: "iPhone SE", bundle: nil).instantiateViewController(withIdentifier: "webmVC") as! webmVC
                        webmVC.url = content
                        self.navigationController?.pushViewController(webmVC, animated: true)
                    }
            }
            
            else if device.isPad == true{
                    
                    if device == .iPadPro12Inch3 || device == .iPadPro12Inch || device == .iPadPro12Inch2 || device == .simulator(.iPadPro12Inch3){
                       let webmVC = UIStoryboard(name: "iPad13", bundle: nil).instantiateViewController(withIdentifier: "webmVC") as! webmVC
                       webmVC.url = content
                       self.navigationController?.pushViewController(webmVC, animated: true)
                   }
                    else if device == .iPadPro11Inch || device == .simulator(.iPadPro11Inch){
                        let webmVC = UIStoryboard(name: "iPad11", bundle: nil).instantiateViewController(withIdentifier: "webmVC") as! webmVC
                        webmVC.url = content
                        self.navigationController?.pushViewController(webmVC, animated: true)
                    }
                else if device == .iPadPro10Inch || device == .simulator(.iPadPro10Inch) || device == .iPadAir3{
                        let webmVC = UIStoryboard(name: "iPad105", bundle: nil).instantiateViewController(withIdentifier: "webmVC") as! webmVC
                        webmVC.url = content
                        self.navigationController?.pushViewController(webmVC, animated: true)
                    
                
                }
                else if device == .iPad7 || device == .simulator(.iPad7){
                        let webmVC = UIStoryboard(name: "iPad102", bundle: nil).instantiateViewController(withIdentifier: "webmVC") as! webmVC
                        webmVC.url = content
                        self.navigationController?.pushViewController(webmVC, animated: true)
                   
                
                }
                else if device == .iPadPro9Inch || device == .simulator(.iPadPro9Inch) || device == .iPad6 || device == .iPad5 || device == .iPadAir2 || device == .iPadMini5 || device == .iPadMini4{
                    let webmVC = UIStoryboard(name: "iPad97", bundle: nil).instantiateViewController(withIdentifier: "webmVC") as! webmVC
                    webmVC.url = content
                    self.navigationController?.pushViewController(webmVC, animated: true)
                }
            }
            
        }
        
    }
    
    @objc func showThread(sender: UIButton){
        print("showThread")
        let tag = sender.tag
        
        //navBarButtons
        let goDown = UIBarButtonItem(image: UIImage(named: "downx50"), style: .plain, target: self, action: #selector(threadRepliesTV.down))
        let showCompleteThread = UIBarButtonItem(image: UIImage(named: "completeThreadx50"), style: .plain, target: self, action: #selector(threadRepliesTV.completeThread))
        navigationItem.rightBarButtonItems = [goDown, showCompleteThread]
        
        /*
            var threadReplies = [String]()
            var threadBoardReplyNumber = [String]()
            var threadBoardReplies = [String : [String]]()
            var threadRepliesImages = [String]()
        */
        
        //Save
        threadRepliesOld = threadReplies
        threadBoardReplyNumberOld = threadBoardReplyNumber
        threadRepliesImagesOld = threadRepliesImages
        //Delete for TV
        threadReplies.removeAll()
        threadBoardReplyNumber.removeAll()
        threadRepliesImages.removeAll()
        
        //Organize TV for thread
        let thread = threadBoardReplies[threadBoardReplyNumberOld[tag]]
        print("thread: \(thread)")
        print("threadBoardReplyNumberOld: \(threadBoardReplyNumberOld)")
        
        //add first board number
        var threadWithFirst = [threadBoardReplyNumberOld[tag]]
        //add the rest of the comments borad numbers
        for i in 0...thread!.count - 1{
            threadWithFirst.append(thread![i])
        }
        
        threadBoardReplyNumber = threadWithFirst
        
        //comments contents
        for i in 0...threadBoardReplyNumber.count - 1{
            
            for a in 0...threadBoardReplyNumberOld.count - 1{
                
                if threadBoardReplyNumberOld[a] == threadBoardReplyNumber[i]{
                    threadReplies.append(threadRepliesOld[a])
                    threadRepliesImages.append(threadRepliesImagesOld[a])
                }
                
            }
            
        }
        
        print("🗿")
        print("threadReplies: \(threadReplies)")
        replyCount = threadReplies.count
        
        threadTV.reloadData()
        
    }
    
    @objc func completeThread(){
        //Show full thread
        
        //navBarButtons
        let refreshButton = UIBarButtonItem(image: UIImage(named: "refreshWVx50"), style: .plain, target: self, action: #selector(threadRepliesTV.refresh))
        let goDown = UIBarButtonItem(image: UIImage(named: "downx50"), style: .plain, target: self, action: #selector(threadRepliesTV.down))
        navigationItem.rightBarButtonItems = [refreshButton, goDown]
        
        threadReplies = threadRepliesOld
        threadBoardReplyNumber = threadBoardReplyNumberOld
        threadRepliesImages = threadRepliesImagesOld
        
        threadRepliesOld.removeAll()
        threadBoardReplyNumberOld.removeAll()
        threadRepliesImagesOld.removeAll()
        
        print("🗿")
        print("threadReplies: \(threadReplies)")
        replyCount = threadReplies.count
        
        threadTV.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return replyCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "threadReplyCell", for: indexPath) as! threadRepliesCell
        
        print("📌threadReplies: \(threadReplies.count) - Current cell #: \(indexPath.row)")
        
        if threadReplies.isEmpty{
            cell.boardReplyCount.text = "Loading..."
            cell.threadReplyCount.text = "Loading..."
            cell.replyText.text = "Loading..."
        }
        else{
            
            print("threadRepliesImages[indexPath.row]: \(threadRepliesImages[indexPath.row])")
            
            cell.boardReplyCount.text = threadBoardReplyNumber[indexPath.row]
            
            //thread?
            print("threadBoardReplyNumber[indexPath.row]: \(threadBoardReplyNumber[indexPath.row])")
            print("threadBoardReplies[threadBoardReplyNumber[indexPath.row]]?.isEmpty: \(String(describing: threadBoardReplies[threadBoardReplyNumber[indexPath.row]]?.isEmpty))")
            if threadBoardReplies[threadBoardReplyNumber[indexPath.row]]?.isEmpty == false && threadRepliesOld.isEmpty == true && threadBoardReplies[threadBoardReplyNumber[indexPath.row]]?.isEmpty != nil {
                cell.thread.isHidden = false
                cell.thread.tag = indexPath.row
                cell.thread.addTarget(self, action: #selector(showThread), for: .touchUpInside)
            }
            else if threadRepliesOld.isEmpty == false || threadBoardReplies[threadBoardReplyNumber[indexPath.row]]?.isEmpty == nil{
                cell.thread.isHidden = true
            }
            
            cell.threadReplyCount.text = String(indexPath.row + 1)
            
            if threadRepliesImages[indexPath.row].contains("nullnull"){
                cell.replyTextNoImage.isHidden = false
                cell.replyText.isHidden = true
                cell.threadImage.isHidden = true
                cell.replyTextNoImage.text = threadReplies[indexPath.row].replacingOccurrences(of: "null", with: "")
                print("reply - No image: \(threadReplies[indexPath.row].replacingOccurrences(of: "null", with: ""))")
            }
            else{
                
                cell.replyTextNoImage.isHidden = true
                cell.replyText.isHidden = false
                cell.threadImage.isHidden = false
                
                cell.replyText.text = threadReplies[indexPath.row].replacingOccurrences(of: "null", with: "")
                print("reply - image: \(threadReplies[indexPath.row].replacingOccurrences(of: "null", with: ""))")
                
                
                if threadRepliesImages[indexPath.row].contains(".webm"){
                    print("📌cell image is a webm")
                    var webmThumb = threadRepliesImages[indexPath.row]
                    webmThumb = webmThumb.replacingOccurrences(of: ".webm", with: "")
                    webmThumb = webmThumb + "s.jpg"
                    print("webmThumb: \(webmThumb)")
                    
                    let imageURL = URL(string: webmThumb)
                    
                    cell.threadImage.hnk_setBackgroundImageFromURL(imageURL!)
                    cell.threadImage.layer.cornerRadius = 15
                }
                else{
                    let imageURL = URL(string: threadRepliesImages[indexPath.row])
                    
                    cell.threadImage.hnk_setBackgroundImageFromURL(imageURL!)                    
                }
                
                cell.threadImage.tag = indexPath.row
                cell.threadImage.layer.cornerRadius = 15
                cell.threadImage.addTarget(self, action: #selector(threadContentOpen), for: .touchUpInside)
                 
            }
  
        }

        return cell
    }


}
