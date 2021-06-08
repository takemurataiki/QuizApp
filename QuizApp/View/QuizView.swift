//
//  QuizView.swift
//  QuizApp
//
//  Created by 竹村　太喜 on 2021/05/05.
//

import SwiftUI

struct QuizView: View {
    //ボタンをタップしたかどうか
    @State var btnTapp:Bool = false
    @Binding var isShow: Bool
    
    @State var quiz: QuizData
    @EnvironmentObject var quizVM: QuizViewModel
    
    
    //問題がなくなった時のスイッチ
    @State var nextPage: Bool = false
    
    //正誤判定画像
    @State var judgeImage = ""
    
    
    @State var flag:Bool = false
    
    
    
    //ボタンをタップした時のアクション
    func btnAction() {
        flag = true
        btnTapp = true
        
        //正解判定
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
        
//        //0.5秒後に非表示にする
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            self.judgeImage = ""
//            btnTapp = false
//            nextQuiz()
//        }
        
    }
    
    ///次の問題を表示
    func nextQuiz() {
        quizVM.quizCount += 1
        if quizVM.quizCount < quizVM.csvArray.count {
            quizVM.quizArray = quizVM.csvArray[quizVM.quizCount].components(separatedBy: ",")
            quiz.quizNumberLabel = quizVM.quizCount + 1
            quiz.quizTextView = quizVM.quizArray[0]
            quiz.answerButton1 = quizVM.quizArray[2]
            quiz.answerButton2 = quizVM.quizArray[3]
            quiz.answerButton3 = quizVM.quizArray[4]
            quiz.answerButton4 = quizVM.quizArray[5]
            quiz.explanation = quizVM.quizArray[6]
        } else {
            nextPage = true
        }
    }
    
    var body: some View {
        VStack {
            ZStack {
                if flag {
                    ZStack {
                        Color(red: 0.85, green: 0.7, blue: 1, opacity: 0.5).ignoresSafeArea(.all)
                    VStack {
                        Text("解説")
                            .padding(.vertical, 20.0)
                        
                        HStack {
                            Text("判定")
                            Image(judgeImage)
                                .resizable()
                                .frame(width: 30, height: 30)
                                
                        }
                        
                        HStack {
                            Text("【回答】")
                            
                            Text("\(quiz.tag),")
                            Text(quizVM.quizArray[quiz.tag+1])
                            Spacer()
                            
                        }
                        
                        HStack {
                            Text("【正解】")
                            Text("\(quizVM.quizArray[1]),")
                            Text(quizVM.quizArray[1+Int(quizVM.quizArray[1])!])
                            Spacer()
                            
                        }
                        
                        Spacer()
                        HStack {
                            Text("【解答】")
                            Spacer()
                        }
                        Text(quiz.explanation)
                            .padding(.vertical, 20.0)
                            
                            
                        
                        
                        Button(action: {
                            flag = false
                            btnTapp = false
                            nextQuiz()
                            self.judgeImage = ""
                           
                            }) {
                                Text("次の問題へ")
                                    
                            }
                        Spacer()
                        
                       
                        
                       
                    }
               
                }
                .navigationBarHidden(true)
                }
                if !flag {
                    ZStack {
                        Color(red: 0.85, green: 0.7, blue: 1, opacity: 0.5).ignoresSafeArea(.all)
                        VStack {
                            
                            Text("第\(quiz.quizNumberLabel)問")
                                .padding(.vertical, 20.0)
                                
                            
                            
                            
                            ZStack {
                                Text(quiz.quizTextView).lineLimit(nil)
                                    
                 
                            }
                            .frame(width: .infinity, height: 300.0)
                            .padding(.vertical, 10.0)
                            
                            
                            Spacer()
                            
                            VStack {
                                Button(action: {
                                    quiz.tag = 1
                                    btnAction()
                                    print("スコア：\(quizVM.correctCount)")
                                    }) {
                                    HStack {
                                        Text("1,")
                                            .padding(.leading, 5.0)
                                        Spacer()
                                        Text(quiz.answerButton1)
                                        Spacer()
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .background(Color.white)
                                    .padding(.horizontal, 10.0)
                                    }
                                .disabled(btnTapp)
                                
                                Spacer()
                                Button(action: {
                                    quiz.tag = 2
                                    btnAction()
                                    print("スコア：\(quizVM.correctCount)")
                                    
                                }, label: {
                                    HStack {
                                        Text("2,")
                                            .padding(.leading, 5.0)
                                            
                                        Spacer()
                                        Text(quiz.answerButton2)
                                        Spacer()
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .background(Color.white)
                                    .padding(.horizontal, 10.0)
                                
                                })
                                .disabled(btnTapp)
                                Spacer()
                                Button(action: {
                                    quiz.tag = 3
                                    btnAction()
                                    print("スコア：\(quizVM.correctCount)")
                                    
                                    
                                }, label: {
                                    HStack {
                                        Text("3,")
                                            .padding(.leading, 5.0)
                                        Spacer()
                                        Text(quiz.answerButton3)
                                        Spacer()
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .background(Color.white)
                                    .padding(.horizontal, 10.0)
                                
                                })
                                .disabled(btnTapp)
                                Spacer()
                                Button(action: {
                                    
                                    quiz.tag = 4
                                    btnAction()
                                    print("スコア：\(quizVM.correctCount)")
                                    
                                    
                                }, label: {
                                    HStack {
                                        Text("4,")
                                            .padding(.leading, 5.0)
                                        Spacer()
                                        Text(quiz.answerButton4)
                                        Spacer()
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .background(Color.white)
                                    .padding(.horizontal, 10.0)
                                        
                                
                                })
                                .disabled(btnTapp)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            
                        
                            Spacer()
                        
                            NavigationLink(destination: ScoreView(isShow: self.$isShow, quiz: QuizData(
                                                                  quizNumberLabel: 0,
                                                                  quizTextView: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis ",
                                                                  answerButton1: "選択1",
                                                                  answerButton2: "選択2",
                                                                  answerButton3: "選択3",
                                                                  answerButton4: "選択4",
                                                                    explanation: "解説", tag: 0,
                                                                    judgeImageView: 0, score: 0)), isActive: $nextPage) {
                                EmptyView()
                            }
                            .isDetailLink(false)
                            
                           
                        }
                        
                    }
                    .navigationBarHidden(true)
                }
            }
            .onAppear(){
                
                quizVM.quizCount = 0
                //問題データ入れ込み
//                quizVM.csvArray = quizVM.loadCSV(fileName: "quiz\(quizVM.selectLevel)-\(quizVM.selectQuiz)")
                quizVM.csvArray = quizVM.loadCSV(fileName: "quiz1")
                
                //問題をランダムにする
                quizVM.csvArray.shuffle()
                
                //一問分のデータを入れる
                quizVM.quizArray = quizVM.csvArray[quizVM.quizCount].components(separatedBy: ",")
                
                //問題データ代入
                quiz.quizNumberLabel = quizVM.quizCount + 1
                quiz.quizTextView = quizVM.quizArray[0]

                quiz.answerButton1 = quizVM.quizArray[2]
                quiz.answerButton2 = quizVM.quizArray[3]
                quiz.answerButton3 = quizVM.quizArray[4]
                quiz.answerButton4 = quizVM.quizArray[5]
                quiz.explanation = quizVM.quizArray[6]
                
                print("選択したレベル\(quizVM.selectLevel)-\(quizVM.selectQuiz)")
                
                
        }
            AdView().frame(width: 330, height: 50)
        }

    }
}


struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(isShow: .constant(false),
                 quiz: QuizData(
                    quizNumberLabel: 0,
                    quizTextView: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis ",
                    answerButton1: "選択1",
                    answerButton2: "選択2",
                    answerButton3: "選択3",
                    answerButton4: "選択4",
                    explanation: "解説", tag: 0,
                    judgeImageView: 0, score: 0))
            .environmentObject(QuizViewModel())
    }
}
