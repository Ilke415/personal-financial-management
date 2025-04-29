namespace STIL.Util.QRCodeProcessor.ControlAddins;

controladdin "STI QR Code Processor"
{
    HorizontalStretch = true;
    Images = './src/util/qrcodeprocessor/controladdin/libs/qrcode.processor.lib.wasm',
             './src/util/qrcodeprocessor/controladdin/assets/qr-code-scanner-icon.jpg';
    RequestedHeight = 400;
    RequestedWidth = 400;
    Scripts = './src/util/qrcodeprocessor/controladdin/scripts/main.js',
              './src/util/qrcodeprocessor/controladdin/libs/wasm.exec.js';
    StartupScript = './src/util/qrcodeprocessor/controladdin/scripts/startup.js';
    StyleSheets = './src/util/qrcodeprocessor/controladdin/styles/main.css';
    VerticalStretch = true;

    event OnControlReady();
    event OnScanQRCode(Args: JsonObject; Result: Text);
    procedure InitiliazeUI();
    procedure ScanQRCode(Args: JsonObject; Result: Text);
}