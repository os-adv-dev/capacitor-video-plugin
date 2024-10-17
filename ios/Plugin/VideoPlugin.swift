import Foundation
import Capacitor
import AVKit
import UIKit
import CoreBluetooth

@objc(VideoPlugin)
public class VideoPlugin: CAPPlugin, CAPBridgedPlugin, CBCentralManagerDelegate {
    
    private let NO_URL_PROVIDED = "No video url provided"
    public let identifier = "VideoPlugin"
    public let jsName = "Video"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "playVideo", returnType: CAPPluginReturnPromise)
    ]

    private var centralManager: CBCentralManager?
    
    // This method will be called to check Bluetooth status and ask for permission
    private func checkBluetoothPermission() {
        self.centralManager = CBCentralManager(delegate: self, queue: nil, options: [CBCentralManagerOptionShowPowerAlertKey: true])
    }

    // CBCentralManagerDelegate method to monitor Bluetooth state
    public func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            print("Bluetooth is On")
            // Bluetooth is available
        case .poweredOff:
            print("Bluetooth is Off")
            // Show alert to the user that Bluetooth is off
        case .unauthorized:
            print("Bluetooth access is unauthorized")
            // Handle the case where Bluetooth access is not granted
        case .unsupported:
            print("Bluetooth is not supported on this device")
        case .unknown, .resetting:
            print("Bluetooth state is unknown or resetting")
        @unknown default:
            print("Unknown state")
        }
    }

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
            
            checkBluetoothPermission()
            
            /**let player = AVPlayer(url: uriUrl)
            DispatchQueue.main.async {
                let controller = AVPlayerViewController()
                controller.player = player
                self.bridge?.viewController?.present(controller, animated: true) {
                    player.play()
                }
                call.resolve()
            }**/
        }
    }
}
