//
//  QuizViewModel.swift
//  QuizApp
//
//  Created by 竹村　太喜 on 2021/05/07.
//

import Foundation
import GoogleMobileAds
import SwiftUI

class QuizViewModel: ObservableObject {
    //広告
    @Published var bannerView: GADBannerView!
    
    //初級
    @Published var Level1Array: [Level1] = makeLevel1()
    {
        didSet {
            
            UserDefaults.standard.setEncoded(Level1Array, forKey: "Level1Array")
            
        }
    }
    
    //中級
    @Published var Level2Array: [Level2] = makeLevel2()
    {
        didSet {
            
            UserDefaults.standard.setEncoded(Level2Array, forKey: "Level2Array")
            
        }
    }
    
    //上級
    @Published var Level3Array: [Level3] = makeLevel3()
    {
        didSet {
            
            UserDefaults.standard.setEncoded(Level3Array, forKey: "Level3Array")
            
        }
    }
    
    init() {
        Level1Array = UserDefaults.standard.decodedObject([Level1].self, forKey: "Level1Array") ?? makeLevel1()
        Level2Array = UserDefaults.standard.decodedObject([Level2].self, forKey: "Level2Array") ?? makeLevel2()
        Level3Array = UserDefaults.standard.decodedObject([Level3].self, forKey: "Level3Array") ?? makeLevel3()
    }
    
    
    
    //csvファイルにすべてのデータを読み込む箱
    @Published var csvArray: [String] = []
   
    //一問分のデータを入れる箱
    @Published var quizArray: [String] = []
   
    
    //問題数
    @Published var quizCount = 0
    
    //正解した数
    @Published var score = 0
    
    //どのレベルを選択したか
    @Published var selectLevel = 0
    
    //どのカテゴリを選択したか
    @Published var selectCategory = 0
    
    
    
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

extension Collection {
  func indexed() -> Array<(offset: Int, element: Element)> {
    return Array(self.enumerated())
  }
    
}

extension UIColor {
    var color: Color {
        return Color(self)
    }
}

enum MyColor {
    case black
    // dark modeの対応
    private func light(_ light: UIColor, dark: UIColor) -> UIColor {
        if #available(iOS 13, *) {
            return UIColor { (traitCollection: UITraitCollection) -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .unspecified, .light:
                    return light
                case .dark:
                    return dark
                @unknown default:
                    return light
                }
            }
        } else {
            return light
        }
    }

    // 色を定義
    var uiColor: UIColor {
        switch self {
        case .black:
            return light(UIColor(red: 1, green: 0, blue: 0.5, alpha: 1),
                         dark: UIColor(red: 1, green: 1, blue: 0.5, alpha: 1))
        }
    }

    // color
    var color: Color {
        return Color(uiColor)
    }
}

///UserDefaults 構造体保存　拡張
extension UserDefaults {
    ///保存
  func setEncoded<T: Encodable>(_ value: T, forKey key: String) {
    guard let data = try? JSONEncoder().encode(value) else {
       print("Can not Encode to JSON.")
       return
    }
    
    set(data, forKey: key)
  }

    ///取り出し
  func decodedObject<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
    guard let data = data(forKey: key) else {
      return nil
    }
    
    return try? JSONDecoder().decode(type, from: data)
  }
}
