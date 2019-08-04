//
//  SoundHelper.swift
//  ARExperiment
//
//  Created by Salgara on 8/4/19.
//  Copyright © 2019 Salgara. All rights reserved.
//

import AVFoundation

class SoundHelper{
    
    public static let shared = SoundHelper()
    
    private var audioPlayer: AVAudioPlayer?
    
    enum Themes: String{
        case main = "jojo"
    }
    
    func play(theme: Themes) -> Bool{
        guard let path = Bundle.main.path(forResource: theme.rawValue, ofType: "mp3") else { return false }
        let url = URL(fileURLWithPath: path)
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
            print("PLAY")
        }catch{
            print("ERROR: \(error.localizedDescription)")
            return false
        }
        return true
    }
    
}
