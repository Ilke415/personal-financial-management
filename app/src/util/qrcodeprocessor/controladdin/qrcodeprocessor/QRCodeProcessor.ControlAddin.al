namespace STIL.Util.QRCodeProcessor.ControlAddins;

controladdin "STI QR Code Processor"
{
    HorizontalStretch = true;
    Images = './src/util/qrcodeprocessor/controladdin/qrcodeprocessor/libs/zxing_reader.wasm',
             './src/util/qrcodeprocessor/controladdin/qrcodeprocessor/assets/qr-code-scanner-icon.jpg',
             './src/util/qrcodeprocessor/controladdin/qrcodeprocessor/assets/url-icon.jpg';
    RequestedHeight = 400;
    RequestedWidth = 400;
    Scripts = './src/util/qrcodeprocessor/controladdin/qrcodeprocessor/scripts/qrcodeprocessor.js',
              './src/util/qrcodeprocessor/controladdin/qrcodeprocessor/libs/wasm.exec.js',
              './src/util/qrcodeprocessor/controladdin/qrcodeprocessor/libs/zxing_reader.js';
    StartupScript = './src/util/qrcodeprocessor/controladdin/qrcodeprocessor/scripts/qrcodeprocessor.startup.js';
    StyleSheets = './src/util/qrcodeprocessor/controladdin/qrcodeprocessor/styles/main.css';
    VerticalStretch = true;

    event OnControlReady();
    event OnStartQRCodeScan(Args: JsonObject; Result: JsonObject);
    event OnFinishQRCodeScan(Args: JsonObject; Result: JsonObject);
    procedure InitiliazeUI();
    procedure ScanQRCode(Args: JsonObject; Result: JsonObject);
}