page 52186105 "Appealed Legal Card"
{
    PageType = Card;
    SourceTable = Legal;
    SourceTableView = WHERE(Appealed = CONST(true));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Case Number"; Rec."Case Number")
                {
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                }
                field("Legal Type"; Rec."Legal Type")
                {
                }
                field("Plaintiff Type"; Rec."Plaintiff Type")
                {
                }
                field(Plaintiff; Rec.Plaintiff)
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Description of Complaint"; Rec."Description of Complaint")
                {
                }
                field("Accused Type"; Rec."Accused Type")
                {
                }
                field("Accused Employee"; Rec."Accused Employee")
                {
                }
                field("Accused Name"; Rec."Accused Name")
                {
                }
                field(Reporter; Rec.Reporter)
                {
                }
                field("Reporter Name"; Rec."Reporter Name")
                {
                }
                field(Witness; Rec.Witness)
                {
                }
                field("Witness #1 Name"; Rec."Witness #1 Name")
                {
                }
                field("Recommended Action"; Rec."Recommended Action")
                {
                }
                field("Date To Discuss Case"; Rec."Date To Discuss Case")
                {
                }
                field("Disciplinary Remarks"; Rec."Disciplinary Remarks")
                {
                }
                field("Body Handling The Complaint"; Rec."Body Handling The Complaint")
                {
                }
                field("Policy Description"; Rec."Policy Description")
                {
                }
                field("Taken Action Description"; Rec."Taken Action Description")
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field("Action Duration Start Date"; Rec."Action Duration Start Date")
                {
                }
                field("Action Duration End  Date"; Rec."Action Duration End  Date")
                {
                }
                field("Total Cost"; Rec."Total Cost")
                {
                }
                field("Case Level"; Rec."Case Level")
                {
                    Editable = false;
                }
            }
            part("Legal Line"; "Legal Line")
            {
                Caption = 'Legal Line';
                SubPageLink = No = FIELD("Case Number");
            }
            part(Control9; "Verdict List")
            {
                SubPageLink = "Case No" = FIELD("Case Number");
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Case Cost")
            {
                Caption = 'Case Cost';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Case Cost List";
                RunPageLink = Code = FIELD("Case Number");
            }
            action(Advocate)
            {
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Advocate List";
                RunPageLink = No = FIELD("Case Number");
                Scope = Repeater;
            }
            action("Damages List")
            {
                Caption = 'Damages List';
                RunObject = Page "Damages List";
                RunPageLink = "Case No" = FIELD("Case Number");
            }
            action(Appeal)
            {
                Caption = ' Appeal';
                Image = ReopenCancelled;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                Visible = true;

                trigger OnAction()
                begin
                    if Rec.Appealed = true then begin
                        Error('A case can only be Appealed once');
                    end;

                    if Confirm('Are you sure you want to Apeal this case?"') then begin
                        Rec."Case Level" := Rec."Case Level"::Closed;
                        Rec.Appealed := true;
                        Rec.Modify;
                        Message('Case Number %1 has been marked as "Under Appeal"', Rec."Case Number");
                    end;
                end;
            }
        }
    }
}

