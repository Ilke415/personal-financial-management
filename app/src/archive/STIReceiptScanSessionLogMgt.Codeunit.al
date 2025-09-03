namespace STIL.PersonalFinanceManager.Archive;

using System.Utilities;

codeunit 50101 STIReceiptScanSessionLogMgt
{
    Access = Internal;

    internal procedure InitLog(): Guid
    var
        ReceiptScanSessionLog: Record "STI Receipt Scan Session Log";
    begin
        ReceiptScanSessionLog.Init();
        ReceiptScanSessionLog.Insert(false);
        exit(ReceiptScanSessionLog.SystemId);
    end;

    internal procedure LogReceiptScanSession(LogId: Guid; Format: Text[50]; Result: Text; SourceImage: Text)
    var
        ReceiptScanSessionLog: Record "STI Receipt Scan Session Log";
        InStr: InStream;
        OutStr: OutStream;
        TempBlob: Codeunit "Temp Blob";
        MimeTypeTextLbl: Label 'text/plain';
    begin
        if not ReceiptScanSessionLog.GetBySystemId(LogId) then
            exit;

        ReceiptScanSessionLog."Format" := Format;
        TempBlob.CreateOutStream(OutStr);
        OutStr.WriteText(Result);
        TempBlob.CreateInStream(InStr);
        ReceiptScanSessionLog.Result.ImportStream(InStr, ReceiptScanSessionLog.FieldCaption("Result"), MimeTypeTextLbl);
        Clear(InStr);
        Clear(OutStr);
        TempBlob.CreateOutStream(OutStr);
        OutStr.WriteText(SourceImage);
        TempBlob.CreateInStream(InStr);
        ReceiptScanSessionLog."Source Image".ImportStream(InStr, ReceiptScanSessionLog.FieldCaption("Source Image"), MimeTypeTextLbl);
        ReceiptScanSessionLog.Modify(false);
    end;

    internal procedure SetLogStatus(LogId: Guid; Status: Enum "STI Receipt Scan Status")
    var
        ReceiptScanSessionLog: Record "STI Receipt Scan Session Log";
    begin
        if not ReceiptScanSessionLog.GetBySystemId(LogId) then
            exit;

        ReceiptScanSessionLog.Status := Status;
        ReceiptScanSessionLog.Modify(false);
    end;
}