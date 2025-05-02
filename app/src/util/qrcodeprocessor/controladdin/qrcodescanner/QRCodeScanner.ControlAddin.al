namespace STIL.Util.QRCodeProcessor.ControlAddins;

controladdin "STI QR Code Scanner"
{
    HorizontalStretch = false;
    Images = './src/util/qrcodeprocessor/controladdin/qrcodescanner/libs/zxing_reader.wasm';
    RequestedHeight = 1;
    RequestedWidth = 1;
    Scripts = './src/util/qrcodeprocessor/controladdin/qrcodescanner/scripts/qrcodescanner.js',
              './src/util/qrcodeprocessor/controladdin/qrcodescanner/libs/wasm.exec.js',
              './src/util/qrcodeprocessor/controladdin/qrcodescanner/libs/zxing_reader.js';
    StartupScript = './src/util/qrcodeprocessor/controladdin/qrcodescanner/scripts/qrcodescanner.startup.js';
    StyleSheets = './src/util/qrcodeprocessor/controladdin/qrcodescanner/styles/main.css';
    VerticalStretch = false;

    event OnControlReady();
    event OnStartQRCodeScan(Args: JsonObject; Result: JsonObject);
    event OnFinishQRCodeScan(Args: JsonObject; Result: JsonObject);
    procedure Initiliaze();
    procedure ScanQRCode(Args: JsonObject; Result: JsonObject);
}