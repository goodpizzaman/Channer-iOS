//
//  AppDelegate.swift
//  Channer
//
//  Created by x on 3/23/19.
//  Copyright © 2019 x. All rights reserved.
//

import UIKit
import DeviceKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Picks storyboard needed for user device
        let sb = selectSB()
        self.window?.rootViewController = sb.instantiateInitialViewController()
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    //TODO Choose storyboard
    
    
    
    func selectSB() -> UIStoryboard{
        print("Selecting Storyboard")
        var sb = UIStoryboard()
           
        let device = Device.current
           
           print("Device: \(device)")     // prints, for example, "iPhone 6 Plus"
        
        if device.isPhone == true{
            
            if device == .iPhone11ProMax || device == .iPhoneXSMax || device == .simulator(.iPhone11ProMax){
                    sb = UIStoryboard(name: "iPhone Max", bundle: nil)
            }
                
            else if device == .iPhone11Pro || device == .iPhoneXS || device == .iPhoneX{
                    sb = UIStoryboard(name: "iPhone X", bundle: nil)
            }
            
            else if device == .iPhone11 || device == .iPhoneXR || device == .simulator(.iPhone11){
                    sb = UIStoryboard(name: "iPhone 11", bundle: nil)
            }
            
            else if device == .iPhone8 || device == .iPhone7 || device == .iPhone6s || device == .simulator(.iPhone8){
                sb = UIStoryboard(name: "iPhone 8", bundle: nil)
            }
            else if device == .iPhone8Plus || device == .iPhone7Plus || device == .iPhone6sPlus || device == .simulator(.iPhone8Plus){
                sb = UIStoryboard(name: "iPhone 8 Plus", bundle: nil)
            }
            else if device == .iPhoneSE || device == .simulator(.iPhoneSE) || device == .iPodTouch7{
                sb = UIStoryboard(name: "iPhone SE", bundle: nil)
            }
        }
        
        else if device.isPad == true{
                
            if device == .iPadPro12Inch3 || device == .iPadPro12Inch || device == .iPadPro12Inch2 || device == .simulator(.iPadPro12Inch3){
                sb = UIStoryboard(name: "iPad13", bundle: nil)
            }
            else if device == .iPadPro11Inch || device == .simulator(.iPadPro11Inch){
                sb = UIStoryboard(name: "iPad11", bundle: nil)
            }
            else if device == .iPadPro10Inch || device == .simulator(.iPadPro10Inch) || device == .iPadAir3{
                sb = UIStoryboard(name: "iPad105", bundle: nil)
            }
            else if device == .iPad7 || device == .simulator(.iPad7){
                sb = UIStoryboard(name: "iPad102", bundle: nil)
            }
            else if device == .iPadPro9Inch || device == .simulator(.iPadPro9Inch) || device == .iPad6 || device == .iPad5 || device == .iPadAir2 || device == .iPadMini5 || device == .iPadMini4{
                sb = UIStoryboard(name: "iPhone97", bundle: nil)
            }
            
        }
           
           return sb
       }

}

