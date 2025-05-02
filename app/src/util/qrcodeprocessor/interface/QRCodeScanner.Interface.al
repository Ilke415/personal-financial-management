namespace STIL.Util.QRCodeProcessor.Interfaces;

interface "STI QR Code Scanner"
{
    Access = Internal;

    procedure ScanQRCode(Args: JsonObject; var Result: JsonObject);
    procedure Initiliaze();
}
