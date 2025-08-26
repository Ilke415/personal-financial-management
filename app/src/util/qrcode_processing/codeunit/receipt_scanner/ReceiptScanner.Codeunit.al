namespace STIL.PersonalFinanceManager.Util.Receipt.Scanner;

using System.Text;
using System.Device;
using STIL.PersonalFinanceManager.Util.AddIns;

codeunit 50102 "STI Receipt Scanner"
{
    Access = Internal;

    var
        QRCodeProcessorImpl: Codeunit "STI Receipt Scanner Impl.";

    internal procedure OnControlReady(Control: ControlAddIn "STI Receipt Scanner")
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
        // TODO: Create your own camera page and use it here instead of the default one.
        if not Camera.GetPicture(PictureBytes, PictureName) then
            exit;

        QRCodeProcessorImpl.ScanQRCode(Base64Convert.ToBase64(PictureBytes));
    end;

    internal procedure ProcessReceiptFromUrl(Url: Text)
    begin
    end;
}