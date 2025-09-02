namespace STIL.PersonalFinanceManager.Util.Receipt.Scanner;

enum 50101 "STI Receipt Scan Action" implements STIIReceiptScanActionProvider
{
    Extensible = false;
    Access = Internal;

    value(0; "QR Code")
    {
        Caption = 'From QR Code';
        Implementation = STIIReceiptScanActionProvider = "STI ScanReceiptFromQrCode";
    }
    value(1; "URI")
    {
        Caption = 'From URI';
        Implementation = STIIReceiptScanActionProvider = "STI ScanReceiptFromURI";
    }
}