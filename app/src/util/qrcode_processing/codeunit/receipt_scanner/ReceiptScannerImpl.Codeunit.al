namespace STIL.PersonalFinanceManager.Util.Receipt.Scanner;

using STIL.PersonalFinanceManager.Util.AddIns;
using STIL.PersonalFinanceManager.Util.Abstractions;

codeunit 50104 "STI Receipt Scanner Impl."
{
    Access = Internal;

    var
        Handler: Interface "STI IUIRequestHandler";
        QRCodeProcessorControl: Codeunit "STI Receipt Scanner Control";

    internal procedure OnControlReady(Control: ControlAddIn "STI Receipt Scanner")
    begin
        QRCodeProcessorControl.SetControl(Control);
        InitiliazeHandler(QRCodeProcessorControl);
        QRCodeProcessorControl.Initiliaze();
    end;

    local procedure InitiliazeHandler(HandlerIn: Interface "STI IUIRequestHandler")
    begin
        Handler := HandlerIn;
    end;
}