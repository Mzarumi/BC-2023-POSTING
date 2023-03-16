page 52185728 "Member Group"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Information, ,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = Members;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field("Registration Date"; Rec."Registration Date")
                {
                    Caption = 'Membership Date';
                }
                field("Single Party/Multiple/Business"; Rec."Single Party/Multiple")
                {
                    Visible = false;

                    trigger OnValidate()
                    begin
                        AccoutTypeControl;
                    end;
                }
                field(Name; Rec."First Name")
                {
                    ShowMandatory = true;
                }
                field("P.I.N Number"; Rec."P.I.N Number")
                {
                }
                field("Member Segment"; Rec."Member Segment")
                {
                    ShowMandatory = true;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ShowMandatory = true;
                }
                field(Status; Rec.Status)
                {

                    trigger OnValidate()
                    begin
                        AccoutTypeControl;
                    end;
                }
                field(Classification; Rec.Classification)
                {
                }
                field(Blocked; Rec.Blocked)
                {
                }
                field("Member Category"; Rec."Member Category")
                {
                }
                field("Status Change Statistics"; Rec."Status Change Statistics")
                {
                }
                field("Employer Code"; Rec."Employer Code")
                {
                    ShowMandatory = true;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ShowMandatory = true;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ShowMandatory = true;
                }
                field("Relationship Manager"; Rec."Relationship Manager")
                {
                }
                field("Recruited By"; Rec."Recruited By")
                {
                    Caption = 'Recruited By';
                }
            }
            group(Multiple)
            {
                Visible = MultipleEdit;
                field("Group Type"; Rec."Group Type")
                {
                }
                field("Nature of Group"; Rec."Nature of Business")
                {
                }
                field("Group Registration No."; Rec."Company Registration No.")
                {
                    Caption = 'Group Registration No.';
                }
                field("Date of Group Registration"; Rec."Date of Business Reg.")
                {
                }
                field("Group Loaction"; Rec."Business/Group Location")
                {
                }
                field("Group Plot/Bldg/Street/Road"; Rec."Plot/Bldg/Street/Road")
                {
                }
            }
            group(Business)
            {
                Visible = BusinessEdit;
                field("Type of Business"; Rec."Type of Business")
                {
                }
                field("Ownership Type"; Rec."Ownership Type")
                {
                }
                field("Other Business Type"; Rec."Other Business Type")
                {
                }
                field("Nature of Business"; Rec."Nature of Business")
                {
                    Caption = 'Nature of Business';
                }
                field("Business Registration No."; Rec."Company Registration No.")
                {
                }
                field("Date of Business Reg."; Rec."Date of Business Reg.")
                {
                    Caption = 'Date of Business Reg.';
                }
                field("Business Location"; Rec."Business/Group Location")
                {
                }
                field("Business Plot/Bldg/Street/Road"; Rec."Plot/Bldg/Street/Road")
                {
                }
            }
            group("Communication Details")
            {
                field("Office Telephone No."; Rec."Phone No.")
                {
                    Caption = 'Office Telephone No.';
                }
                field("Mobile Phone No"; Rec."Mobile Phone No")
                {
                    ShowMandatory = true;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ShowMandatory = true;
                }
                field("Current Address"; Rec."Current Address")
                {
                    Caption = 'P.O. BOX';
                }
                field("Post Code"; Rec."Post Code")
                {
                    Importance = Promoted;
                }
                field(City; Rec.City)
                {
                    Caption = 'City';
                }
                field(Nationality; Rec.Nationality)
                {
                    ShowMandatory = true;
                }
                field(County; Rec.County)
                {
                    ShowMandatory = true;
                }
            }
            group("Bank Details")
            {
                field("Bank Code"; Rec."Bank Code")
                {
                }
                field("Branch Code"; Rec."Branch Code")
                {
                }
                field("Bank Account No."; Rec."Bank Account No.")
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Group Members")
            {
                Image = Signature;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Signatories List";
                RunPageLink = "Account No" = FIELD("No.");
            }
            action("Group Members Report")
            {
                Image = Relatives;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    AccountSignatories.Reset;
                    AccountSignatories.SetRange(AccountSignatories."Account No", Rec."No.");
                    //if AccountSignatories.Find('-') then
                    //REPORT.Run(52186379, true, false, AccountSignatories);
                end;
            }
            separator(Action28)
            {
            }
            action("Group Member1")
            {
                Image = ExternalDocument;
                Promoted = true;
                PromotedCategory = Category5;
                RunObject = Page "Member Single List";
                RunPageLink = "No." = FIELD("Group Account No.");
                Visible = false;
            }
            separator(Action61)
            {
            }
            action("Member Document")
            {
                Image = Allocations;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "PrCasual Payroll Setup";
                //RunPageLink = Field6 = FIELD("No.");
            }
            separator(Action56)
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
            separator(Action64)
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
            separator(Action62)
            {
            }
            action("Dividend Instructions")
            {
                Image = InsertAccount;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Dividend Instructions - Member";
                RunPageLink = "Member No." = FIELD("No.");
            }
            separator(Action70)
            {
            }
            action(FingerPrints)
            {
                Caption = 'FingerPrints';
                Image = Filed;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec."FingerPrint Verified" := false;
                    Rec.Modify;

                    FingerprintProcessingFn.RunInputFingerPrints(Rec."No.", Rec.Name, Rec."ID No.");
                end;
            }
            action(VerifyPrints)
            {
                Caption = 'VerifyPrints';
                Image = ValidateEmailLoggingSetup;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    MyGuid: Guid;
                begin
                    Rec.SystemGeneratedGuid := CreateGuid;
                    Rec.Modify;

                    Rec."FingerPrint Verified" := false;
                    Rec."FingerPrint Verified" := (FingerprintProcessingFn.VerifyFingerPrints(Rec."No.", Rec.Name, Rec."ID No.", Rec.SystemGeneratedGuid));
                    Rec.Modify;
                end;
            }
            separator(Action51)
            {
            }
            action("Member Statistics")
            {
                Image = StatisticsGroup;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Member Statistics";
                RunPageLink = "No." = FIELD("No.");
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
                    CustMembr.Reset;
                    CustMembr.SetRange(CustMembr."No.", Rec."No.");
                    //if CustMembr.Find('-') then
                    //REPORT.Run(52185692, true, false, CustMembr);
                end;
            }
            separator(Action66)
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
            separator(Action25)
            {
            }
            action("E-Mail Statement")
            {
                Caption = '&E-Mail Statement';
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
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        AccoutTypeControl;
    end;

    trigger OnOpenPage()
    begin
        AccoutTypeControl;
    end;

    var
        [InDataSet]
        lblIDVisible: Boolean;
        [InDataSet]
        lblDOBVisible: Boolean;
        [InDataSet]
        lblRegNoVisible: Boolean;
        [InDataSet]
        lblRegDateVisible: Boolean;
        [InDataSet]
        lblGenderVisible: Boolean;
        [InDataSet]
        txtGenderVisible: Boolean;
        [InDataSet]
        lblMaritalVisible: Boolean;
        [InDataSet]
        txtMaritalVisible: Boolean;
        AccNo: Code[20];
        GenledSetup: Record "General Set-Up";
        GroupAccout: Boolean;
        GroupDetails: Boolean;
        GroupDetailsVisible: Boolean;
        CustMembr: Record Members;
        FingerprintProcessingFn: Codeunit "Fingerprint Processing Fn";
        MultipleEdit: Boolean;
        BusinessEdit: Boolean;
        AccountSignatories: Record "Account Signatories";

    //[Scope('Internal')]
    procedure AccoutTypeControl()
    begin
        case Rec."Single Party/Multiple" of
            Rec."Single Party/Multiple"::Multiple:
                begin
                    MultipleEdit := true;
                    BusinessEdit := false;
                end;

            Rec."Single Party/Multiple"::Business:
                begin
                    BusinessEdit := true;
                    MultipleEdit := false;
                end;

        end;
    end;
}

