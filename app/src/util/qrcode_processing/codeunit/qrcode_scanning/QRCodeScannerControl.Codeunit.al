namespace STIL.PersonalFinanceManager.Util.QRCode.Scanner;

using STIL.PersonalFinanceManager.Util.AddIns;
using STIL.PersonalFinanceManager.Util.Abstractions;

codeunit 50107 "STI QR Code Scanner Control" implements "STI IUIRequestHandler"
{
    Access = Internal;

    var
        Control: ControlAddIn "STI QR Code Scanner";

    internal procedure SetControl(ControlIn: ControlAddIn "STI QR Code Scanner")
    begin
        Control := ControlIn;
    end;

    internal procedure HandleRequest(Args: JsonObject; var Result: JsonObject)
    begin
    end;

    internal procedure Initiliaze()
    begin
        Control.Initiliaze();
    end;
}