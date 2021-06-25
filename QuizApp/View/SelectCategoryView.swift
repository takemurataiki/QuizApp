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
    @State var category: Category
    //VM
    @EnvironmentObject var quizVM: QuizViewModel
    
    //ボタンをタップしたかどうか
    @State var btnTap:Bool = false
    @Binding var isShow: Bool
    
    
    @State var selectTag = 0
    @State var selection: Int? = nil
    //3つのボタンを押した時どのボタンを押したか判断する
    func levelButtonAction() {
        btnTap = true
    }
    
    var body: some View {
        ZStack {
            
            Color(red: 0.85, green: 0.7, blue: 1, opacity: 0.5).ignoresSafeArea(.all)
            
            VStack {
                
                Text("問題カテゴリーを選択してください")
                    .font(.title2)
                    .fontWeight(.regular)
                    .lineLimit(nil)
                    .padding(.all, 15.0)
                    
                Spacer()
                
                    List {
                        ForEach(quizVM.categoriesArray.indexed(), id: \.1.id) { index,item in
                            Button(action: {
                                quizVM.selectCategory = index
                                levelButtonAction()
                                print("選択したカテゴリ\(quizVM.selectCategory+1)")
                                
                            }){
                                HStack {
                                    Text("\(item.title)\(index+1)")
                                    Spacer()
                                    Image(systemName: item.mark)
                                        .foregroundColor(Color.yellow)
                                    Text("\(item.score)/5")
                                        .padding(.trailing, 10.0)
                                }
                            }
                            .background(
                                NavigationLink(destination:QuizView(isShow: $isShow,quiz: Question.default,category: $quizVM.categoriesArray[index])){

                                }
                                .isDetailLink(false)
                                .buttonStyle(PlainButtonStyle())
                            )
                          
                            
                        }
                        .listRowBackground(Color(red: 0.85, green: 0.7, blue: 1, opacity: 0.5).ignoresSafeArea(.all))
                        
                    }///謎の空白を埋める
                    .listStyle(PlainListStyle())
                
                   
               
                Spacer()
                
                AdView()
                    .frame(maxWidth:.infinity, maxHeight: 60.0)
                
          
            }
            .onDisappear(){
                
            }
        }
        }
}

struct SelectCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        SelectCategoryView(quiz: Question.default, category: Category.default, isShow: .constant(false))
            .environmentObject(QuizViewModel())
    }
}
