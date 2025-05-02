namespace STIL.Util.QRCodeProcessor.ControlAddins;

controladdin "STI QR Code Scanner"
{
    HorizontalStretch = true;
    Images = './src/util/qrcodeprocessor/controladdin/qrcodescanner/libs/zxing_reader.wasm',
             './src/util/qrcodeprocessor/controladdin/qrcodescanner/assets/qr-code-scanner-icon.jpg',
             './src/util/qrcodeprocessor/controladdin/qrcodescanner/assets/url-icon.jpg';
    RequestedHeight = 400;
    RequestedWidth = 400;
    Scripts = './src/util/qrcodeprocessor/controladdin/qrcodescanner/scripts/qrcodescanner.js',
              './src/util/qrcodeprocessor/controladdin/qrcodescanner/libs/wasm.exec.js',
              './src/util/qrcodeprocessor/controladdin/qrcodescanner/libs/zxing_reader.js';
    StartupScript = './src/util/qrcodeprocessor/controladdin/qrcodescanner/scripts/qrcodescanner.startup.js';
    StyleSheets = './src/util/qrcodeprocessor/controladdin/qrcodescanner/styles/main.css';
    VerticalStretch = true;

    event OnControlReady();
    event OnStartQRCodeScan(Args: JsonObject; Result: JsonObject);
    event OnFinishQRCodeScan(Args: JsonObject; Result: JsonObject);
    procedure InitiliazeUI();
    procedure ScanQRCode(Args: JsonObject; Result: JsonObject);
}