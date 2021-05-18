//
//  SelectLevelView.swift
//  QuizApp
//
//  Created by 竹村　太喜 on 2021/05/05.
//

import SwiftUI

struct SelectLevelView: View {
    
    @State var selectTag = 0
    //ボタンをタップしたかどうか
    @State var isActive:Bool = false
    
    @Binding var isShow: Bool
    
    @EnvironmentObject var quizVM: QuizViewModel
    
    //3つのボタンを押した時どのボタンを押したか判断する
    func levelButtonAction() {
        quizVM.selectLevel = selectTag
        isActive = true
    }
    
    var body: some View {
        ZStack {
            Color(red: 0.85, green: 0.7, blue: 1, opacity: 0.5).ignoresSafeArea(.all)
            VStack {
                
                
                Text("難易度を選択してください")
                    .font(.title2)
                    .fontWeight(.regular)
                    .lineLimit(nil)
                    .padding(.all, 30.0)
                    
                    
                Spacer()
                VStack {
                    
                    Button(action: {
                        selectTag = 1
                       
                        levelButtonAction()
                    }, label: {
                        Text("初級")
                            .padding(.all, 30.0)
                            .frame(width: 300.0)
                            .background(Color.white)
                    
                    })
                    
                    Button(action: {
                        selectTag = 2
                        
                        levelButtonAction()
                        
                    }, label: {
                        Text("中級")
                            .padding(.all, 30.0)
                            .frame(width: 300.0)
                            .background(Color.white)
                    
                    })
                    
                    Button(action: {
                        selectTag = 3
                    
                        levelButtonAction()
                    }, label: {
                        Text("上級")
                            .padding(.all, 30.0)
                            .frame(width: 300.0)
                            .background(Color.white)
                    
                    })
                }
                .padding(.horizontal, 40.0)
                .frame(height: 350.0)
                Spacer()
                AdView().frame(width: .infinity, height: 50)
                
                NavigationLink(destination: QuizView(
                                isShow: self.$isShow,
                                quiz: QuizData(
                                    quizNumberLabel: "問題番号",
                                    quizTextView: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis ",
                                    answerButton1: "選択1",
                                    answerButton2: "選択2",
                                    answerButton3: "選択3",
                                    answerButton4: "選択4",
                                    tag: 0,
                                    judgeImageView: 0, explanation: "解説")), isActive: self.$isActive){
                    EmptyView()
                }
            }
        }
        
    }
}

struct SelectLevelView_Previews: PreviewProvider {
    static var previews: some View {
        SelectLevelView(isShow: .constant(false))
                    .environmentObject(QuizViewModel())
    }
}
