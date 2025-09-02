namespace STIL.PersonalFinanceManager.Util.Receipt.Scanner;

using System.Device;
using STIL.PersonalFinanceManager.Archive;
using STIL.PersonalFinanceManager.Helper;

codeunit 50105 "STI ScanReceiptFromQrCode" implements STIIReceiptScanActionProvider
{
    Access = Internal;

    procedure ProcessReceiptScan()
    var
        ReceiptScanSessionLog: Record "STI Receipt Scan Session Log";
        ReceiptScanSessionGlobal: Codeunit STIReceiptScanSessionGlobal;
        CameraPage: Page Camera;
        ReceiptNotScannedErrLabel: Label 'No receipt scanned';
    begin
        CameraPage.SetQuality(100);
        CameraPage.RunModal();

        ReceiptScanSessionLog.GetBySystemId(ReceiptScanSessionGlobal.GetLogId());
        if not ReceiptScanSessionLog.Result.HasValue then begin
            ReceiptScanSessionLog.Delete(false);
            Error(ReceiptNotScannedErrLabel);
        end;

        // ReceiptScannerImpl.HandleRequest(Base64Convert.ToBase64(PictureBytes));
    end;
}