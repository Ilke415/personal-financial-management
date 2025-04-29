namespace STIL.Util.QRCodeProcessor.Logic;
using STIL.Util.QRCodeProcessor.ControlAddins;

codeunit 50102 "STI QR Code Processor"
{
    Access = Internal;

    var
        QRCodeProcessorImpl: Codeunit "STI QR Code Processor Impl.";

    internal procedure OnControlReady(Control: ControlAddIn "STI QR Code Processor")
    begin
        QRCodeProcessorImpl.OnControlReady(Control);
    end;

    internal procedure ScanQRCode(DataToEncode: Text; Size: Integer) Result: Text
    begin
        exit(QRCodeProcessorImpl.ScanQRCode(DataToEncode, Size));
    end;
}