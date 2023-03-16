page 52185699 "Virtual Registrations List"
{
    CardPageID = "Virtual Registrations Card";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Virtual Registrations";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'General';
                field("ID/Passport"; Rec."ID/Passport")
                {
                }
                field(Msisdn; Rec.Msisdn)
                {
                }
                field("Full Names"; Rec."Full Names")
                {
                }
                field("Mpesa Names"; Rec."Mpesa Names")
                {
                }
                field(Gender; Rec.Gender)
                {
                }
                field("IPRS Date Of Birth"; Rec."IPRS Date Of Birth")
                {
                }
                field(Citizenship; Rec.Citizenship)
                {
                }
                field(Comments; Rec.Comments)
                {
                }
                field("Application Date"; Rec."Application Date")
                {
                }
                field(IsVirtual; Rec.IsVirtual)
                {
                }
                field(Remarks; Rec.Remarks)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnDeleteRecord(): Boolean
    begin
        if Rec.IsVirtual = true then
            Error('Processed Record Can not Be Deleted!');
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if Rec.IsVirtual = true then
            Error('This Record Can not Be Modified!');
    end;

    var
        // ByteOne: DotNet Array;
        // ByteTwo: DotNet Array;
        // ByteThree: DotNet Array;
        // Convert: DotNet Convert;
        // MemoryStreamOne: DotNet MemoryStream;
        // MemoryStreamTwo: DotNet MemoryStream;
        // MemoryStreamThree: DotNet MemoryStream;
}

