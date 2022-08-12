//: [Previous](@previous)


//: Music Player with playback code
//: [Protocols - Music Player skeleton](https://www.swiftbysundell.com/basics/protocols/)

import Foundation
// AVplayer Class is assumed built

class AVPlayer(){
    
}

//class Player {
//    private let avPlayer = AVPlayer()
//
//    func play(_ song: Song) {
//        let item = AVPlayerItem(url: song.audioURL)
//        avPlayer.replaceCurrentItem(with: item)
//        avPlayer.play()
//    }
//
//    func play(_ album: Album) {
//        let item = AVPlayerItem(url: album.audioURL)
//        avPlayer.replaceCurrentItem(with: item)
//        avPlayer.play()
//    }
//}

// REMAKE USING PROTOCOLS
protocol AudioURLConvertible {
    var audioURL: URL { get }
}

struct Song: AudioURLConvertible {
    var name: String
    var album: Album
    var audioURL: URL
    var isLiked: Bool
}

struct Album {
    var name: String
    var imageURL: URL
    var audioURL: URL
    var isLiked: Bool
}

extension Album: AudioURLConvertible {}

class Player {
    private let avPlayer = AVPlayer()

    func play(_ resource: AudioURLConvertible) {
        let item = AVPlayerItem(url: resource.audioURL)
        avPlayer.replaceCurrentItem(with: item)
        avPlayer.play()
    }
}


//: [Next](@next)
