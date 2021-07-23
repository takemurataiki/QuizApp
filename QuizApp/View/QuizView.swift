//
//  QuizView.swift
//  QuizApp
//
//  Created by 竹村　太喜 on 2021/05/05.
//

import SwiftUI

struct QuizView: View {
    
    @State private var showingAlert = false   // ①アクションシートの表示フラグ
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
    @Environment(\.presentationMode) var presentation
    
    
    //問題がなくなった時のスイッチ
    @State var nextPage: Bool = false
    
    //正誤判定画像
    @State var judgeImage = ""
    //正解判定（色調整）
    @State var jugeColor:Bool = false
    @State var juge:String = ""
    
    
    @State var flag:Bool = false
    @State var question:Bool = false
    
    
    
    //ボタンをタップした時のアクション
     private func btnAction() {
        question = true
        flag = true
        btnTapp = true
        //正解判定
        if quiz.selectAnswer == Int(quizVM.quizArray[1]) {
            jugeColor = true
            //◯画像表示
            judgeImage = "correct"
            juge = "正解"
            if quizVM.selectLevel == 1  {
                if category1.score < 5{
                    //スコアカウント
//                    category1.score += 1
                    quizVM.score += 1
                    category1.score = quizVM.score
                    if category1.score == 5 {
                    category1.mark = "肉球"

                    }
                }else {
                    jugeColor = false
                    category1.score = 5
                }
            }
//            if quizVM.selectLevel == 2  {
//                
//                if category2.score < 5{
//                    //スコアカウント
////                    category2.score += 1
//                    quizVM.score += 1
//                    category2.score = quizVM.score
//                    if category2.score == 5 {
//                    category2.mark = "肉球"
//
//                    }
//                }else {
//                    jugeColor = false
//                    category2.score = 5
//                }
//            }
//            if quizVM.selectLevel == 3  {
//                
//                if category3.score < 5{
//                    //スコアカウント
////                    category3.score += 1
//                    quizVM.score += 1
//                    category3.score = quizVM.score
//                    if category3.score == 5 {
//                    category3.mark = "肉球"
//                    
//                    }
//                }else {
//                   
//                    category3.score = 5
//                }
//            }
            
           
        } else {
            jugeColor = false
            //×画像表示
            judgeImage = "incorrect"
            juge = "不正解"
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
            question = true
            nextPage = true
        }
    }
    
    var body: some View {
        ZStack {
            Color(red: 0.85, green: 0.7, blue: 1, opacity: 0.5).ignoresSafeArea(.all)
            VStack {
                ZStack {
                    if flag {
                       
                            
                        VStack {
                            
                            //判定
                            VStack {
                                Image(judgeImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 80, maxHeight: 80)
                                Text(juge)
                                    .foregroundColor(jugeColor ? Color.red : Color.blue)
                             }
                            .padding(.all, 10.0)
     
                            //答え
                            VStack {
                                HStack {
                                    Text("【回答】")
                                        .fontWeight(.bold)
                                    
                                    Text("\(quiz.selectAnswer),")
                                        
                                    Text(quizVM.quizArray[quiz.selectAnswer+1])
                                        .lineLimit(nil)
                                    Spacer()
                                    
                                }
                                
                                HStack {
                                    Text("【正解】")
                                        .fontWeight(.bold)
                                        
                                    HStack {
                                        Text("\(quizVM.quizArray[1]),")
                                            .fontWeight(.bold)
                                            
                                        Text(quizVM.quizArray[1+Int(quizVM.quizArray[1])!])
                                            .fontWeight(.bold)
                                            .lineLimit(nil)
                                    }
                                    .foregroundColor(jugeColor ? Color.black : Color.red)
                                     
                                    Spacer()
                                    
                                }
                            }
                            .padding(.all, 10.0)
                            .background(Color.white)
                            .cornerRadius(25)
                            .padding(.all, 10.0)
                            
                           
                            //解説
                            VStack {
                                HStack {
                                    Text("【解説】")
                                        .fontWeight(.bold)
                                        
                                       
                                    Spacer()
                                }
                                Text(quiz.explanation)
                                    .padding(.all, 5.0)
                            }
                            .padding(.all, 10.0)
                            .background(Color.white)
                            .cornerRadius(25)
                            .padding(.all, 10.0)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)

                                
                                
                            Spacer()
                            
                            //次の問題
                            Button(action: {
                                question = false
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
                    if !question {
                        
                            
                            VStack {
                                VStack {
                                    Spacer()
                                    Text(quiz.question).lineLimit(nil)
                                    Spacer()
                     
                                }
                                .frame(width: .infinity, height: .infinity)
                                .padding(.all, 15.0)
                                .background(Color.white)
                                .cornerRadius(25)
                                
                                
                                .padding(.all, 10.0)
                                
                                Spacer()
                                
                                VStack {
                                    Button(action: {
                                        quiz.selectAnswer = 1
                                        btnAction()
                                        
                                        }) {
                                        HStack {
                                            Text("１,")
                                                .padding(.leading, 5.0)
                                            Spacer()
                                            Text(quiz.answerButton1)
                                            Spacer()
                                        }
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .background(Color.white)
                                        .cornerRadius(25)
                                        .padding(.horizontal, 15.0)
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
                                        .padding(.horizontal, 15.0)
                                        
                                    
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
                                        .padding(.horizontal, 15.0)
                                    
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
                                        .padding(.horizontal, 15.0)
                                            
                                    
                                    })
                                    .disabled(btnTapp)
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                
                            
                                Spacer()
                            
//                                NavigationLink(destination: ScoreView(isShow: self.$isShow,
//                                                                      quiz: Question.default,
//                                                                      category1: $category1,
//                                                                      category2: $category2,
//                                                                      category3: $category3), isActive: $nextPage) {
//                                    EmptyView()
//                                }
//                                .isDetailLink(false)
                                
                               
                            }
                            
                        
                        
                    }
                    if nextPage {
                        
                            VStack {
                               
                                if quizVM.selectLevel == 1 {
                                    Text("\(category1.score)問正解！")
                                        .font(.largeTitle)
                                        .fontWeight(.semibold)
                                        .padding(.vertical, 40.0)
                                }
                                if quizVM.selectLevel == 2 {
                                    Text("\(category2.score)問正解！")
                                        .font(.largeTitle)
                                        .fontWeight(.semibold)
                                        .padding(.vertical, 40.0)
                                }
                                if quizVM.selectLevel == 3 {
                                    Text("\(category3.score)問正解！")
                                        .font(.largeTitle)
                                        .fontWeight(.semibold)
                                        .padding(.vertical, 40.0)
                                }
                                   
                                Button(action: {
                                    
                                    presentation.wrappedValue.dismiss()
                                   
                                }){
                                    Text("トップに戻る")
                                        .padding(.all, 20.0)
                                        .frame(width: 300.0, height: 70.0)
                                        .background(Color.white)
                                        .cornerRadius(25)
                                    
                                }.padding(.all, 20.0)
                                
                                Spacer()
                                AdView().frame(maxWidth:.infinity, maxHeight: .infinity)
                            }
                            
                        
                    }
                    
                }

                .onAppear(){

                    quizVM.score = 0
                    
                    quizVM.quizCount = 0
                    //問題データ入れ込み
                    quizVM.csvArray = quizVM.loadCSV(fileName: "quiz\(quizVM.selectLevel)-\(quizVM.selectCategory+1)")
//                    quizVM.csvArray = quizVM.loadCSV(fileName: "quiz1-1")
                    
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
            .navigationTitle(nextPage ? "" : "Q\(quiz.quizNumberLabel)") 
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(nextPage ? true : false)
            .navigationBarItems(
                leading:
                    HStack {
                        Button(action: {
                            self.showingAlert = true
                            
                        }){
                            Image(systemName: "chevron.backward")
                                .scaleEffect(1.3)
                                .frame(width: 60, height: 30,alignment: .leading)
                        }
                        .alert(isPresented: $showingAlert) {
                                    Alert(title: Text("警告"),
                                          message: Text("問題を中止しますか？\n※スコアは途中までのものとなります") ,
                                          primaryButton: .cancel(Text("キャンセル")),    // キャンセル用
                                          secondaryButton: .destructive(Text("中止"),
                                                                        action: {
                                            ///前画面に戻る
                                            presentation.wrappedValue.dismiss()
                                            }
                                          ))   // 破壊的変更用
                                }
                    }
        )
        }
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
