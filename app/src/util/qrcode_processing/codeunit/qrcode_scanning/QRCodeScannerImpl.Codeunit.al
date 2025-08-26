namespace STIL.PersonalFinanceManager.Util.QRCode.Scanner;

using STIL.PersonalFinanceManager.Util.Abstractions;
using STIL.PersonalFinanceManager.Util.AddIns;

codeunit 50108 "STI QR Code Scanner Impl."
{
    Access = Internal;

    var
        Handler: Interface "STI IUIRequestHandler";
        QRCodeProcessorControl: Codeunit "STI QR Code Scanner Control";

    internal procedure OnControlReady(Control: ControlAddIn "STI QR Code Scanner")
    begin
        QRCodeProcessorControl.SetControl(Control);
        InitiliazeHandler(QRCodeProcessorControl);
        QRCodeProcessorControl.Initiliaze();
    end;

    internal procedure ScanQRCode(ImageBase64Text: Text)
    var
        Args: JsonObject;
        Result: JsonObject;
    begin
        // Args.Add('content', ImageBase64Text);
        Message('ImageBase64Text: %1', ImageBase64Text);
        Handler.HandleRequest(Args, Result);
    end;

    local procedure InitiliazeHandler(HandlerIn: Interface "STI IUIRequestHandler")
    begin
        Handler := HandlerIn;
    end;
}