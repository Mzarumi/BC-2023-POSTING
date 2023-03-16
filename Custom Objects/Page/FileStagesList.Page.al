page 52186353 "File Stages List"
{
    Editable = false;
    PageType = List;
    SourceTable = "File Location";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    Visible = false;
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field("Section Code"; Rec."Section Code")
                {
                    Caption = 'Section Code';
                    Editable = false;
                }
                field("Station Name"; Rec."Station Name")
                {
                    Caption = 'Section Name';
                }
                field("Issued To"; Rec."Issued To")
                {
                    Caption = 'Initial Issue';
                }
                field(Remarks; Rec.Remarks)
                {
                }
                field(Status; Rec.Status)
                {
                    OptionCaption = 'Being Processed,Processed,Forwarded';

                    trigger OnValidate()
                    begin
                        //IF  PAGE 52018571 :=Status::Processed;  THEN
                        //Rec.TestField(Status);
                        //Status:=Status::Processed;
                    end;
                }
                field("Current Location"; Rec."Current Location")
                {
                    Editable = false;
                }
                field("Date/Time In"; Rec."Date/Time In")
                {
                }
                field("Date/Time Out"; Rec."Date/Time Out")
                {
                }
                field("USER ID"; Rec."USER ID")
                {
                }
                field(Narration; Rec.Narration)
                {
                }
                field(Folio; Rec.Folio)
                {
                }
            }
        }
    }

    actions
    {
    }
}

