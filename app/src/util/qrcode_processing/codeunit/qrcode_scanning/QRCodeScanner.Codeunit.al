namespace STIL.PersonalFinanceManager.Util.QRCode.Scanner;

using STIL.PersonalFinanceManager.Util.AddIns;
using STIL.PersonalFinanceManager.Helper;
using STIL.PersonalFinanceManager.Archive;

codeunit 50106 "STI QR Code Scanner"
{
    Access = Internal;

    var
        QRCodeScannerImpl: Codeunit "STI QR Code Scanner Impl.";

    internal procedure OnControlReady(Control: ControlAddIn "STI QR Code Scanner")
    begin
        QRCodeScannerImpl.OnControlReady(Control);
    end;

    internal procedure ProcessScanResult(Result: JsonObject)
    var
        ReceiptScanSessionLog: Record "STI Receipt Scan Session Log";
        ReceiptScanSessionLogMgt: Codeunit STIReceiptScanSessionLogMgt;
        ReceiptScanSessionGlobal: Codeunit STIReceiptScanSessionGlobal;
        URI, Format, ImageBase64 : Text;
    begin
        if not ReceiptScanSessionLog.GetBySystemId(ReceiptScanSessionGlobal.GetLogId()) then
            exit;

        URI := Result.GetText('content');
        Format := Result.GetText('format');
        ImageBase64 := Result.GetText('imageData');

        if URI = '' then
            exit;

        ReceiptScanSessionLogMgt.LogReceiptScanSession(ReceiptScanSessionLog.SystemId, Format, URI, ImageBase64);
    end;
}