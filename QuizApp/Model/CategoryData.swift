//
//  LevelData.swift
//  QuizApp
//
//  Created by 竹村　太喜 on 2021/06/15.
//

import Foundation

struct  CategoryData: Codable,Identifiable {
    var id = UUID()
    //正解した問題数
    var score :Int
    
    static var `default` : CategoryData {
        CategoryData(score: 0)
    }
    
}

func makeData() -> [CategoryData] {
    var dataArray:[CategoryData] = []

    dataArray.append(CategoryData(score: 0))
    dataArray.append(CategoryData(score: 1))
    
    
    return dataArray
}


///Codable対応変換
extension CategoryData {
        /// ①変換対象プロパティ指定
            enum CodingKeys: CodingKey {
                case id
                case score
            }
        
        /// ②プロパティのdecode（復号化）アクション
            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                id = try container.decode(UUID.self, forKey: .id)
                score = try container.decode(Int.self, forKey: .score)
            }
        
        /// ③プロパティのencode（コード化）アクション
            func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(id, forKey: .id)
                try container.encode(score, forKey: .score)
                
                
            }
    
}

