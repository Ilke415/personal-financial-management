namespace STIL.Util.QRCodeProcessor.Scanner.Logic;

using STIL.Util.QRCodeProcessor.ControlAddins;
using STIL.Util.QRCodeProcessor.Interfaces;

codeunit 50107 "STI QR Code Scanner Control" implements "STI QR Code Processor"
{
    Access = Internal;

    var
        Control: ControlAddIn "STI QR Code Scanner";

    internal procedure SetControl(ControlIn: ControlAddIn "STI QR Code Scanner")
    begin
        Control := ControlIn;
    end;

    internal procedure ScanQRCode(Args: JsonObject; var Result: JsonObject)
    begin
    end;

    internal procedure Initiliaze()
    begin
        Control.Initiliaze();
    end;
}