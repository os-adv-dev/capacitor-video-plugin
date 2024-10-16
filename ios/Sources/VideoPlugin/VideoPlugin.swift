import Foundation
import Capacitor
import AVKit
import UIKit

@objc(VideoPlugin)
public class VideoPlugin: CAPPlugin, CAPBridgedPlugin {
    
    private let NO_URL_PROVIDED = "No video url provided"
    public let identifier = "VideoPlugin"
    public let jsName = "Video"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "playVideo", returnType: CAPPluginReturnPromise)
    ]

    @objc func playVideo(_ call: CAPPluginCall) {
        let videoUrl = call.getString("video") ?? NO_URL_PROVIDED
        
        if(videoUrl == NO_URL_PROVIDED) {
            call.reject(NO_URL_PROVIDED)
            return
        } else {
            guard let uriUrl = URL(string: videoUrl) else {
                call.reject("Invalid URL")
                return
            }
            let player = AVPlayer(url: uriUrl)
            DispatchQueue.main.async {
                let controller = AVPlayerViewController()
                controller.player = player
                self.bridge?.viewController?.present(controller, animated: true) {
                    player.play()
                }
                call.resolve()
            }
        }
    }
}
