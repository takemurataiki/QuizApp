//
//  Level2.swift
//  QuizApp
//
//  Created by 竹村　太喜 on 2021/06/30.
//

import Foundation

struct  Level2: Codable,Identifiable {
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
    
    static var `default` : Level2 {
        Level2(score: 0, title: "", mark: "")
    }
    
}

///Codable対応変換
extension Level2 {
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



func makeLevel2() -> [Level2] {
    var dataArray:[Level2] = []
    let Category1 = Level2(score: 0, title: "カテゴリ2-", mark: "")
    let Category2 = Level2(score: 0, title: "カテゴリ2-", mark: "")
    let Category3 = Level2(score: 0, title: "カテゴリ2-", mark: "")

    dataArray.append(Category1)
    dataArray.append(Category2)
    dataArray.append(Category3)
    
    return dataArray
    
}



