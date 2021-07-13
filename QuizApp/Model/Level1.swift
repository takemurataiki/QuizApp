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
    //生態
    let Ecology1 = Level1(score: 0, title: "生態①", mark: "")
    let Ecology2 = Level1(score: 0, title: "生態②", mark: "")
    let Ecology3 = Level1(score: 0, title: "生態③", mark: "")
    //暮らし
    let living1 = Level1(score: 0, title: "暮らし①", mark: "")
    let living2 = Level1(score: 0, title: "暮らし②", mark: "")
    let living3 = Level1(score: 0, title: "暮らし③", mark: "")
    //歴史
    let hisitory1 = Level1(score: 0, title: "歴史①", mark: "")
    let hisitory2 = Level1(score: 0, title: "歴史②", mark: "")
    let hisitory3 = Level1(score: 0, title: "歴史③", mark: "")
    //文化
    let culture1 = Level1(score: 0, title: "文化①", mark: "")
    let culture2 = Level1(score: 0, title: "文化②", mark: "")
    let culture3 = Level1(score: 0, title: "文化③", mark: "")
    
    
    dataArray.append(Ecology1)
    dataArray.append(Ecology2)
    dataArray.append(Ecology3)
    
    dataArray.append(living1)
    dataArray.append(living2)
    dataArray.append(living3)
    
    dataArray.append(hisitory1)
    dataArray.append(hisitory2)
    dataArray.append(hisitory3)
    
    dataArray.append(culture1)
    dataArray.append(culture2)
    dataArray.append(culture3)
    
    
    return dataArray
    
}
