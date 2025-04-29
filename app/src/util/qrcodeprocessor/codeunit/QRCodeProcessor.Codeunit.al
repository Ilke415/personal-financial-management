namespace STIL.Util.QRCodeProcessor.Logic;
using System.Text;
using System.Device;
using STIL.Util.QRCodeProcessor.ControlAddins;

codeunit 50102 "STI QR Code Processor"
{
    Access = Internal;

    var
        QRCodeProcessorImpl: Codeunit "STI QR Code Processor Impl.";

    internal procedure OnControlReady(Control: ControlAddIn "STI QR Code Processor")
    begin
        QRCodeProcessorImpl.OnControlReady(Control);
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

        QRCodeProcessorImpl.ScanQRCode(Base64Convert.ToBase64(PictureBytes));
    end;

    internal procedure ProcessReceiptFromUrl(Url: Text)
    begin
    end;
}