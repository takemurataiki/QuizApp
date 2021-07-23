//
//  SettingView.swift
//  QuizApp
//
//  Created by 竹村　太喜 on 2021/05/28.
//

import SwiftUI

struct SettingView: View {
    
    @State var setArray = []
    
    //シェア機能
    func actionSheet() {
        //アプリ共有
            guard let urlShare = URL(string: "https://developer.apple.com/xcode/swiftui/") else { return }
            let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
            UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
        }
    var body: some View {
        ZStack {
            Color(red: 0.85, green: 0.7, blue: 1, opacity: 0.5).ignoresSafeArea(.all)
            VStack {
                Spacer()
                
                List(){
                    //シェアボタン
                    Button(action: actionSheet) {
                        HStack {
                            Image(systemName: "square.and.arrow.up")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 36, height: 36)
                            Text("シェア")
                                
                                }
                        
                    }
                }
                .listRowBackground(Color(red: 0.85, green: 0.7, blue: 1, opacity: 0.5).ignoresSafeArea(.all))
                
                AdView().frame(width:.infinity, height: 50)
            }
            .navigationTitle("メニュー")
            
        }
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
