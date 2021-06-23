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
    @State var btnTap = false
    
    
    
    @EnvironmentObject var quizVM: QuizViewModel
    
    //3つのボタンを押した時どのボタンを押したか判断する
    func levelButtonAction() {
        quizVM.selectLevel = selectTag
        btnTap = true
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
                
                NavigationLink(destination: SelectCategoryView(quiz: QuizData.default, category: CategoryData.default, isShow: $btnTap),isActive: $btnTap){
                    EmptyView()
                }
                .isDetailLink(false)
                
                
            }
        }
        
        
    }
}

struct SelectLevelView_Previews: PreviewProvider {
    static var previews: some View {
        SelectLevelView()
                    .environmentObject(QuizViewModel())
    }
}
