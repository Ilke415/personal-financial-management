namespace STIL.Util.QRCodeProcessor.Logic;
using STIL.Util.QRCodeProcessor.Intefaces;
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

    procedure ScanQRCode(DataToEncode: Text; Size: Integer) Result: Text
    var
        Args: JsonObject;
    begin
        Args.Add('content', DataToEncode);
        Args.Add('size', Size);

        Handler.ScanQRCode(Args, Result);
    end;

    local procedure InitiliazeHandler(HandlerIn: Interface "STI QR Code Processor")
    begin
        Handler := HandlerIn;
    end;
}