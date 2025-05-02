namespace STIL.Util.QRCodeProcessor.UI;
using System.Device;
using STIL.Util.QRCodeProcessor.ControlAddins;
using STIL.Util.QRCodeProcessor.Processor.Logic;

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
                usercontrol("STI QR Code Processor"; "STI QR Code Processor")
                {
                    trigger OnControlReady()
                    begin
                        QRCodeProcessor.OnControlReady(CurrPage."STI QR Code Processor");
                    end;

                    trigger OnStartQRCodeScan(Args: JsonObject; Result: JsonObject)
                    begin
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
        QRCodeProcessor: Codeunit "STI QR Code Processor";
}