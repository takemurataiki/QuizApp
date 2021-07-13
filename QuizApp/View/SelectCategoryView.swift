//
//  SelectQuizView.swift
//  QuizApp
//
//  Created by 竹村　太喜 on 2021/05/27.
//

import SwiftUI

struct SelectCategoryView: View {
    //Model
    @State var quiz: Question
    @State var category: Level1
    //VM
    @EnvironmentObject var quizVM: QuizViewModel
    @Environment(\.presentationMode) var presentation
    
    //ボタンをタップしたかどうか
    @State var btnTap:Bool = false
    @Binding var isShow: Bool
    
    
    @State var selectTag = 0
    
    //3つのボタンを押した時どのボタンを押したか判断する
    func levelButtonAction() {
        btnTap = true
    }
    
    var body: some View {
        ZStack {
            
            Color(red: 0.85, green: 0.7, blue: 1, opacity: 0.5).ignoresSafeArea(.all)
            
            VStack {
                    List {
                        if quizVM.selectLevel == 1  {
                            ForEach(quizVM.Level1Array.indexed(), id: \.1.id) { index,item in
                                Button(action: {
                                    quizVM.selectCategory = index
                                    levelButtonAction()
                                    
                                }){
                                    HStack {
                                        Text("\(item.title)\(quizVM.selectLevel)-\(index+1)")
                                        Spacer()
                                        HStack {
                                            Image(item.mark)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 25, height: 25)
                                            
                                            Text("\(item.score)/5")
                                                .padding(.trailing, 10.0)
                                        }
                                            
                                    }
                                }
                                .background(
                                    NavigationLink(destination:QuizView(isShow: $isShow,
                                                                        quiz: Question.default,
                                                                        category1: $quizVM.Level1Array[index],
                                                                        category2: $quizVM.Level2Array[index],
                                                                        category3: $quizVM.Level3Array[index]
                                                                        )){

                                    }
                                    .isDetailLink(false)
    //                                .buttonStyle(PlainButtonStyle())
                                )
                              
                                
                            }
                            .listRowBackground(Color(red: 0.85, green: 0.7, blue: 1, opacity: 0.5).ignoresSafeArea(.all))
                            
                        }
                        if quizVM.selectLevel == 2  {
                            
                            ForEach(quizVM.Level2Array.indexed(), id: \.1.id) { index,item in
                                Button(action: {
                                    quizVM.selectCategory = index
                                    levelButtonAction()
                                    
                                }){
                                    HStack {
                                        Text("\(item.title)\(quizVM.selectLevel)-\(index+1)")
                                        Spacer()
                                        Image(item.mark)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 25, height: 25)
                                        

                                        Text("\(item.score)/5")
                                            .padding(.trailing, 10.0)
                                    }
                                }
                                .background(
                                    NavigationLink(destination:QuizView(isShow: $isShow,
                                                                        quiz: Question.default,
                                                                        category1: $quizVM.Level1Array[index],
                                                                        category2: $quizVM.Level2Array[index],
                                                                        category3: $quizVM.Level3Array[index])){

                                    }
                                    .isDetailLink(false)
    //                                .buttonStyle(PlainButtonStyle())
                                )
                               
                            }
                            .listRowBackground(Color(red: 0.85, green: 0.7, blue: 1, opacity: 0.5).ignoresSafeArea(.all))
                            
                            
                            
                        }
                        if quizVM.selectLevel == 3  {
                        
                            ForEach(quizVM.Level3Array.indexed(), id: \.1.id) { index,item in
                                Button(action: {
                                    quizVM.selectCategory = index
                                    levelButtonAction()
                                    
                                }){
                                    HStack {
                                        Text("\(item.title)\(quizVM.selectLevel)-\(index+1)")
                                        Spacer()
                                        Image(item.mark)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 25, height: 25)
                                        

                                        Text("\(item.score)/5")
                                            .padding(.trailing, 10.0)
                                    }
                                }
                                .background(
                                    NavigationLink(destination:QuizView(isShow: $isShow,quiz: Question.default,
                                                                        category1: $quizVM.Level1Array[index],
                                                                        category2: $quizVM.Level2Array[index],
                                                                        category3: $quizVM.Level3Array[index])){

                                    }
                                    .isDetailLink(false)
    //                                .buttonStyle(PlainButtonStyle())
                                )
                              
                                
                            }
                            .listRowBackground(Color(red: 0.85, green: 0.7, blue: 1, opacity: 0.5).ignoresSafeArea(.all))
                        
                        }
                        
                    }///謎の空白を埋める
                    .listStyle(PlainListStyle())
                    .onAppear(){
                        
                    }
                
                Spacer()
                
                
                AdView()
                    .frame(maxWidth:.infinity, maxHeight: 60.0)
                
          
            }
            
           
        }
        .navigationTitle("レベル\(quizVM.selectLevel)")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading:
                HStack {
                    Button(action: {
                        ///前画面に戻る
                        presentation.wrappedValue.dismiss()
                        
                    }){
                        Image(systemName: "chevron.backward")
                            .scaleEffect(1.3)
                            .frame(width: 60, height: 30,alignment: .leading)
                    }
                }
        )
    }
}

struct SelectCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        SelectCategoryView(quiz: Question.default, category: Level1.default, isShow: .constant(false))
            .environmentObject(QuizViewModel())
    }
}
