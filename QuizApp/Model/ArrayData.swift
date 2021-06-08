//
//  ArrayData.swift
//  QuizApp
//
//  Created by 竹村　太喜 on 2021/06/08.
//

import Foundation


///クイズ一問を入れるデータ
func ArrayData() -> [QuizData] {
    var dataArray:[QuizData] = []

    dataArray.append( QuizData(
                        quizNumberLabel: 0,
                        quizTextView: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis ",
                        answerButton1: "選択1",
                        answerButton2: "選択2",
                        answerButton3: "選択3",
                        answerButton4: "選択4",
                         explanation: "解説", tag: 0,
                         judgeImageView: 0, score: 0))
    return dataArray
}