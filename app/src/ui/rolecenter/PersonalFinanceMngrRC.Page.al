namespace STIL.PersonalFinanceManager.UI;

using STIL.PersonalFinanceManager.Util.UI;

page 50100 "STI Personal Finance Mngr. RC"
{
    ApplicationArea = All;
    Caption = 'Personal Finance Manager';
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            part("STI Receipt Scanner"; "STI Receipt Scanner")
            {
                Caption = 'Receipt Scanner';
                ApplicationArea = All;
            }
        }
    }
}