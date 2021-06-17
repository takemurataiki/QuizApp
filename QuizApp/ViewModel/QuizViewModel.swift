//
//  QuizViewModel.swift
//  QuizApp
//
//  Created by 竹村　太喜 on 2021/05/07.
//

import Foundation
import GoogleMobileAds

class QuizViewModel: ObservableObject {
    //広告
    @Published var bannerView: GADBannerView!
    
    
    @Published var categoriesArray: [CategoryData] = []
    {
        didSet {
            
            UserDefaults.standard.setEncoded(categoriesArray, forKey: "categoriesArray")
            
        }
    }
    
    //csvファイルにすべてのデータを読み込む箱
    @Published var csvArray: [String] = []
    {
        didSet {
            
            UserDefaults.standard.setEncoded(csvArray, forKey: "csvArray")
            
        }
    }
    //一問分のデータを入れる箱
    @Published var quizArray: [String] = []
    {
        didSet {
            
            UserDefaults.standard.setEncoded(quizArray, forKey: "quizArray")
            
        }
    }
    
    //問題数
    @Published var quizCount = 0
    
    //正解した数
    @Published var correctCount = 0
    
    //どのレベルを選択したか
    @Published var selectLevel = 0
    
    //どのレベルを選択したか
    @Published var selectQuiz = 0
    
    init() {
        
        csvArray = UserDefaults.standard.decodedObject([String].self, forKey: "csvArray") ?? []
        quizArray = UserDefaults.standard.decodedObject([String].self, forKey: "quizArray") ?? []
        categoriesArray = UserDefaults.standard.decodedObject([CategoryData].self, forKey: "categoriesArray") ?? []
        
    }
    
    
    
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
}
