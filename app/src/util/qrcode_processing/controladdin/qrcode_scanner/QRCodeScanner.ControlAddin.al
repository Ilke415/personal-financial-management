namespace STIL.PersonalFinanceManager.Util.AddIns;

controladdin "STI QR Code Scanner"
{
    HorizontalStretch = false;
    Images = './src/util/qrcode_processing/controladdin/qrcode_scanner/libs/zxing_reader.wasm';
    RequestedHeight = 1;
    RequestedWidth = 1;
    Scripts = './src/util/qrcode_processing/controladdin/qrcode_scanner/scripts/qrcodescanner.js',
              './src/util/qrcode_processing/controladdin/qrcode_scanner/libs/wasm.exec.js',
              './src/util/qrcode_processing/controladdin/qrcode_scanner/libs/zxing_reader.js';
    StartupScript = './src/util/qrcode_processing/controladdin/qrcode_scanner/scripts/qrcodescanner.startup.js';
    StyleSheets = './src/util/qrcode_processing/controladdin/qrcode_scanner/styles/main.css';
    VerticalStretch = false;

    event OnControlReady();
    event OnScanRequestFinish(Result: JsonObject);
    procedure Initiliaze();
}