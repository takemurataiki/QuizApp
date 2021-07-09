//
//  QuizAppApp.swift
//  QuizApp
//
//  Created by 竹村　太喜 on 2021/05/05.
//

import SwiftUI
// import文を追加する
import UIKit
import GoogleMobileAds

// AppDelegateクラスを定義する
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Mobile Ads SDKを初期化する
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        
        // データ初期読み込み
        UserDefaults.standard.register(defaults: ["Level1Array" : [Level1]()])
        UserDefaults.standard.register(defaults: ["Level2Array" : [Level2]()])
        UserDefaults.standard.register(defaults: ["Level3Array" : [Level3]()])
                
        return true
        
    }
}

@main
struct QuizAppApp: App {
    // SwiftUI AppライフサイクルにAppDelegateクラスを注入する
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(QuizViewModel())
        }
    }
}
