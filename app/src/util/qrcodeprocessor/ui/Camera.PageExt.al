namespace STIL.Util.QRCodeProcessor.UI;

using System.Device;
using STIL.Util.QRCodeProcessor.ControlAddins;
using STIL.Util.QRCodeProcessor.Scanner.Logic;

pageextension 50100 "STI Camera" extends Camera
{
    layout
    {
        addlast(Content)
        {
            group("STI General")
            {
                Caption = 'Camera';
                usercontrol("STI QR Code Scanner"; "STI QR Code Scanner")
                {
                    ApplicationArea = All;
                    trigger OnControlReady()
                    begin
                        QRCodeScanner.OnControlReady(CurrPage."STI QR Code Scanner");
                    end;
                }
            }
        }
    }

    var
        QRCodeScanner: Codeunit "STI QR Code Scanner";
}