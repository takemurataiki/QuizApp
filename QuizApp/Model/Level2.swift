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
    let Category11 = Level2(score: 0, title: "クイズ11", mark: "")
    let Category12 = Level2(score: 0, title: "クイズ12", mark: "")
    let Category13 = Level2(score: 0, title: "クイズ13", mark: "")
    let Category14 = Level2(score: 0, title: "クイズ14", mark: "")
    let Category15 = Level2(score: 0, title: "クイズ15", mark: "")
    let Category16 = Level2(score: 0, title: "クイズ16", mark: "")
    let Category17 = Level2(score: 0, title: "クイズ17", mark: "")
    let Category18 = Level2(score: 0, title: "クイズ18", mark: "")
    let Category19 = Level2(score: 0, title: "クイズ19", mark: "")
    let Category20 = Level2(score: 0, title: "クイズ20", mark: "")
    
    
    
    dataArray.append(Category11)
    dataArray.append(Category12)
    dataArray.append(Category13)
    dataArray.append(Category14)
    dataArray.append(Category15)
    dataArray.append(Category16)
    dataArray.append(Category17)
    dataArray.append(Category18)
    dataArray.append(Category19)
    dataArray.append(Category20)
    
    return dataArray
    
}






