//
//  QuizData.swift
//  QuizApp
//
//  Created by 竹村　太喜 on 2021/05/05.
//

import Foundation


struct  Question: Codable,Identifiable {
    
    var id = UUID()
    var quizNumberLabel: Int
    var question:String
    //選択肢
    var answerButton1: String
    var answerButton2: String
    var answerButton3: String
    var answerButton4: String
    var explanation :String
    
    //選択番号
    var selectAnswer: Int
    //正解番号
    var answerNum: Int
    
    //正解した問題数
    var score :Int
    
    init(quizNumberLabel: Int,question:String,answerButton1: String,answerButton2: String,answerButton3: String,answerButton4: String,explanation :String,selectAnswer: Int,answerNum: Int,score :Int) {
        
        self.quizNumberLabel = quizNumberLabel
        self.question = question
        self.answerButton1 = answerButton1
        self.answerButton2 = answerButton2
        self.answerButton3 = answerButton3
        self.answerButton4 = answerButton4
        self.explanation = explanation
        self.selectAnswer = selectAnswer
        self.answerNum = answerNum
        self.score = score
        
        
    }
    
    static var `default` : Question {
        Question(quizNumberLabel: 0,question: "問題文",answerButton1: "選択1",answerButton2: "選択2",answerButton3: "選択3",answerButton4: "選択4",explanation: "解説",selectAnswer: 0,answerNum: 0, score: 0)
    }
    
    
}


///Codable対応変換
extension Question {
        /// ①変換対象プロパティ指定
            enum CodingKeys: CodingKey {
                case id
                //String
                case quizNumberLabel
                case question
                case answerButton1
                case answerButton2
                case answerButton3
                case answerButton4
                case explanation
                //Int
                case selectAnswer
                case answerNum
                case score
            }
        
        /// ②プロパティのdecode（復号化）アクション
            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                id = try container.decode(UUID.self, forKey: .id)
                quizNumberLabel = try container.decode(Int.self, forKey: .quizNumberLabel)
                question = try container.decode(String.self, forKey: .question)
                answerButton1 = try container.decode(String.self, forKey: .answerButton1)
                answerButton2 = try container.decode(String.self, forKey: .answerButton2)
                answerButton3 = try container.decode(String.self, forKey: .answerButton3)
                answerButton4 = try container.decode(String.self, forKey: .answerButton4)
                explanation = try container.decode(String.self, forKey: .explanation)
                
                selectAnswer = try container.decode(Int.self, forKey: .selectAnswer)
                answerNum = try container.decode(Int.self, forKey: .answerNum)
                score = try container.decode(Int.self, forKey: .score)
            }
        
        /// ③プロパティのencode（コード化）アクション
            func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(id, forKey: .id)
                
                try container.encode(quizNumberLabel, forKey: .quizNumberLabel)
                try container.encode(question, forKey: .question)
                try container.encode(answerButton1, forKey: .answerButton1)
                try container.encode(answerButton2, forKey: .answerButton2)
                try container.encode(answerButton3, forKey: .answerButton3)
                try container.encode(answerButton4, forKey: .answerButton4)
                try container.encode(explanation, forKey: .explanation)
                
                try container.encode(selectAnswer, forKey: .selectAnswer)
                try container.encode(answerNum, forKey: .answerNum)
                try container.encode(score, forKey: .score)
                
                
            }
    
}


