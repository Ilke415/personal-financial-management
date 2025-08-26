namespace STIL.PersonalFinanceManager.Util.UI;
using STIL.PersonalFinanceManager.Util.AddIns;
using STIL.PersonalFinanceManager.Util.Receipt.Scanner;

page 50101 "STI Receipt Scanner"
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
                usercontrol("STI Receipt Scanner"; "STI Receipt Scanner")
                {
                    trigger OnControlReady()
                    begin
                        QRCodeProcessor.OnControlReady(CurrPage."STI Receipt Scanner");
                    end;

                    trigger OnStartQRCodeScan(Args: JsonObject; Result: JsonObject)
                    begin
                        // TODO: Add additional enum parameter to determine if the scan is for a QR code or URL
                        QRCodeProcessor.StartQRCodeScan();
                    end;

                    trigger OnFinishQRCodeScan(Args: JsonObject; Result: JsonObject)
                    begin
                        QRCodeProcessor.ProcessReceiptFromUrl('');
                    end;
                }
            }
        }
    }
    var
        QRCodeProcessor: Codeunit "STI Receipt Scanner";
}