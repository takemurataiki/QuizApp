//
//  QuizView.swift
//  QuizApp
//
//  Created by 竹村　太喜 on 2021/05/05.
//

import SwiftUI

struct QuizView: View {
    
    @Binding var isShow: Bool
    @State var quiz: QuizData
    @EnvironmentObject var quizVM: QuizViewModel
    
    //問題がなくなった時のスイッチ
    @State var isActive: Bool = false
    
    //正誤判定画像
    @State var judgeImage = ""
    
    //ボタンをタップしたかどうか
    @State var btnTapp:Bool = false
    
    
    
    //ボタンをタップした時のアクション
    func btnAction() {
        btnTapp = true
        judgement()
        
        
        //0.5秒後に非表示にする
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.judgeImage = ""
            btnTapp = false
            nextQuiz()
        }
        
    }
    
    //正解判定
    func judgement() {
        if quiz.tag == Int(quizVM.quizArray[1]) {
            //スコアカウント
            quizVM.correctCount += 1
            //◯画像表示
            judgeImage = "correct"
            print("正解")
        } else {
            //×画像表示
            judgeImage = "incorrect"
            print("不正解")
        }
    }
    
//    //解説画面表示
//    func explainQuiz() {
//        if  btnTapp {
//
//        } else {
//
//        }
//    }
    
    ///次の問題を表示
    func nextQuiz() {
        quizVM.quizCount += 1
        if quizVM.quizCount < quizVM.csvArray.count {
            quizVM.quizArray = quizVM.csvArray[quizVM.quizCount].components(separatedBy: ",")
            quiz.quizNumberLabel = "第\(quizVM.quizCount + 1)問"
            quiz.quizTextView = quizVM.quizArray[0]
            quiz.answerButton1 = quizVM.quizArray[2]
            quiz.answerButton2 = quizVM.quizArray[3]
            quiz.answerButton3 = quizVM.quizArray[4]
            quiz.answerButton4 = quizVM.quizArray[5]
            quiz.explanation = quizVM.quizArray[6]
        } else {
            isActive = true
        }
    }
    
    var body: some View {
        
        QuestionView(isShow: $isShow, quiz: QuizData(
                        quizNumberLabel: "問題番号",
                        quizTextView: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis ",
                        answerButton1: "選択1",
                        answerButton2: "選択2",
                        answerButton3: "選択3",
                        answerButton4: "選択4",
                        tag: 0,
                        judgeImageView: 0, explanation: "解説"))

    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(isShow: .constant(false), quiz: QuizData(
                    quizNumberLabel: "問題番号",
                    quizTextView: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis ",
                    answerButton1: "選択1",
                    answerButton2: "選択2",
                    answerButton3: "選択3",
                    answerButton4: "選択4",
                    tag: 0,
                    judgeImageView: 0, explanation: "解説"))
            .environmentObject(QuizViewModel())
    }
}
