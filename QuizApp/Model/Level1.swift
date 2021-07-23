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





func makeLevel1() -> [Level1] {
    var dataArray:[Level1] = []
    
    let Category1 = Level1(score: 0, title: "クイズ1", mark: "")
    let Category2 = Level1(score: 0, title: "クイズ2", mark: "")
    let Category3 = Level1(score: 0, title: "クイズ3", mark: "")
    let Category4 = Level1(score: 0, title: "クイズ4", mark: "")
    let Category5 = Level1(score: 0, title: "クイズ5", mark: "")
    let Category6 = Level1(score: 0, title: "クイズ6", mark: "")
    let Category7 = Level1(score: 0, title: "クイズ7", mark: "")
    let Category8 = Level1(score: 0, title: "クイズ8", mark: "")
    let Category9 = Level1(score: 0, title: "クイズ9", mark: "")
    let Category10 = Level1(score: 0, title: "クイズ10", mark: "")
    
    
    
    dataArray.append(Category1)
    dataArray.append(Category2)
    dataArray.append(Category3)
    dataArray.append(Category4)
    dataArray.append(Category5)
    dataArray.append(Category6)
    dataArray.append(Category7)
    dataArray.append(Category8)
    dataArray.append(Category9)
    dataArray.append(Category10)
    
    
    
    
    return dataArray
    
}
