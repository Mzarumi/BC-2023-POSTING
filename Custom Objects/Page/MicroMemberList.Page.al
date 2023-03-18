page 52186366 "Micro Member  List"
{
    CardPageID = "Member Single";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Members;
    SourceTableView = WHERE("Group Account" = CONST(false),
                            "Customer Type" = CONST("Micro finance"));

    layout
    {
        area(content)
        {
            repeater(Control13)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                }
                field(Salutation; Rec.Salutation)
                {
                }
                field("First Name"; Rec."First Name")
                {
                }
                field("Second Name"; Rec."Second Name")
                {
                }
                field("Last Name"; Rec."Last Name")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Dividend Action"; Rec."Dividend Action")
                {
                }
                field(Gender; Rec.Gender)
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field(Classification; Rec.Classification)
                {
                }
                field("ID No."; Rec."ID No.")
                {
                }
                field("Passport No."; Rec."Passport No.")
                {
                }
                field("Payroll/Staff No."; Rec."Payroll/Staff No.")
                {
                }
                field("Employer Code"; Rec."Employer Code")
                {
                }
                field("Employer Name"; Rec."Employer Name")
                {
                    Editable = false;
                }
                field("Dividend Payment Method"; Rec."Dividend Payment Method")
                {
                }
                field(Type; Rec.Type)
                {
                }
                field("Membership Type"; Rec."Membership Type")
                {
                }
                field("Old Member No."; Rec."Old Member No.")
                {
                }
                field("Group Account"; Rec."Group Account")
                {
                }
                field("Group Account No."; Rec."Group Account No.")
                {
                }
                field(Source; Rec.Source)
                {
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                }
                field("Phone No."; Rec."Phone No.")
                {
                }
                field("Registration Date"; Rec."Registration Date")
                {
                }
                field("Member Category"; Rec."Member Category")
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            separator(Action56)
            {
            }
            action("Next of KIN")
            {
                Image = Relationship;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Next of KIN";
                RunPageLink = "Account No" = FIELD("No."),
                              Type = FILTER("Next of Kin" | Spouse | "Benevolent Beneficiary");
            }
            separator(Action54)
            {
            }
            action("Family Member")
            {
                Caption = 'Sinkfund Members';
                Image = Relationship;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Family Member";
                RunPageLink = "Account No" = FIELD("No.");
            }
            separator(Action52)
            {
            }
            action("Picture & Signature")
            {
                Image = Signature;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Member Picture & Signature";
                RunPageLink = "Member No" = FIELD("No.");
            }
            separator(Action50)
            {
            }
            action("Member Document")
            {
                Image = Allocations;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Member Documents";
                RunPageLink = "Reference No." = FIELD("No.");
            }
            separator(Action48)
            {
            }
            action("Social Listening Sites")
            {
                Image = Alerts;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Social Listening Sites";
                RunPageLink = "Account No." = FIELD("No.");
            }
            separator(Action44)
            {
            }
            action("Member Collaterals")
            {
                Image = AvailableToPromise;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Member Collaterals";
                RunPageLink = "Member No" = FIELD("No.");
                Visible = false;
            }
            separator(Action42)
            {
            }
            action("Check Off Advice")
            {
                Image = Agreement;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Checkoff Advice";
                RunPageLink = "Member No." = FIELD("No.");
            }
            separator(Action40)
            {
            }
            action("Member Statistics")
            {
                Image = StatisticsGroup;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Member Statistics";
                RunPageLink = "No." = FIELD("No.");

                trigger OnAction()
                begin
                    if Rec.Hide = true then begin
                        if UserSetup.Get(UserId) then begin
                            if UserSetup."Show Hidden" = false then
                                Error('You do not have permissions to view this account information.');
                        end;
                    end;
                end;
            }
        }
        area(reporting)
        {
            action(Statement)
            {
                Image = Customer;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    if Rec.Hide = true then begin
                        if UserSetup.Get(UserId) then begin
                            if UserSetup."Show Hidden" = false then
                                Error('You do not have permissions to view this account information.');
                        end;
                    end;

                    CustMembr.Reset;
                    CustMembr.SetRange(CustMembr."No.", Rec."No.");
                    //if CustMembr.Find('-') then
                    //REPORT.Run(52185692, true, false, CustMembr);
                end;
            }
            separator(Action27)
            {
            }
            action("Dividend Deduction")
            {
                Image = Database;
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Page "Dividend Posting Buffer";
                RunPageLink = "Member No." = FIELD("No.");
            }
            separator(Action26)
            {
            }
            action("E-Mail Statement")
            {
                Caption = 'E-Mail Statement';
                Image = Email;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                var
                    SalesInvHeader: Record "Sales Invoice Header";
                begin
                    CustMembr := Rec;
                    CurrPage.SetSelectionFilter(CustMembr);
                    CustMembr.EmailRecords(true);
                end;
            }
            action("MEMBER [FILE]")
            {
                Image = Document;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                var
                    DMS: Record EDMS;
                begin
                    DMS.Reset;
                    DMS.SetRange(DMS.Key, DMS.Key::"Member File");
                    if DMS.Find('-') then begin
                        HyperLink(DMS."url path" + Rec."No.");
                    end;
                end;
            }
            action("New Member Statement ")
            {
                Image = Customer;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    if Rec.Hide = true then begin
                        if UserSetup.Get(UserId) then begin
                            if UserSetup."Show Hidden" = false then
                                Error('You do not have permissions to view this account information.');
                        end;
                    end;

                    CustMembr.Reset;
                    CustMembr.SetRange(CustMembr."No.", Rec."No.");
                    //if CustMembr.Find('-') then
                    //REPORT.Run(52186055, true, false, CustMembr);
                end;
            }
            action("Member Statement[ Historical ]")
            {
                Image = customer;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    if Rec.Hide = true then begin
                        if UserSetup.Get(UserId) then begin
                            if UserSetup."Show Hidden" = false then
                                Error('You do not have permissions to view this account information.');
                        end;
                    end;

                    CustMembr.Reset;
                    CustMembr.SetRange(CustMembr."No.", Rec."No.");
                    //if CustMembr.Find('-') then
                    //REPORT.Run(52186291, true, false, CustMembr);
                end;
            }
        }
    }

    var
        UserSetup: Record "User Setup";
        CustMembr: Record Members;
}

