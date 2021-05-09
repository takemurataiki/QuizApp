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
    @State var judgeImageView = ""
    
    //ボタンをタップしたかどうか
    @State var btnTapp:Bool = false
    
    
    
    //ボタンをタップした時のアクション
    func btnAction() {
        
        btnTapp = true
        //正解判定
        if quiz.tag == Int(quizVM.quizArray[1]) {
            //スコアカウント
            quizVM.correctCount += 1
            //◯画像表示
            judgeImageView = "correct"
            print("正解")
        } else {
            //×画像表示
            judgeImageView = "incorrect"
            print("不正解")
        }
        
        //0.5秒後に非表示にする
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.judgeImageView = ""
            btnTapp = false
            nextQuiz()
        }
        
    }
    
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
        } else {
            isActive = true
        }
    }
    
    var body: some View {
        ZStack {
            Color(red: 0.85, green: 0.7, blue: 1, opacity: 0.5).ignoresSafeArea(.all)
            VStack {
                
                Text(quiz.quizNumberLabel)
                    .padding(.vertical, 40.0)
                    
                
                
                
                ZStack {
                    Text(quiz.quizTextView).lineLimit(nil)
                    Image(judgeImageView)
                        
                        
                    
                }.frame(width: 350.0, height: 300.0)
                
                
                
                Button(action: {
                    quiz.tag = 1
                    btnAction()
                    print("スコア：\(quizVM.correctCount)")
                    }) {
                        Text(quiz.answerButton1)
                            .padding(.all, 30.0)
                            .frame(width: 300.0)
                            .background(Color.white)
                    }
                .disabled(btnTapp)
                
                Button(action: {
                    quiz.tag = 2
                    btnAction()
                    print("スコア：\(quizVM.correctCount)")
                    
                }, label: {
                    Text(quiz.answerButton2)
                        .padding(.all, 30.0)
                        .frame(width: 300.0)
                        .background(Color.white)
                
                })
                .disabled(btnTapp)
                
                Button(action: {
                    quiz.tag = 3
                    btnAction()
                    print("スコア：\(quizVM.correctCount)")
                    
                    
                }, label: {
                    Text(quiz.answerButton3)
                        .padding(.all, 30.0)
                        .frame(width: 300.0)
                        .background(Color.white)
                
                })
                .disabled(btnTapp)
                
                Button(action: {
                    quiz.tag = 4
                    btnAction()
                    print("スコア：\(quizVM.correctCount)")
                    
                    
                }, label: {
                    Text(quiz.answerButton4)
                        .padding(.all, 30.0)
                        .frame(width: 300.0)
                        .background(Color.white)
                
                })
                .disabled(btnTapp)
                
                
                NavigationLink(destination: ScoreView(isShow: self.$isShow), isActive: $isActive) {
                    EmptyView()
                }
                
                
               
            }
            .onAppear(){
                //問題データ入れ込み
//                quizVM.csvArray = quizVM.loadCSV(fileName: "quiz\(quizVM.selectLevel)")
                quizVM.csvArray = quizVM.loadCSV(fileName: "quiz1")
                
                //問題をランダムにする
                quizVM.csvArray.shuffle()
                
                //一問分のデータを入れる
                quizVM.quizArray = quizVM.csvArray[quizVM.quizCount].components(separatedBy: ",")
                
                //問題データ代入
                quiz.quizNumberLabel = "第\(quizVM.quizCount + 1)問"
                quiz.quizTextView = quizVM.quizArray[0]
                quiz.answerButton1 = quizVM.quizArray[2]
                quiz.answerButton2 = quizVM.quizArray[3]
                quiz.answerButton3 = quizVM.quizArray[4]
                quiz.answerButton4 = quizVM.quizArray[5]
                
                print("選択したレベル\(quizVM.selectLevel)")
        }
        }
        
        


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
                    judgeImageView: 0))
            .environmentObject(QuizViewModel())
    }
}
