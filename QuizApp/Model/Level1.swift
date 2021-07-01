//
//  LevelData.swift
//  QuizApp
//
//  Created by 竹村　太喜 on 2021/06/15.
//

import Foundation

struct  Level1: Codable,Identifiable {
    var id = UUID()
    //正解した問題数
    var score :Int
    //カテゴリータイトル
    var title: String
    
    // 完答マーク
    var mark: String
    
    
    
    init(score :Int,title: String,mark: String){
        self.score = score
        self.title = title
        self.mark = mark
    }
    
    static var `default` : Level1 {
        Level1(score: 0, title: "", mark: "")
    }
    
}

///Codable対応変換
extension Level1 {
        /// ①変換対象プロパティ指定
            enum CodingKeys: CodingKey {
                case id
                case score
                case title
                case mark
            }
        
        /// ②プロパティのdecode（復号化）アクション
            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                id = try container.decode(UUID.self, forKey: .id)
                score = try container.decode(Int.self, forKey: .score)
                title = try container.decode(String.self, forKey: .title)
                mark = try container.decode(String.self, forKey: .mark)
            }
        
        /// ③プロパティのencode（コード化）アクション
            func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(id, forKey: .id)
                try container.encode(score, forKey: .score)
                try container.encode(title, forKey: .title)
                try container.encode(mark, forKey: .mark)
                
                
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



func makeLevel1() -> [Level1] {
    var dataArray:[Level1] = []
    let Category1 = Level1(score: 0, title: "カテゴリ1-", mark: "")
    let Category2 = Level1(score: 0, title: "カテゴリ1-", mark: "")
    let Category3 = Level1(score: 0, title: "カテゴリ1-", mark: "")

    dataArray.append(Category1)
    dataArray.append(Category2)
    dataArray.append(Category3)
    
    return dataArray
    
}

func makeLevel2() -> [Level1] {
    var dataArray:[Level1] = []
    let Category1 = Level1(score: 0, title: "カテゴリ2-", mark: "")
    let Category2 = Level1(score: 0, title: "カテゴリ2-", mark: "")
    let Category3 = Level1(score: 0, title: "カテゴリ2-", mark: "")

    dataArray.append(Category1)
    dataArray.append(Category2)
    dataArray.append(Category3)
    
    return dataArray
    
}

func makeLevel3() -> [Level1] {
    var dataArray:[Level1] = []
    let Category1 = Level1(score: 0, title: "カテゴリ3-", mark: "")
    let Category2 = Level1(score: 0, title: "カテゴリ3-", mark: "")
    let Category3 = Level1(score: 0, title: "カテゴリ3-", mark: "")

    dataArray.append(Category1)
    dataArray.append(Category2)
    dataArray.append(Category3)
    
    return dataArray
    
}




