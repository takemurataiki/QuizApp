//
//  ColorTestView.swift
//  QuizApp
//
//  Created by 竹村　太喜 on 2021/05/09.
//

import SwiftUI

struct ColorTestView: View {
    @State private var redRatio     = 1.0   // 赤の割合
        @State private var greenRatio   = 1.0   // 緑の割合
        @State private var blueRatio    = 1.0   // 青の割合
        @State private var opacity      = 1.0   // 不透明度
    // HSBA; hue: 色相, saturation: 彩度, brightness: 明度, alpha: 透明度
    let hsba = UIColor(hue: 0.75, saturation: 0.3, brightness: 1.0, alpha: 0.5)
    var color = Color(red: 0.85, green: 0.7, blue: 1, opacity: 0.5)
     
    @State var hue : CGFloat = 0
    @State var sat : CGFloat = 0
    @State var bri : CGFloat = 0
    @State var alp : CGFloat = 0
        
        var body: some View {
            VStack {
                Text("カラー調整")
                    .font(.largeTitle)
                
                // RGBで色指定
                HStack {
                    Color(red: redRatio, green: greenRatio, blue: blueRatio, opacity: opacity)
                        .frame(width: 100, height: 100)
                    Color(UIColor(hue: CGFloat(redRatio), saturation:CGFloat(greenRatio), brightness: CGFloat(blueRatio), alpha: CGFloat(opacity)))
                }
                
                
                
                
                AdjustmentView(parameterName: "Red", parameter: $redRatio)
                AdjustmentView(parameterName: "Green", parameter: $greenRatio)
                AdjustmentView(parameterName: "Blue", parameter: $blueRatio)
                AdjustmentView(parameterName: "opacity", parameter: $opacity)
            }
        }
}

// パラメーター調整用カスタムView
struct AdjustmentView: View {
    var parameterName: String
    @Binding var parameter: Double
    
    var body: some View {
        HStack {
            Text(parameterName)
                .frame(width: 60)
            Slider(value: $parameter, in: 0...1, step: 0.01)
            Text("\(parameter, specifier: "%.2f")")
        }
        .padding()
    }
}

struct ColorTestView_Previews: PreviewProvider {
    static var previews: some View {
        ColorTestView()
    }
}
