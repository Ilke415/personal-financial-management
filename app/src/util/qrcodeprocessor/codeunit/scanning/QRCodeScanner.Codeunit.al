namespace STIL.Util.QRCodeProcessor.Scanner.Logic;

using System.Text;
using System.Device;
using STIL.Util.QRCodeProcessor.ControlAddins;

codeunit 50106 "STI QR Code Scanner"
{
    Access = Internal;

    var
        QRCodeScannerImpl: Codeunit "STI QR Code Scanner Impl.";

    internal procedure OnControlReady(Control: ControlAddIn "STI QR Code Scanner")
    begin
        QRCodeScannerImpl.OnControlReady(Control);
    end;

    internal procedure StartQRCodeScan()
    var
        Base64Convert: Codeunit "Base64 Convert";
        Camera: Codeunit Camera;
        PictureBytes: InStream;
        PictureName: Text;
        CameraPage: Page Camera;
    begin
        if not Camera.GetPicture(PictureBytes, PictureName) then
            exit;

        QRCodeScannerImpl.ScanQRCode(Base64Convert.ToBase64(PictureBytes));
    end;

}