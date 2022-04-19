import Flutter
import UIKit
import Vision
import VisionKit

@available(iOS 13.0, *)
public class SwiftFlutterIosDocumentScannerPlugin: NSObject, FlutterPlugin {


  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_ios_document_scanner", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterIosDocumentScannerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard call.method == "scan_document" else {
                return
    }
    self.scanDocument(call:call, result: result)
  }

    // =============== scan function begin ===============
    private func scanDocument(call: FlutterMethodCall, result: @escaping FlutterResult) {
        let scanViewController = VNDocumentCameraViewController()
        let flutterViewController = UIApplication.shared.delegate!.window!!.rootViewController as! FlutterViewController
        scanViewController.delegate = flutterViewController
        flutterViewController.present(scanViewController, animated: true)
        result(true)
    }
    // =============== scan function end ===============
}


// =============== delegate begin ===============
extension FlutterViewController : VNDocumentCameraViewControllerDelegate {
    @available(iOS 13.0, *)
    public func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        guard scan.pageCount >= 1 else {
            controller.dismiss(animated: true)
            return
        }

        for i in 0..<scan.pageCount{
            UIImageWriteToSavedPhotosAlbum(scan.imageOfPage(at: i),self, nil, nil)
        }


        controller.dismiss(animated: true)
    }

    @available(iOS 13.0, *)
    public func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
        //Handle properly error
        controller.dismiss(animated: true)
    }

    @available(iOS 13.0, *)
    public func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        controller.dismiss(animated: true)
    }
}
// =============== delegate end ===============