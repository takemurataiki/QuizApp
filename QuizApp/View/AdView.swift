//
//  AdView.swift
//  QuizApp
//
//  Created by 竹村　太喜 on 2021/05/09.
//

import SwiftUI
import GoogleMobileAds

struct AdView: UIViewRepresentable {
    func makeUIView(context: Context) -> GADBannerView {
        let banner = GADBannerView(adSize: kGADAdSizeBanner)
        // 以下は、バナー広告向けのテスト専用広告ユニットIDです。自身の広告ユニットIDと置き換えてください。
        banner.adUnitID = "ca-app-pub-3638997642143082/6819463482"
        banner.rootViewController = UIApplication.shared.windows.first?.rootViewController
        banner.load(GADRequest())
        return banner
    }

    func updateUIView(_ uiView: GADBannerView, context: Context) {
    }
}

struct SubView: View {
    var body: some View {
        AdView().frame(width: 320, height: 50)
        // サイズを変更する場合
        // AdView().frame(width: 320, height: 50)
    }
}



struct AdView_Previews: PreviewProvider {
    static var previews: some View {
        SubView()
    }
}
