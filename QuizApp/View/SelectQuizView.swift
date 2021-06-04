//
//  SelectQuizView.swift
//  QuizApp
//
//  Created by 竹村　太喜 on 2021/05/27.
//

import SwiftUI

struct SelectQuizView: View {
    
    
    @EnvironmentObject var quizVM: QuizViewModel
    
    //ボタンをタップしたかどうか
    @State var btnTap:Bool = false
    @Binding var isShow: Bool
    
    
    @State var selectTag = 0
    
    //3つのボタンを押した時どのボタンを押したか判断する
    func levelButtonAction() {
        quizVM.selectQuiz = selectTag
        btnTap = true
        
    }
    var body: some View {
        ZStack {
            Color(red: 0.85, green: 0.7, blue: 1, opacity: 0.5).ignoresSafeArea(.all)
            VStack {
                
                
                Text("問題を選択してください")
                    .font(.title2)
                    .fontWeight(.regular)
                    .lineLimit(nil)
                    .padding(.all, 30.0)
                    
                    
                Spacer()
                
                    List {
                        ForEach(0..<3,id:\.self) { index in
                            Button(action: {
                                selectTag = index+1
                                levelButtonAction()
                                
                            }, label: {
                                Text("1-\(index+1)")
                                
                                
                                    
                            
                            })
                        }
                        .listRowBackground(Color(red: 0.85, green: 0.7, blue: 1, opacity: 0.5).ignoresSafeArea(.all))
                    }///謎の空白を埋める
                    
                    .listStyle(PlainListStyle())
                    
               

                
                    
                    
                   
                Spacer()
                AdView().frame(width: .infinity, height: 50)
                
                NavigationLink(destination: QuizView(
                                isShow: $btnTap,
                                quiz: QuizData(
                                    quizNumberLabel: "問題番号",
                                    quizTextView: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis ",
                                    answerButton1: "選択1",
                                    answerButton2: "選択2",
                                    answerButton3: "選択3",
                                    answerButton4: "選択4",
                                    tag: 0,
                                    judgeImageView: 0, explanation: "解説")), isActive: $btnTap){
                    EmptyView()
                }
                .isDetailLink(false)
            }
        }
        }
}

struct SelectQuizView_Previews: PreviewProvider {
    static var previews: some View {
        SelectQuizView(isShow: .constant(false))
            .environmentObject(QuizViewModel())
    }
}
