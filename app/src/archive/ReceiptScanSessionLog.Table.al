namespace STIL.PersonalFinanceManager.Archive;

table 50100 "STI Receipt Scan Session Log"
{
    Caption = 'STI Receipt Scan Session Log';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Integer)
        {
            Caption = 'Primary Key';
            AutoIncrement = true;
            ToolTip = 'Unique identifier for each scan session';
        }
        field(20; "Format"; Text[50])
        {
            Caption = 'Format';
            ToolTip = 'Format of the image from receipt';
        }
        field(30; Result; Media)
        {
            Caption = 'Result';
            ToolTip = 'Result of the receipt qr code scan';
        }
        field(40; "Source Image"; Media)
        {
            Caption = 'Source Image';
            ToolTip = 'QR code image of the receipt';
        }
        field(50; Status; Enum "STI Receipt Scan Status")
        {
            Caption = 'Status';
            ToolTip = 'Status of the scan session';
            InitValue = "QR Code Scan Failed";
        }
        field(60; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            ToolTip = 'Document No. of the document created from receipt scan';
        }
        field(70; "Document Type"; Text[250])
        {
            Caption = 'Document Type';
            ToolTip = 'Type of the document created from receipt scan';
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}