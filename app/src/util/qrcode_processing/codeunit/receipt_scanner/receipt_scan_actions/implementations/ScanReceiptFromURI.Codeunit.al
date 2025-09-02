namespace STIL.PersonalFinanceManager.Util.Receipt.Scanner;

using app.app;

codeunit 50109 "STI ScanReceiptFromURI" implements STIIReceiptScanActionProvider
{
    Access = Internal;

    procedure ProcessReceiptScan()
    var
        EnterReceiptURI: Page "STI Enter Receipt URI";
        ReceiptURI: Text;
        ReceiptURIRequiredLbl: Label 'Receipt URI is required.';
    begin
        if EnterReceiptURI.RunModal() = Action::OK then
            ReceiptURI := EnterReceiptURI.GetReceiptURI()
        else
            exit;

        if ReceiptURI = '' then
            Error(ReceiptURIRequiredLbl);

        // Call web service to process receipt
    end;
}
