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
                            Section(header: Text("生態")) {
                                ForEach(quizVM.Level1Array[0...2].indexed(), id: \.1.id) { index,item in
                                    Button(action: {
                                        quizVM.selectCategory = index
                                        levelButtonAction()
                                        
                                    }){
                                        HStack {
                                            Text("\(item.title)\(index+1)")
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
                            Section(header: Text("暮らし")) {
                                ForEach(quizVM.Level1Array[3...5].indexed(), id: \.1.id) { index,item in
                                    Button(action: {
                                        quizVM.selectCategory = index
                                        levelButtonAction()
                                        
                                    }){
                                        HStack {
                                            Text("\(item.title)\(index+1)")
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
                            Section(header: Text("歴史")) {
                                ForEach(quizVM.Level1Array[6...8].indexed(), id: \.1.id) { index,item in
                                    Button(action: {
                                        quizVM.selectCategory = index
                                        levelButtonAction()
                                        
                                    }){
                                        HStack {
                                            Text("\(item.title)\(index+1)")
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
                            Section(header: Text("文化")) {
                                ForEach(quizVM.Level1Array[9...11].indexed(), id: \.1.id) { index,item in
                                    Button(action: {
                                        quizVM.selectCategory = index
                                        levelButtonAction()
                                        
                                    }){
                                        HStack {
                                            Text("\(item.title)\(index+1)")
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
                        }
                        if quizVM.selectLevel == 2  {
                            Section(header: Text("生態")) {
                                ForEach(quizVM.Level2Array[0...2].indexed(), id: \.1.id) { index,item in
                                    Button(action: {
                                        quizVM.selectCategory = index
                                        levelButtonAction()
                                        
                                    }){
                                        HStack {
                                            Text("\(item.title)\(index+1)")
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
                            Section(header: Text("暮らし")) {
                                ForEach(quizVM.Level2Array[3...5].indexed(), id: \.1.id) { index,item in
                                    Button(action: {
                                        quizVM.selectCategory = index
                                        levelButtonAction()
                                        
                                    }){
                                        HStack {
                                            Text("\(item.title)\(index+1)")
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
                            Section(header: Text("歴史")) {
                                ForEach(quizVM.Level2Array[6...8].indexed(), id: \.1.id) { index,item in
                                    Button(action: {
                                        quizVM.selectCategory = index
                                        levelButtonAction()
                                        
                                    }){
                                        HStack {
                                            Text("\(item.title)\(index+1)")
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
                            Section(header: Text("文化")) {
                                ForEach(quizVM.Level2Array[9...11].indexed(), id: \.1.id) { index,item in
                                    Button(action: {
                                        quizVM.selectCategory = index
                                        levelButtonAction()
                                        
                                    }){
                                        HStack {
                                            Text("\(item.title)\(index+1)")
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
                        }
                        if quizVM.selectLevel == 3  {
                            Section(header: Text("生態")) {
                                ForEach(quizVM.Level3Array[0...2].indexed(), id: \.1.id) { index,item in
                                    Button(action: {
                                        quizVM.selectCategory = index
                                        levelButtonAction()
                                        
                                    }){
                                        HStack {
                                            Text("\(item.title)\(index+1)")
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
                            Section(header: Text("暮らし")) {
                                ForEach(quizVM.Level3Array[3...5].indexed(), id: \.1.id) { index,item in
                                    Button(action: {
                                        quizVM.selectCategory = index
                                        levelButtonAction()
                                        
                                    }){
                                        HStack {
                                            Text("\(item.title)\(index+1)")
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
                            Section(header: Text("歴史")) {
                                ForEach(quizVM.Level3Array[6...8].indexed(), id: \.1.id) { index,item in
                                    Button(action: {
                                        quizVM.selectCategory = index
                                        levelButtonAction()
                                        
                                    }){
                                        HStack {
                                            Text("\(item.title)\(index+1)")
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
                            Section(header: Text("文化")) {
                                ForEach(quizVM.Level3Array[8...11].indexed(), id: \.1.id) { index,item in
                                    Button(action: {
                                        quizVM.selectCategory = index
                                        levelButtonAction()
                                        
                                    }){
                                        HStack {
                                            Text("\(item.title)\(index+1)")
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
                        }
                        
                    }///謎の空白を埋める
                    .listStyle(PlainListStyle())
                
                Spacer()
                
                AdView()
                    .frame(maxWidth:.infinity, maxHeight: 60.0)
                
          
            }
            .onAppear(){
                //初期データ入れ込み
                if quizVM.Level1Array.count <= 0 {
                    if quizVM.selectLevel == 1 {
                        quizVM.Level1Array = makeLevel1()
                    }else if quizVM.selectLevel == 2 {
                        quizVM.Level2Array = makeLevel2()
                    }else if quizVM.selectLevel == 3 {
                        quizVM.Level3Array = makeLevel3()
                    }
                }
                    
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
