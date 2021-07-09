//
//  ContentView.swift
//  QuizApp
//
//  Created by 竹村　太喜 on 2021/05/05.
//



//トップに戻るを問題画面に戻す
import SwiftUI

struct ContentView: View {
    @State var selectTag = 0
    @EnvironmentObject var quizVM: QuizViewModel
    
    init(){
            //ナビゲーションバーの背景色の設定
        UINavigationBar.appearance().barTintColor = UIColor(hue: 0.75, saturation: 0.16, brightness: 1.0, alpha: 0.5)
        UITableView.appearance().backgroundColor = UIColor(hue: 0.75, saturation: 0.16, brightness: 1.0, alpha: 0.5)
        
        
        
        }

    var body: some View {
        NavigationView {
            VStack {
                
                    HomeView()
                        
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing:
                    HStack {
                        Button(action: {
                           
                            
                        }){
                            HStack {
                                Image(systemName: "gearshape.fill")
                                    .scaleEffect(1.5)
                                    .frame(width: 60, height: 30,alignment: .trailing)
                                
                            }
                        }
                    }
            )
           
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(QuizViewModel())
    }
}
