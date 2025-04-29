namespace STIL.Util.QRCodeProcessor.Intefaces;

interface "STI QR Code Processor"
{
    Access = Internal;

    procedure ScanQRCode(Args: JsonObject; var Result: Text);
    procedure InitiliazeUI();
}