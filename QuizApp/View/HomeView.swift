//
//  HomeView.swift
//  QuizApp
//
//  Created by 竹村　太喜 on 2021/05/05.
//

import SwiftUI

struct HomeView: View {
    

    
    @EnvironmentObject var quizVM: QuizViewModel
    
    var body: some View {
        
//        NavigationView {
            ZStack {
                Color(red: 0.85, green: 0.7, blue: 1, opacity: 0.5).ignoresSafeArea(.all)
                VStack {
                    Text("◯◯検定")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .padding(.all, 30.0)


                    Spacer()

                    //スタートボタン
                    NavigationLink(destination: SelectLevelView()){
                        Text("スタート")
                            .frame(maxWidth:.infinity, maxHeight: 80.0)
                            .background(Color.white)
                    }
                    .isDetailLink(false)
                    .padding(.all, 20.0)

                    
//                    Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
//                        Text("復習")
//                            .padding(.all, 30.0)
//                            .frame(width: 300.0, height: 80.0)
//                            .background(Color.white)
//                    }
//                    Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
//                        Text("テスト")
//                            .padding(.all, 30.0)
//                            .frame(width: 300.0, height: 80.0)
//                            .background(Color.white)
//                    }
                    Spacer()

                    AdView()
                        .frame(maxWidth:.infinity, maxHeight: 60.0)
                }


            }
            .navigationBarHidden(true)

//        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(QuizViewModel())
        
    }
}
