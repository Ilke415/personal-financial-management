namespace STIL.PersonalFinanceManager.Util.AddIns;

controladdin "STI Receipt Scanner"
{
    HorizontalStretch = true;
    Images = './src/util/qrcode_processing/controladdin/receipt_scanner/assets/qr-code-scanner-icon.jpg',
             './src/util/qrcode_processing/controladdin/receipt_scanner/assets/url-icon.jpg';
    RequestedHeight = 400;
    RequestedWidth = 400;
    Scripts = './src/util/qrcode_processing/controladdin/receipt_scanner/scripts/receipt_scanner.js';
    StartupScript = './src/util/qrcode_processing/controladdin/receipt_scanner/scripts/receipt_scanner.startup.js';
    StyleSheets = './src/util/qrcode_processing/controladdin/receipt_scanner/styles/main.css';
    VerticalStretch = true;

    event OnControlReady();
    event OnScanRequestStart(Args: JsonObject; Result: JsonObject);
    event OnScanRequestFinish(Args: JsonObject; Result: JsonObject);
    procedure Initiliaze();
    procedure ScanReceipt(Args: JsonObject; Result: JsonObject);
}