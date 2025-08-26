namespace STIL.PersonalFinanceManager.Util.Receipt.Scanner;

using STIL.PersonalFinanceManager.Util.AddIns;
using STIL.PersonalFinanceManager.Util.Abstractions;

codeunit 50100 "STI Receipt Scanner Control" implements "STI IUIRequestHandler"
{
    Access = Internal;

    var
        Control: ControlAddIn "STI Receipt Scanner";

    internal procedure SetControl(ControlIn: ControlAddIn "STI Receipt Scanner")
    begin
        Control := ControlIn;
    end;

    internal procedure HandleRequest(Args: JsonObject; var Result: JsonObject);
    begin
        Control.ScanReceipt(Args, Result);
    end;

    internal procedure Initiliaze()
    begin
        Control.Initiliaze();
    end;
}