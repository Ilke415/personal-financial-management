namespace STIL.PersonalFinanceManager.Util.Receipt.Scanner;

using System.Text;
using System.Device;
using STIL.PersonalFinanceManager.Util.AddIns;
using STIL.PersonalFinanceManager.Archive;
using STIL.PersonalFinanceManager.Helper;

codeunit 50102 "STI Receipt Scanner"
{
    Access = Internal;

    var
        ReceiptScannerImpl: Codeunit "STI Receipt Scanner Impl.";

    internal procedure OnControlReady(Control: ControlAddIn "STI Receipt Scanner")
    begin
        ReceiptScannerImpl.OnControlReady(Control);
    end;

    internal procedure ProcessReceiptScan()
    var
        ReceiptScanSessionLog: Record "STI Receipt Scan Session Log";
        ReceiptScanSessionGlobal: Codeunit STIReceiptScanSessionGlobal;
        ReceiptScanSessionLogMgt: Codeunit STIReceiptScanSessionLogMgt;
        CameraPage: Page Camera;
        LogId: Guid;
        PictureBytes: InStream;
        PictureName: Text;
        ReceiptNotScannnedErrLabel: Label 'No receipt scanned';
    begin
        ReceiptScanSessionGlobal.ClearLogId();
        LogId := ReceiptScanSessionLogMgt.InitLog();
        ReceiptScanSessionGlobal.SetLogId(LogId);
        Commit();

        CameraPage.SetQuality(100);
        CameraPage.RunModal();

        ReceiptScanSessionLog.GetBySystemId(LogId);
        if not ReceiptScanSessionLog.Result.HasValue then begin
            ReceiptScanSessionLog.Delete(false);
            Error(ReceiptNotScannnedErrLabel);
        end;

        // ReceiptScannerImpl.HandleRequest(Base64Convert.ToBase64(PictureBytes));
    end;

    internal procedure ProcessReceiptFromUrl(Url: Text)
    begin
    end;
}