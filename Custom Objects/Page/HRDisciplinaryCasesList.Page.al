page 52186497 "HR Disciplinary Cases List"
{
    CardPageID = "HR Disciplinary Cases";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Employees";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("First Name"; Rec."First Name")
                {
                }
                field("Middle Name"; Rec."Middle Name")
                {
                }
                field("Last Name"; Rec."Last Name")
                {
                }
                field(Position; Rec.Position)
                {
                    Editable = true;
                    Importance = Promoted;
                }
                field("Job Title"; Rec."Job Title")
                {
                }
                field(Gender; Rec.Gender)
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000001; Outlook)
            {
            }
            systempart(Control1000000002; Notes)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action("&Mark as Closed/Open")
                {
                    Caption = '&Mark as Closed/Open';

                    trigger OnAction()
                    begin
                        HRDisciplinary.Reset;
                        HRDisciplinary.SetRange(HRDisciplinary.Selected, true);
                        HRDisciplinary.SetRange(HRDisciplinary."Employee No", Rec."No.");
                        if HRDisciplinary.Find('-') then begin

                            //ENSURE SELECTED RECORDS DO NOT EXCEED ONE
                            Number := 0;
                            Number := HRDisciplinary.Count;
                            if Number > 1 then begin
                                Error('You cannot have more than one application selected');
                                // ERROR(FORMAT(Number)+' applications selected');

                            end;
                            if HRDisciplinary.Status = HRDisciplinary.Status::Open then begin
                                HRDisciplinary.Status := HRDisciplinary.Status::Closed;
                                HRDisciplinary.Modify;
                                HRDisciplinary."Closed By" := UserId;
                            end else begin
                                HRDisciplinary.Status := HRDisciplinary.Status::Open;
                                HRDisciplinary.Modify;
                                HRDisciplinary."Closed By" := UserId;
                            end;

                        end else begin
                            Error('No disciplinary case selected');
                        end;
                    end;
                }
            }
        }
        area(reporting)
        {
            action("Disciplinary Cases")
            {
                Caption = 'Disciplinary Cases';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject = Report "HR Disciplinary Cases";
            }
        }
    }

    var
        HREmp: Record "HR Employees";
        EmpNames: Text[40];
        HRDisciplinary: Record "HR Disciplinary Cases";
        Number: Integer;
}

