//
//  QuizData.swift
//  QuizApp
//
//  Created by 竹村　太喜 on 2021/05/05.
//

import Foundation


struct  QuizData: Identifiable {
    var id = UUID()
    
    //問題番号
    var quizNumberLabel: String
    
    //問題文
    var quizTextView:String
    
    //選択肢
    var answerButton1: String
    var answerButton2: String
    var answerButton3: String
    var answerButton4: String
    
    //選択番号
    var tag: Int
    
    
    //正解番号
    var judgeImageView: Int
    
    //解説文
    var explanation :String
    

    }
