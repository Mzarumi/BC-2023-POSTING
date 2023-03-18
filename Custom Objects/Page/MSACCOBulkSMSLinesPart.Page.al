page 52185779 "M-SACCO Bulk SMS Lines Part"
{
    PageType = ListPart;
    SourceTable = "M-SACCO Bulk SMS Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    Caption = 'Telephone No';

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        /*
                     BulkSMSHeader.RESET;
                     BulkSMSHeader.SETRANGE(BulkSMSHeader.No,No);
                     IF BulkSMSHeader.FIND('-') THEN BEGIN
                     //DIMENSION
                     IF BulkSMSHeader."SMS Type"=BulkSMSHeader."SMS Type"::Dimension THEN BEGIN
                     DimensionValue.RESET;
                     DimensionValue.SETRANGE(DimensionValue."Global Dimension No.",2);
                     IF PAGE.RUNMODAL(560,DimensionValue) = ACTION::LookupOK THEN BEGIN
                     Code:=DimensionValue.Code;
                     Description:=DimensionValue.Name;
                     END;

                     END;

                     END;
                        */

                    end;
                }
                field(Description; Rec.Description)
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        BulkSMSHeader: Record "prEmployee Trans IMP BAL";
        DimensionValue: Record "Dimension Value";
}

