//
//  boardsCV.swift
//  Channer
//
//  Created by x on 3/23/19.
//  Copyright © 2019 x. All rights reserved.
//

import UIKit
import DeviceKit

private let reuseIdentifier = "boardCell"

class boardsCV: UICollectionViewController {
    
    let boardNames = ["Anime & Manga", "Anime/Cute", "Anime/Wallpapers", "Mecha", "Cosplay & EGL", "Cute/Male", "Flash", "Transportation", "Otaku Culture", "Video Games", "Video Game Generals", "Pokémon", "Retro Games", "Comics & Cartoons", "Technology", "Television & Film", "Weapons", "Auto", "Animals & Nature", "Traditional Games", "Sports", "Alternative Sports", "Science & Math", "History & Humanities", "International", "Outdoors", "Toys", "Oekaki", "Papercraft & Origami", "Photography", "Food & Cooking", "Artwork/Critique", "Wallpapers/General", "Literature", "Music", "Fashion", "3DCG", "Graphic Design", "Do-It-Yourself", "Worksafe GIF", "Quests", "Business & Finance", "Travel", "Fitness", "Paranormal", "Advice", "LGBT", "Pony", "Current News", "Worksafe Requests", "Very Important Posts", "Random", "ROBOT9001", "Politically Incorrect", "International/Random", "Cams & Meetups", "Shit 4chan Says", "Sexy Beautiful Women", "Hardcore", "Handsome Men", "Hentai", "Ecchi", "Yuri", "Hentai/Alternative", "Yaoi", "Torrents", "High Resolution", "Adult GIF", "Adult Cartoons", "Adult Requests"]
    let boardsAbv = ["a", "c", "w", "m", "cgl", "cm", "f", "n", "jp", "v", "vg", "vp", "vr", "co", "g", "tv", "k", "o", "an", "tg", "sp", "asp", "sci", "his", "int", "out", "toy", "i", "po", "p", "ck", "ic", "wg", "lit", "mu", "fa", "3", "gd", "diy", "wsg", "qst", "biz", "trv", "fit", "x", "adv", "lgbt", "mlp", "news", "wsr", "vip", "b", "r9k", "pol", "bant", "soc", "s4s", "s", "hc", "hm", "h", "e", "u", "d", "y", "t", "hr", "gif", "aco", "r"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    @IBAction func viewDownloads(_ sender: Any) {
        
        print("Viewing downloads")
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return boardNames.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! boardCVCell
    
        // Configure the cell
        
        cell.boardName.text = boardNames[indexPath.row]
        cell.boardNameAbv.text = "/" + boardsAbv[indexPath.row] + "/"
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let device = Device.current
        print("device: \(device)")
        
        if device.isPhone == true{
            
            
            if device == .iPhone11ProMax || device == .iPhoneXSMax || device == .simulator(.iPhone11ProMax){
                
                let vc = UIStoryboard(name: "iPhone Max", bundle: nil).instantiateViewController(withIdentifier: "boardTV") as! boardTV
                
                vc.boardName = boardNames[indexPath.row]
                vc.boardAbv = boardsAbv[indexPath.row]
                print("boardsAbv[indexPath.row]: \(boardsAbv[indexPath.row])")
                
                vc.title = "/" + boardsAbv[indexPath.row] + "/"
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
            else if device == .iPhone11Pro || device == .iPhoneXS || device == .iPhoneX{

                let vc = UIStoryboard(name: "iPhone X", bundle: nil).instantiateViewController(withIdentifier: "boardTV") as! boardTV
                
                vc.boardName = boardNames[indexPath.row]
                vc.boardAbv = boardsAbv[indexPath.row]
                print("boardsAbv[indexPath.row]: \(boardsAbv[indexPath.row])")
                
                vc.title = "/" + boardsAbv[indexPath.row] + "/"
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
            
            else if device == .iPhone11 || device == .iPhoneXR || device == .simulator(.iPhone11){

                let vc = UIStoryboard(name: "iPhone 11", bundle: nil).instantiateViewController(withIdentifier: "boardTV") as! boardTV
                
                vc.boardName = boardNames[indexPath.row]
                vc.boardAbv = boardsAbv[indexPath.row]
                print("boardsAbv[indexPath.row]: \(boardsAbv[indexPath.row])")
                
                vc.title = "/" + boardsAbv[indexPath.row] + "/"
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
            else if device == .iPhone8 || device == .iPhone7 || device == .iPhone6s || device == .simulator(.iPhone8){
                let vc = UIStoryboard(name: "iPhone 8", bundle: nil).instantiateViewController(withIdentifier: "boardTV") as! boardTV
                
                vc.boardName = boardNames[indexPath.row]
                vc.boardAbv = boardsAbv[indexPath.row]
                print("boardsAbv[indexPath.row]: \(boardsAbv[indexPath.row])")
                
                vc.title = "/" + boardsAbv[indexPath.row] + "/"
                
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else if device == .iPhone8Plus || device == .iPhone7Plus || device == .iPhone6sPlus || device == .simulator(.iPhone8Plus){
                let vc = UIStoryboard(name: "iPhone 8 Plus", bundle: nil).instantiateViewController(withIdentifier: "boardTV") as! boardTV
                               
                               vc.boardName = boardNames[indexPath.row]
                               vc.boardAbv = boardsAbv[indexPath.row]
                               print("boardsAbv[indexPath.row]: \(boardsAbv[indexPath.row])")
                               
                               vc.title = "/" + boardsAbv[indexPath.row] + "/"
                               
                               self.navigationController?.pushViewController(vc, animated: true)
            }
            else if device == .iPhoneSE || device == .simulator(.iPhoneSE) || device == .iPodTouch7{
                let vc = UIStoryboard(name: "iPhone SE", bundle: nil).instantiateViewController(withIdentifier: "boardTV") as! boardTV
                
                vc.boardName = boardNames[indexPath.row]
                vc.boardAbv = boardsAbv[indexPath.row]
                print("boardsAbv[indexPath.row]: \(boardsAbv[indexPath.row])")
                
                vc.title = "/" + boardsAbv[indexPath.row] + "/"
                
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        else if device.isPad == true{
            
            if device == .iPadPro12Inch3 || device == .iPadPro12Inch || device == .iPadPro12Inch2 || device == .simulator(.iPadPro12Inch3){
                let vc = UIStoryboard(name: "iPad13", bundle: nil).instantiateViewController(withIdentifier: "threadsCV") as! threadsCV
            
                vc.boardName = boardNames[indexPath.row]
                vc.boardAbv = boardsAbv[indexPath.row]
                print("boardsAbv[indexPath.row]: \(boardsAbv[indexPath.row])")
            
                vc.title = "/" + boardsAbv[indexPath.row] + "/"
            
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else if device == .iPadPro11Inch || device == .simulator(.iPadPro11Inch){
                let vc = UIStoryboard(name: "iPad11", bundle: nil).instantiateViewController(withIdentifier: "threadsCV") as! threadsCV
                
                    vc.boardName = boardNames[indexPath.row]
                    vc.boardAbv = boardsAbv[indexPath.row]
                    print("boardsAbv[indexPath.row]: \(boardsAbv[indexPath.row])")
                
                    vc.title = "/" + boardsAbv[indexPath.row] + "/"
                
                    self.navigationController?.pushViewController(vc, animated: true)
            }
            else if device == .iPadPro10Inch || device == .simulator(.iPadPro10Inch) || device == .iPadAir3{
                let vc = UIStoryboard(name: "iPad105", bundle: nil).instantiateViewController(withIdentifier: "threadsCV") as! threadsCV
                
                    vc.boardName = boardNames[indexPath.row]
                    vc.boardAbv = boardsAbv[indexPath.row]
                    print("boardsAbv[indexPath.row]: \(boardsAbv[indexPath.row])")
                
                    vc.title = "/" + boardsAbv[indexPath.row] + "/"
                
                    self.navigationController?.pushViewController(vc, animated: true)
                
            
            }
            else if device == .iPad7 || device == .simulator(.iPad7){
                let vc = UIStoryboard(name: "iPad102", bundle: nil).instantiateViewController(withIdentifier: "threadsCV") as! threadsCV
                
                    vc.boardName = boardNames[indexPath.row]
                    vc.boardAbv = boardsAbv[indexPath.row]
                    print("boardsAbv[indexPath.row]: \(boardsAbv[indexPath.row])")
                
                    vc.title = "/" + boardsAbv[indexPath.row] + "/"
                
                    self.navigationController?.pushViewController(vc, animated: true)
               
            
            }
            else if device == .iPadPro9Inch || device == .simulator(.iPadPro9Inch) || device == .iPad6 || device == .iPad5 || device == .iPadAir2 || device == .iPadMini5 || device == .iPadMini4{
                let vc = UIStoryboard(name: "iPad97", bundle: nil).instantiateViewController(withIdentifier: "threadsCV") as! threadsCV
                               
                                   vc.boardName = boardNames[indexPath.row]
                                   vc.boardAbv = boardsAbv[indexPath.row]
                                   print("boardsAbv[indexPath.row]: \(boardsAbv[indexPath.row])")
                               
                                   vc.title = "/" + boardsAbv[indexPath.row] + "/"
                               
                                   self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
        /*
        let vc = UIStoryboard(name: "iPhone", bundle: nil).instantiateViewController(withIdentifier: "threadsCV") as! threadsCV
        //iPhone - boardTV
        //iPad - threadsCV
        
        vc.boardName = boardNames[indexPath.row]
        vc.boardAbv = boardsAbv[indexPath.row]
        print("boardsAbv[indexPath.row]: \(boardsAbv[indexPath.row])")
        
        vc.title = "/" + boardsAbv[indexPath.row] + "/"
        
        self.navigationController?.pushViewController(vc, animated: true)
        */
        
    }

}
