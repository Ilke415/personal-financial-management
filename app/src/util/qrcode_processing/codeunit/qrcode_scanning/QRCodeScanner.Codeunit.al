namespace STIL.PersonalFinanceManager.Util.QRCode.Scanner;

using System.Text;
using System.Device;
using STIL.PersonalFinanceManager.Util.AddIns;

codeunit 50106 "STI QR Code Scanner"
{
    Access = Internal;

    var
        QRCodeScannerImpl: Codeunit "STI QR Code Scanner Impl.";

    internal procedure OnControlReady(Control: ControlAddIn "STI QR Code Scanner")
    begin
        QRCodeScannerImpl.OnControlReady(Control);
    end;
}