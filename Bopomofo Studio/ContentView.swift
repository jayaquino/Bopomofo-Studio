//
//  ContentView.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 7/19/21.
//

import SwiftUI
import AVKit
import GoogleMobileAds

class SoundManager{
    
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    
    func playSound(sound: String){
        
        guard let url = Bundle.main.url(forResource: sound, withExtension:".mp3")
        else { return}
        do {
            player = try AVAudioPlayer(contentsOf:url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
}

class BannerAdVC: UIViewController {
    let adUnitId: String
    
    //Initialize variable
    init(adUnitId: String) {
        self.adUnitId = adUnitId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var bannerView: GADBannerView = GADBannerView() //Creates your BannerView
    override func viewDidLoad() {
        bannerView.adUnitID = adUnitId
        bannerView.rootViewController = self
      
        //Add our BannerView to the VC
        view.addSubview(bannerView)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadBannerAd()
    }

    //Allows the banner to resize when transition from portrait to landscape orientation
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate { _ in
            self.bannerView.isHidden = true //So banner doesn't disappear in middle of animation
        } completion: { _ in
            self.bannerView.isHidden = false
            self.loadBannerAd()
        }
    }

    func loadBannerAd() {
        let frame = view.frame.inset(by: view.safeAreaInsets)
        let viewWidth = frame.size.width

        //Updates the BannerView size relative to the current safe area of device (This creates the adaptive banner)
        bannerView.adSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(viewWidth)

        bannerView.load(GADRequest())
    }
}

final class BannerAd: UIViewControllerRepresentable {
    let adUnitId: String
    
    init(adUnitId: String) {
        self.adUnitId = adUnitId
    }
    
    
    func makeUIViewController(context: Context) -> BannerAdVC {
        return BannerAdVC(adUnitId: adUnitId)
    }

    func updateUIViewController(_ uiViewController: BannerAdVC, context: Context) {
        
    }
}

struct ContentView: View {

    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    let textBPMFSize = CGFloat(60)
    
    var teal = Color(red: 49 / 255, green: 163 / 255, blue: 159 / 255)
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                HStack{
                    
                    Text("Bo ㄅ").font(.custom("Signpainter", size: textBPMFSize))
                    Spacer()
                    Text("Po ㄆ").font(.custom("Signpainter", size: textBPMFSize))
                    Spacer()
                    Spacer()
                    Spacer()
                }
                
                HStack{
                    Spacer()
                    Spacer()
                    Text("Mo ㄇ").font(.custom("Signpainter", size: textBPMFSize))
                    Spacer()
                    Text("Fo ㄈ").font(.custom("Signpainter", size: textBPMFSize))
                    Spacer()
                }
                
                
                HStack{
                    Spacer()
                    Spacer()
                    Text("Studio")
                        .font(.custom("copperplate", size: 70))
                        .foregroundColor(teal)
                        .padding()
                }
                
                NavigationLink(destination: ZhuyinSettings()) {
                    Text("Zhuyin")
                        .frame(minWidth: 0, maxWidth: 300)
                        .padding()
                        .foregroundColor(.white)
                        .background(teal)
                        .cornerRadius(40)
                }

                NavigationLink(destination: VocabularySettings()){
                    Text("Vocabulary")
                        .frame(minWidth: 0, maxWidth: 300)
                        .padding()
                        .foregroundColor(.white)
                        .background(teal)
                        .cornerRadius(40)
                    
                }
                
            }
            .font(.custom("copperplate", size: 20))
            .foregroundColor(teal)
            .frame(minWidth:0,maxWidth:screenWidth)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
