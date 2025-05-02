namespace STIL.Util.QRCodeProcessor.Processor.Logic;

using STIL.Util.QRCodeProcessor.ControlAddins;
using STIL.Util.QRCodeProcessor.Interfaces;

codeunit 50100 "STI QR Code Processor Control" implements "STI QR Code Processor"
{
    Access = Internal;

    var
        Control: ControlAddIn "STI QR Code Processor";

    internal procedure SetControl(ControlIn: ControlAddIn "STI QR Code Processor")
    begin
        Control := ControlIn;
    end;

    internal procedure ScanQRCode(Args: JsonObject; var Result: JsonObject);
    begin
        Control.ScanQRCode(Args, Result);
    end;

    internal procedure Initiliaze()
    begin
        Control.Initiliaze();
    end;
}