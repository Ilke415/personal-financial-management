namespace STIL.PersonalFinanceManager.Archive;

enum 50100 "STI Receipt Scan Status"
{
    Extensible = false;

    value(0; "QR Code Scan Failed") { Caption = 'QR Code Scan Failed'; }
    value(1; "Web services unavailable") { Caption = 'Web services unavailable'; }
    value(2; "Document processing failed") { Caption = 'Document processing failed'; }
    value(3; "Successful") { Caption = 'Successful'; }
}