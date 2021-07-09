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
    @Environment(\.presentationMode) var presentation
    
    //3つのボタンを押した時どのボタンを押したか判断する
    func levelButtonAction() {
        quizVM.selectLevel = selectTag
        btnTap = true
    }
    
    var body: some View {
        ZStack {
                Color(red: 0.85, green: 0.7, blue: 1, opacity: 0.5).ignoresSafeArea(.all)
            VStack {
                
                
               
                
                Spacer()
                
                VStack {
                    
                    Button(action: {
                        selectTag = 1
                        levelButtonAction()
                    }, label: {
                        Text("初級")
                            .frame(maxWidth:.infinity, maxHeight: 80.0)
                            .background(Color.white)
                            .cornerRadius(30)
                            .padding(.vertical, 10.0)
                    
                    })
                    
                    Button(action: {
                        selectTag = 2
                        levelButtonAction()
                        
                    }, label: {
                        Text("中級")
                            .frame(maxWidth:.infinity, maxHeight: 80.0)
                            .background(Color.white)
                            .cornerRadius(30)
                            .padding(.vertical, 10.0)
                    
                    })
                    
                    Button(action: {
                        selectTag = 3
                    
                        levelButtonAction()
                    }, label: {
                        Text("上級")
                            .frame(maxWidth:.infinity, maxHeight: 80.0)
                            .background(Color.white)
                            .cornerRadius(30)
                            .padding(.vertical, 10.0)
                    
                    })
                }
                .frame(height: .infinity)
                .padding(.all, 20.0)
                
                
                
                
                Spacer()
                AdView()
                    .frame(maxWidth:.infinity, maxHeight: 60.0)
                    
                NavigationLink(destination: SelectCategoryView(quiz: Question.default, category: Level1.default, isShow: $btnTap),isActive: $btnTap){
                    EmptyView()
                }
                .isDetailLink(false)
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("難易度")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading:
                HStack {
                    Button(action: {
                        ///前画面に戻る
                        presentation.wrappedValue.dismiss()
                        
                    }){
                        HStack {
                            Image(systemName: "chevron.backward")
                                .scaleEffect(1.3)
                                .frame(width: 60, height: 30,alignment: .leading)
                            
                        }
                    }
                }
        )
       
        
    }
}

struct SelectLevelView_Previews: PreviewProvider {
    static var previews: some View {
        SelectLevelView()
                    .environmentObject(QuizViewModel())
    }
}