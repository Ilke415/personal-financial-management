namespace STIL.Util.QRCodeProcessor.Processing.Logic;


using STIL.Util.QRCodeProcessor.Interfaces;
using STIL.Util.QRCodeProcessor.ControlAddins;

codeunit 50104 "STI QR Code Processor Impl."
{
    Access = Internal;

    var
        Handler: Interface "STI QR Code Processor";
        QRCodeProcessorControl: Codeunit "STI QR Code Processor Control";

    internal procedure OnControlReady(Control: ControlAddIn "STI QR Code Processor")
    begin
        QRCodeProcessorControl.SetControl(Control);
        InitiliazeHandler(QRCodeProcessorControl);
        QRCodeProcessorControl.InitiliazeUI();
    end;

    internal procedure ScanQRCode(ImageBase64Text: Text)
    var
        Args: JsonObject;
        Result: JsonObject;
    begin
        // Args.Add('content', ImageBase64Text);
        Message('ImageBase64Text: %1', ImageBase64Text);
        Handler.ScanQRCode(Args, Result);
    end;

    local procedure InitiliazeHandler(HandlerIn: Interface "STI QR Code Processor")
    begin
        Handler := HandlerIn;
    end;
}