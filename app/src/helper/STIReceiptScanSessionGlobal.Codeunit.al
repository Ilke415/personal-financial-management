namespace STIL.PersonalFinanceManager.Helper;

codeunit 50103 STIReceiptScanSessionGlobal
{
    Access = Internal;
    SingleInstance = true;

    var
        LogId: Guid;

    internal procedure SetLogId(LogId: Guid)
    begin
        this.LogId := LogId;
    end;

    internal procedure GetLogId(): Guid
    begin
        exit(this.LogId);
    end;

    internal procedure ClearLogId()
    begin
        Clear(LogId);
    end;
}