namespace STIL.Util.QRCodeProcessor.Interfaces;

interface "STI QR Code Processor"
{
    Access = Internal;

    procedure ScanQRCode(Args: JsonObject; var Result: JsonObject);
    procedure Initiliaze();
}