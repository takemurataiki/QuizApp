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
        

            ZStack {
                Color(red: 0.85, green: 0.7, blue: 1, opacity: 0.5).ignoresSafeArea(.all)
                VStack {
                    HStack {
                        Text("ねこ検定")
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .foregroundColor(Color.black)
                            
                            
                        
                    }
                    .padding(.top, 20.0)
                    Spacer()
                    
                    Image("ねこ検定")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth:.infinity, maxHeight:.infinity)
                        .padding(.all, 20.0)
                    
                        
                    
                    
                    

                    

                    //スタートボタン
                    NavigationLink(destination: SelectLevelView()){
                        Text("スタート")
                            .frame(maxWidth:.infinity, maxHeight: 80.0)
                            .background(Color.white)
                            .cornerRadius(30)
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
//            .navigationBarHidden(true)
//            .navigationBarTitleDisplayMode(.inline)
            
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(QuizViewModel())
        
    }
}
