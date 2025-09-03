namespace STIL.PersonalFinanceManager.Archive;

using System.Environment;
using System.Integration;

page 50104 "STI Receipt Information"
{
    ApplicationArea = All;
    Caption = 'Receipt Information';
    PageType = CardPart;
    SourceTable = "STI Receipt Scan Session Log";
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            group(General)
            {
                ShowCaption = false;

                usercontrol(WebPageViewer; WebPageViewer) { }
                field(ReceiptURIField; ReceiptURI)
                {
                    ExtendedDatatype = URL;
                    ShowCaption = false;
                    Editable = false;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetContent();
    end;

    local procedure SetContent()
    var
        TenantMedia: Record "Tenant Media";
        InStr: InStream;
        ImageBase64: Text;
        HTMLContentLbl: Label 'data:image/jpeg;base64,%1', Locked = true;
        HtmlImgElemLbl: Label '<img src="%1" alt="Receipt Image" />', Locked = true;
    begin
        if TenantMedia.Get(Rec."Source Image".MediaId) then begin
            TenantMedia.CalcFields(Content);
            if TenantMedia.Content.HasValue then begin
                TenantMedia.Content.CreateInStream(InStr);
                InStr.ReadText(ImageBase64);
                CurrPage.WebPageViewer.SetContent(StrSubstNo(HtmlImgElemLbl, StrSubstNo(HTMLContentLbl, ImageBase64)));
            end;
        end;

        if TenantMedia.Get(Rec."Result".MediaId) then begin
            TenantMedia.CalcFields(Content);
            if TenantMedia.Content.HasValue then begin
                TenantMedia.Content.CreateInStream(InStr);
                InStr.ReadText(ReceiptURI);
            end;
        end;
    end;

    var
        ReceiptURI: Text;
}
