//
//  QuizViewModel.swift
//  QuizApp
//
//  Created by 竹村　太喜 on 2021/05/07.
//

import Foundation
import GoogleMobileAds

class QuizViewModel: ObservableObject {
    
    @Published var bannerView: GADBannerView!
    
    //csvファイルにすべてのデータを読み込む箱
    @Published var csvArray: [String] = []
    
    //一問分のデータを入れる箱
    @Published var quizArray: [String] = []
    
    //問題数
    @Published var quizCount = 0
    
    //正解した数
    @Published var correctCount = 0
    
    //どのレベルを選択したか
    @Published var selectLevel = 0
    
    
    //csvファイルの問題データ入れ込み
    func loadCSV(fileName: String) -> [String] {
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle,encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            csvArray = lineChange.components(separatedBy: "\n")
            csvArray.removeLast()
        } catch {
            print("エラー")
        }
        return csvArray
    }
    
//    //広告をつくるブロック
//    func addBannerViewToView(bannerView: GADBannerView) {
//        bannerView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(bannerView)
//        view.addConstraints(
//            [NSLayoutConstraint(item: bannerView,
//                                attribute: .bottom,
//                                relatedBy: .equal,
//                                toItem: view.safeAreaLayoutGuide,
//                                attribute: .bottom,
//                                multiplier: 1,
//                                constant: 0),
//             NSLayoutConstraint(item: bannerView,
//                                 attribute: .centerX,
//                                 relatedBy: .equal,
//                                 toItem: view,
//                                 attribute: .centerX,
//                                 multiplier: 1,
//                                 constant: 0)
//            
//        ])
        
        
    
    
    
    
 
}
