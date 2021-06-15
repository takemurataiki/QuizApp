//
//  QuizData.swift
//  QuizApp
//
//  Created by 竹村　太喜 on 2021/05/05.
//

import Foundation


struct  QuizData: Codable,Identifiable {
    var id = UUID()
    
    //問題番号
    var quizNumberLabel: Int
    
    //問題文
    var quizTextView:String
    //選択肢
    var answerButton1: String
    var answerButton2: String
    var answerButton3: String
    var answerButton4: String
    //解説文
    var explanation :String
    
    //選択番号
    var tag: Int
    //正解番号
    var judgeImageView: Int
    
    //正解した問題数
    var score :Int
    
    init(quizNumberLabel: Int,quizTextView:String,answerButton1: String,answerButton2: String,answerButton3: String,answerButton4: String,explanation :String,tag: Int,judgeImageView: Int,score :Int) {
        
        self.quizNumberLabel = quizNumberLabel
        self.quizTextView = quizTextView
        self.answerButton1 = answerButton1
        self.answerButton2 = answerButton2
        self.answerButton3 = answerButton3
        self.answerButton4 = answerButton4
        self.explanation = explanation
        self.tag = tag
        self.judgeImageView = judgeImageView
        self.score = score
        
        
    }
    
    static var `default` : QuizData {
        QuizData(
                    quizNumberLabel: 0,
                    quizTextView: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis ",
                    answerButton1: "選択1",
                    answerButton2: "選択2",
                    answerButton3: "選択3",
                    answerButton4: "選択4",
                   explanation: "解説", tag: 0,
                   judgeImageView: 0, score: 0)
    }
    
    
}


///Codable対応変換
extension QuizData {
        /// ①変換対象プロパティ指定
            enum CodingKeys: CodingKey {
                case id
                //String
                case quizNumberLabel
                case quizTextView
                case answerButton1
                case answerButton2
                case answerButton3
                case answerButton4
                case explanation
                //Int
                case tag
                case judgeImageView
                case score
            }
        
        /// ②プロパティのdecode（復号化）アクション
            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                id = try container.decode(UUID.self, forKey: .id)
                quizNumberLabel = try container.decode(Int.self, forKey: .quizNumberLabel)
                quizTextView = try container.decode(String.self, forKey: .quizTextView)
                answerButton1 = try container.decode(String.self, forKey: .answerButton1)
                answerButton2 = try container.decode(String.self, forKey: .answerButton2)
                answerButton3 = try container.decode(String.self, forKey: .answerButton3)
                answerButton4 = try container.decode(String.self, forKey: .answerButton4)
                explanation = try container.decode(String.self, forKey: .explanation)
                
                tag = try container.decode(Int.self, forKey: .tag)
                judgeImageView = try container.decode(Int.self, forKey: .judgeImageView)
                score = try container.decode(Int.self, forKey: .score)
            }
        
        /// ③プロパティのencode（コード化）アクション
            func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(id, forKey: .id)
                
                try container.encode(quizNumberLabel, forKey: .quizNumberLabel)
                try container.encode(quizTextView, forKey: .quizTextView)
                try container.encode(answerButton1, forKey: .answerButton1)
                try container.encode(answerButton2, forKey: .answerButton2)
                try container.encode(answerButton3, forKey: .answerButton3)
                try container.encode(answerButton4, forKey: .answerButton4)
                try container.encode(explanation, forKey: .explanation)
                
                try container.encode(tag, forKey: .tag)
                try container.encode(judgeImageView, forKey: .judgeImageView)
                try container.encode(score, forKey: .score)
                
                
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

