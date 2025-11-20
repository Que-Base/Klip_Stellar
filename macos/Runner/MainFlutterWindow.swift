import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    // self.setFrame(windowFrame, display: true)

    self.setFrame(NSRect(x: windowFrame.origin.x, y: windowFrame.origin.y, width: 390, height: 295), display: true) 

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
