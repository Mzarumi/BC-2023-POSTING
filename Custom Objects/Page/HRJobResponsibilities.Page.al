page 52185515 "HR Job Responsibilities"
{
    Caption = 'HR Job Responsibilities';
    DeleteAllowed = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Qualification';
    SourceTable = "HR Jobs";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Job Details';
                field("Job ID"; Rec."Job ID")
                {
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                }
                field("Job Description"; Rec."Job Description")
                {
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                }
                field("Position Reporting to"; Rec."Position Reporting to")
                {
                    Enabled = false;
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    Enabled = false;
                }
                field("No of Posts"; Rec."No of Posts")
                {
                    Editable = false;
                    Enabled = false;
                }
                field("Occupied Positions"; Rec."Occupied Positions")
                {
                    Editable = false;
                }
                field("Vacant Positions"; Rec."Vacant Positions")
                {
                    Editable = false;
                    Enabled = false;
                }
                field("Employee Requisitions"; Rec."Employee Requisitions")
                {
                }
            }
            part("Job Responsibilities"; "HR Job Responsiblities Lines")
            {
                Caption = 'Job Responsibilities';
                SubPageLink = "Job ID" = FIELD("Job ID");
            }
        }
        area(factboxes)
        {
            systempart(Control1102755013; Outlook)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Job Resposibilities")
            {
                Caption = 'Job Resposibilities';
                Image = "Report";
                Promoted = true;

                trigger OnAction()
                begin
                    HRJobResponsibilities.Reset;
                    HRJobResponsibilities.SetRange(HRJobResponsibilities."Job ID", Rec."Job ID");
                    if HRJobResponsibilities.Find('-') then begin
                        //REPORT.Run(REPORT::"HR Job Responsibilities", true, true, HRJobResponsibilities);
                    end;
                end;
            }
        }
    }

    var
        HRJobResponsibilities: Record "HR Job Responsiblities";
}

