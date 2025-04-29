namespace STIL.Util.QRCodeProcessor.UI;
using System.Device;
using STIL.Util.QRCodeProcessor.ControlAddins;
using STIL.Util.QRCodeProcessor.Logic;

page 50101 "STI QR Code Processor"
{
    ApplicationArea = All;
    Caption = 'Receipt Scanner';
    PageType = CardPart;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = '';
                usercontrol("STI QR Code Processor"; "STI QR Code Processor")
                {
                    trigger OnControlReady()
                    begin
                        QRCodeProcessor.OnControlReady(CurrPage."STI QR Code Processor");
                    end;

                    trigger OnScanQRCode(Args: JsonObject; Result: Text)
                    var
                        Camera: Codeunit Camera;
                        PictureBytes: InStream;
                        PictureName: Text;
                    begin
                        Camera.GetPicture(PictureBytes, PictureName);
                        QRCodeProcessor.ScanQRCode('', 100);
                    end;
                }
            }
        }
    }
    var
        QRCodeProcessor: Codeunit "STI QR Code Processor";
}