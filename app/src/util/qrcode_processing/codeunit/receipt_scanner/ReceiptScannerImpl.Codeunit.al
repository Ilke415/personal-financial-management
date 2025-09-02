namespace STIL.PersonalFinanceManager.Util.Receipt.Scanner;

using STIL.PersonalFinanceManager.Util.AddIns;
using STIL.PersonalFinanceManager.Util.Abstractions;
using STIL.PersonalFinanceManager.Util.Receipt.Scanner;

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

    internal procedure HandleRequest(ImageBase64Text: Text)
    var
        Args: JsonObject;
        Result: JsonObject;
    begin
        // Args.Add('content', ImageBase64Text);
        Message('ImageBase64Text: %1', ImageBase64Text);
        // Handler.HandleRequest(Args, Result);
    end;

    local procedure InitiliazeHandler(HandlerIn: Interface "STI IUIRequestHandler")
    begin
        Handler := HandlerIn;
    end;
}