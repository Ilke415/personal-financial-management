namespace STIL.PersonalFinanceManager.Archive;

page 50102 "STI Receipt Scan Audit Log"
{
    ApplicationArea = All;
    Caption = 'Receipt Scan Audit Log';
    PageType = List;
    SourceTable = "STI Receipt Scan Session Log";
    UsageCategory = History;

    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field(SystemId; Rec.SystemId) { }
                field(Status; Rec.Status) { StyleExpr = StatusStyle; }
                field("Document No."; Rec."Document No.") { }
                field("Document Type"; Rec."Document Type") { }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        StatusStyle := GetStatusStyleExpr();
    end;


    internal procedure GetStatusStyleExpr(): Text
    var
        Style: Text;
    begin
        if Rec.Status = Enum::"STI Receipt Scan Status"::Successful then
            exit(Format(PageStyle::Favorable))
        else
            exit(Format(PageStyle::Unfavorable));
    end;

    var
        StatusStyle: Text;
}