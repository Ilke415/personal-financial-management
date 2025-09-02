namespace app.app;

using System.Utilities;

page 50103 "STI Enter Receipt URI"
{
    Caption = 'Enter Receipt URL';
    PageType = StandardDialog;

    layout
    {
        area(Content)
        {
            group(ReceiptURIGroup)
            {
                ShowCaption = false;
                field(ReceiptURIField; ReceiptURI)
                {
                    ApplicationArea = All;
                    Caption = 'Receipt URL';
                    ToolTip = 'Specifies the URL of the receipt.';
                    ShowMandatory = true;
                    NotBlank = true;
                    ExtendedDatatype = URL;

                    trigger OnValidate()
                    var
                        Uri: Codeunit Uri;
                    begin
                        if not Uri.IsValidUri(ReceiptURI) then
                            Error('Invalid URI');
                    end;
                }
            }
        }
    }

    var
        ReceiptURI: Text;

    /// <summary>
    /// Gets the receipt URL that has been entered.
    /// </summary>
    /// <returns>Receipt URL</returns>
    procedure GetReceiptURI(): Text
    begin
        exit(ReceiptURI);
    end;
}
