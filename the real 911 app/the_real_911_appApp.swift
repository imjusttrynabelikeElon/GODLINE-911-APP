//
//  the_real_911_appApp.swift
//  the real 911 app
//
//  Created by Karon Bell on 5/14/22.
//

import SwiftUI
import FirebaseCore
import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase
import UIKit
import FirebaseFirestore




@main
struct the_real_911_appApp: App {
     
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
      
    var body: some Scene {
            
        WindowGroup {
            IntroView()
            
        }
        
    }
    
}
  
class AppDelegate: NSObject,UIApplicationDelegate{
      
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
          
        FirebaseApp.configure()
        return true
    }
}




