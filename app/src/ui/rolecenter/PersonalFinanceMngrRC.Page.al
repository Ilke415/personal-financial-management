namespace STIL.PersonalFinanceManager.UI.RoleCenters;
using STIL.Util.QRCodeProcessor.UI;

page 50100 "STI Personal Finance Mngr. RC"
{
    ApplicationArea = All;
    Caption = 'Personal Finance Manager';
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            part("STI QR Code Processor"; "STI QR Code Processor")
            {
                Caption = 'Receipt Scanner';
                ApplicationArea = All;
            }
        }
    }
}