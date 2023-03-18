page 52186572 "HR Jobs to Succeed Card"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Functions,Job';
    SourceTable = "HR Jobs";
    SourceTableView = WHERE("Marked for Succession" = FILTER(true));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Job ID"; Rec."Job ID")
                {
                }
                field("Job Description"; Rec."Job Description")
                {
                    Caption = 'Job Title';
                    Importance = Promoted;
                }
                group(Control17)
                {
                    ShowCaption = false;
                    grid(Control16)
                    {
                        GridLayout = Rows;
                        ShowCaption = false;
                        group(Control15)
                        {
                            ShowCaption = false;
                            field("Position Reporting to"; Rec."Position Reporting to")
                            {
                                Importance = Promoted;
                            }
                            field("Position Reporting Name"; Rec."Position Reporting Name")
                            {
                                ShowCaption = false;
                            }
                        }
                    }
                }
                field(Grade; Rec.Grade)
                {
                }
                field("No of Posts"; Rec."No of Posts")
                {
                    Importance = Promoted;
                }
                field("Occupied Positions"; Rec."Occupied Positions")
                {
                    Importance = Promoted;
                }
                field("Vacant Positions"; Rec."Vacant Positions")
                {
                    Importance = Promoted;
                }
                group(Control13)
                {
                    ShowCaption = false;
                    grid(Control12)
                    {
                        GridLayout = Rows;
                        ShowCaption = false;
                        group(Control11)
                        {
                            ShowCaption = false;
                        }
                    }
                }
                field("Employee Requisitions"; Rec."Employee Requisitions")
                {
                    Editable = false;
                }
                field("Date Created"; Rec."Date Created")
                {
                    Editable = false;
                    Style = Attention;
                }
                field(Status; Rec.Status)
                {
                    Editable = true;
                    Importance = Promoted;
                    Style = Attention;
                }
                field("Marked for Succession"; Rec."Marked for Succession")
                {
                }
            }
            group(Dimensions)
            {
                Caption = 'Dimensions';
                group(Control29)
                {
                    ShowCaption = false;
                    grid(Control10)
                    {
                        GridLayout = Rows;
                        ShowCaption = false;
                        group(Control9)
                        {
                            ShowCaption = false;
                            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                            {
                                Caption = 'Department';
                            }
                            field("Global Dimension 1 Name"; Rec."Global Dimension 1 Name")
                            {
                                ShowCaption = false;
                            }
                        }
                    }
                }
                group(Control6)
                {
                    ShowCaption = false;
                    grid(Control5)
                    {
                        GridLayout = Rows;
                        ShowCaption = false;
                        group(Control4)
                        {
                            ShowCaption = false;
                            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                            {
                                Caption = 'Region';
                            }
                            field("Global Dimension 2 Name"; Rec."Global Dimension 2 Name")
                            {
                                ShowCaption = false;
                            }
                        }
                    }
                }
            }
        }
        area(factboxes)
        {
            part(Control1102755004; "HR Jobs Factbox")
            {
                SubPageLink = "Job Description" = FIELD("Job ID");
            }
            systempart(Control1102755006; Outlook)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Job)
            {
                action(Requirements)
                {
                    Caption = 'Requirements';
                    Image = Card;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "HR Job Requirement Lines";
                    RunPageLink = "Job ID" = FIELD("Job ID");
                }
                action(Responsibilities)
                {
                    Caption = 'Responsibilities';
                    Image = JobResponsibility;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "HR Job Responsiblities Lines";
                    RunPageLink = "Job ID" = FIELD("Job ID");
                }
                action(Occupants)
                {
                    Caption = 'Occupants';
                    Image = ContactPerson;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "HR Job Occupants";
                    RunPageLink = "Job ID" = FIELD("Job ID");
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin


        Rec.Validate("Vacant Positions");
        UpdateControls;
    end;

    var
        HREmployees: Record "HR Employees";

    local procedure UpdateControls()
    begin
        CurrPage.Editable := false;

        if Rec.Status = Rec.Status::Open then begin
            CurrPage.Editable := true;
        end;
    end;

    //[Scope('Internal')]
    procedure RecordLinkCheck(job: Record "HR Jobs") RecordLnkExist: Boolean
    var
        objRecordLnk: Record "Record Link";
        // TableCaption:(Rec.RecordId;
        objRecord_Link: RecordRef;
    begin
        objRecord_Link.GetTable(job);
        // TableCaption := objRecord_Link(Rec.RecordId;
        objRecordLnk.Reset;
        // objRecordLnk.SetRange(objRecordLnk."Record ID", Rec.TableCaption);
        if objRecordLnk.Find('-') then exit(true) else exit(false);
    end;
}

