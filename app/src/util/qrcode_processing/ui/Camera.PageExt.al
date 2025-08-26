namespace STIL.PersonalFinanceManager.Util.UI;

using System.Device;
using STIL.PersonalFinanceManager.Util.AddIns;
using STIL.PersonalFinanceManager.Util.QRCode.Scanner;

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

                    trigger OnFinishQRCodeScan(Result: JsonObject)
                    begin
                        ScanResult := Result;
                        CurrPage.Close();
                    end;
                }
            }
        }
    }

    internal procedure STILGetScanResult(ScanResultOut: JsonObject)
    begin
        ScanResultOut := ScanResult;
    end;

    var
        QRCodeScanner: Codeunit "STI QR Code Scanner";
        ScanResult: JsonObject;
}