import UIKit
import Flutter

enum MineChannelMethod: String {
    case AvatarPick = "sel_avatar"
}

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    private var channel: FlutterMethodChannel?
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        
        guard let flutterVC = window?.rootViewController as? FlutterViewController, let messenger = flutterVC as? FlutterBinaryMessenger else {
            return super.application(application, didFinishLaunchingWithOptions: launchOptions)
        }
        
        let mineChannel = FlutterMethodChannel.init(name: "mine_header/channel", binaryMessenger: messenger)
        mineChannel.setMethodCallHandler { call, result in
            guard call.method.isEmpty == false, let method = MineChannelMethod(rawValue: call.method) else {
                return
            }
            
            switch method {
            case .AvatarPick:
                let picker = UIImagePickerController()
                picker.modalPresentationStyle = .overFullScreen
                picker.delegate = self
                flutterVC.present(picker, animated: true, completion: nil)
            }
        }
        
        channel = mineChannel
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

extension AppDelegate: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imgPath = (info[UIImagePickerController.InfoKey.imageURL] as? URL)?.absoluteString, imgPath.count > 8 {
            let path = String(imgPath.suffix(from: String.Index.init(utf16Offset: 7, in: imgPath)))
            channel?.invokeMethod("rec_imagePath", arguments: path)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
