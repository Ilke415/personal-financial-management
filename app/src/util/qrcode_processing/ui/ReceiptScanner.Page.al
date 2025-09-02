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
                        ReceiptScanner.OnControlReady(CurrPage."STI Receipt Scanner");
                    end;

                    trigger OnScanRequestStart(Args: JsonObject; Result: JsonObject)
                    begin
                        ReceiptScanner.ProcessReceiptScan();
                    end;

                    trigger OnScanRequestFinish(Args: JsonObject; Result: JsonObject)
                    begin
                        ReceiptScanner.ProcessReceiptFromUrl('');
                    end;
                }
            }
        }
    }
    var
        ReceiptScanner: Codeunit "STI Receipt Scanner";
}