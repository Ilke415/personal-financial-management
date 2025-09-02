namespace STIL.PersonalFinanceManager.Util.Receipt.Scanner;

using STIL.PersonalFinanceManager.Util.Receipt.Scanner;
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

    internal procedure ProcessReceiptScan(ActionArgs: JsonObject)
    var
        STIIReceiptScanActionProvider: Interface STIIReceiptScanActionProvider;
        ReceiptScanAction: Enum "STI Receipt Scan Action";
    begin
        if not ActionArgs.Contains('actionId') then
            exit;

        ReceiptScanAction := Enum::"STI Receipt Scan Action".FromInteger(ActionArgs.GetInteger('actionId'));
        InitScanSession();
        STIIReceiptScanActionProvider := ReceiptScanAction;
        STIIReceiptScanActionProvider.ProcessReceiptScan();
    end;

    local procedure InitScanSession()
    var
        ReceiptScanSessionGlobal: Codeunit STIReceiptScanSessionGlobal;
        ReceiptScanSessionLogMgt: Codeunit STIReceiptScanSessionLogMgt;
    begin
        ReceiptScanSessionGlobal.ClearLogId();
        ReceiptScanSessionGlobal.SetLogId(ReceiptScanSessionLogMgt.InitLog());
        Commit();
    end;

    internal procedure ProcessReceiptFromUrl(Url: Text)
    begin
    end;
}