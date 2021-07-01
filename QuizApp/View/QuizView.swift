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
    //Model
    @State var quiz: Question
    @Binding var category1: Level1
    @Binding var category2: Level2
    @Binding var category3: Level3
    //VM
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
        if quiz.selectAnswer == Int(quizVM.quizArray[1]) {
            if quizVM.selectLevel == 1  {
                if category1.score < 5{
                    //スコアカウント
                    category1.score += 1
                    if category1.score == 5 {
                    category1.mark = "肉球"
                    
                    }
                }else {
                    category1.score = 5
                }
            }
            if quizVM.selectLevel == 2  {
                if category2.score < 5{
                    //スコアカウント
                    category2.score += 1
                    if category2.score == 5 {
                    category2.mark = "肉球"
                    
                    }
                }else {
                    category2.score = 5
                }
            }
            if quizVM.selectLevel == 3  {
                if category3.score < 5{
                    //スコアカウント
                    category3.score += 1
                    if category3.score == 5 {
                    category3.mark = "肉球"
                    
                    }
                }else {
                    category3.score = 5
                }
            }
            
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
            quiz.question = quizVM.quizArray[0]
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
                            
                            Text("\(quiz.selectAnswer),")
                            Text(quizVM.quizArray[quiz.selectAnswer+1])
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
                            HStack {
                                Spacer()
                                Text("次の問題へ")
                                Spacer()
                            }
                            .frame(maxWidth: .infinity, maxHeight: 60)
                            .background(Color.white)
                            .cornerRadius(25)
                            .padding(.horizontal, 20.0)
                                    
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
                            VStack {
                                Spacer()
                                Text(quiz.question).lineLimit(nil)
                                Spacer()
                 
                            }
                            .frame(width: .infinity, height: .infinity)
                            
                            .padding(.all, 10.0)
                            
                            Spacer()
                            
                            VStack {
                                Button(action: {
                                    quiz.selectAnswer = 1
                                    btnAction()
                                    
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
                                    .cornerRadius(25)
                                    .padding(.horizontal, 10.0)
                                    }
                                .disabled(btnTapp)
                                
                                Spacer()
                                Button(action: {
                                    quiz.selectAnswer = 2
                                    btnAction()
                                    
                                    
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
                                    .cornerRadius(25)
                                    .padding(.horizontal, 10.0)
                                
                                })
                                .disabled(btnTapp)
                                Spacer()
                                Button(action: {
                                    quiz.selectAnswer = 3
                                    btnAction()
                                   
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
                                    .cornerRadius(25)
                                    .padding(.horizontal, 10.0)
                                
                                })
                                .disabled(btnTapp)
                                Spacer()
                                Button(action: {
                                    
                                    quiz.selectAnswer = 4
                                    btnAction()
                                   
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
                                    .cornerRadius(25)
                                    .padding(.horizontal, 10.0)
                                        
                                
                                })
                                .disabled(btnTapp)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            
                        
                            Spacer()
                        
                            NavigationLink(destination: ScoreView(isShow: self.$isShow,
                                                                  quiz: Question.default,
                                                                  category1: $category1,
                                                                  category2: $category2,
                                                                  category3: $category3), isActive: $nextPage) {
                                EmptyView()
                            }
                            .isDetailLink(false)
                            
                           
                        }
                        
                    }
                    
                }
            }
            .onAppear(){
                if quizVM.selectLevel == 1 {
                    category1.score = 0
                    category1.mark = ""
                }
                if quizVM.selectLevel == 2 {
                    category2.score = 0
                    category2.mark = ""
                }
                if quizVM.selectLevel == 3 {
                    category3.score = 0
                    category3.mark = ""
                }
                
                quizVM.quizCount = 0
                //問題データ入れ込み
//                quizVM.csvArray = quizVM.loadCSV(fileName: "quiz\(quizVM.selectLevel)-\(quizVM.selectCategory+1)")
                quizVM.csvArray = quizVM.loadCSV(fileName: "quiz1-1")
                
                //問題をランダムにする
                quizVM.csvArray.shuffle()
                
                //一問分のデータを入れる
                quizVM.quizArray = quizVM.csvArray[quizVM.quizCount].components(separatedBy: ",")
                
                //問題データ代入
                quiz.quizNumberLabel = quizVM.quizCount + 1
                quiz.question = quizVM.quizArray[0]

                quiz.answerButton1 = quizVM.quizArray[2]
                quiz.answerButton2 = quizVM.quizArray[3]
                quiz.answerButton3 = quizVM.quizArray[4]
                quiz.answerButton4 = quizVM.quizArray[5]
                quiz.explanation = quizVM.quizArray[6]
                
                print("選択したレベル\(quizVM.selectLevel)-\(quizVM.selectCategory+1)")
                
                
        }
            AdView().frame(maxWidth:.infinity, maxHeight: 60.0)
        }
        .navigationTitle("Q\(quiz.quizNumberLabel)")
        .navigationBarBackButtonHidden(true)
    }
}


struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(isShow: .constant(false),
                 quiz: Question.default,
                 category1: .constant(Level1.default),
                 category2: .constant(Level2.default),
                 category3: .constant(Level3.default)
                 )
            .environmentObject(QuizViewModel())
    }
    
    
}
