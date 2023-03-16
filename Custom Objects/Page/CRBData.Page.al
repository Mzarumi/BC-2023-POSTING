page 52186440 "CRB Data"
{
    Editable = false;
    PageType = List;
    SourceTable = "CRB Data";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                }
                field("Forename 1"; Rec."Forename 1")
                {
                    Caption = 'Surname';
                }
                field("Forename 2"; Rec."Forename 2")
                {
                    Caption = 'Forename 1';
                }
                field("Forename 3"; Rec."Forename 3")
                {
                    Caption = 'Forename 2';
                }
                field("Name 3"; Rec."Name 3")
                {
                    Caption = 'Forename 3';
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                }
                field("Client Code"; Rec."Client Code")
                {
                    Caption = 'Client Number';
                }
                field("Account Number"; Rec."Account Number")
                {
                }
                field(Gender; Rec.Gender)
                {
                }
                field(Nationality; Rec.Nationality)
                {
                }
                field("Marital Status"; Rec."Marital Status")
                {
                }
                field("Primary Identification code"; Rec."Primary Identification code")
                {
                    Caption = 'Primary Identification Document Type';
                }
                field("Primary Identification Number"; Rec."Primary Identification Number")
                {
                    Caption = 'Primary Identification Doc Number';
                }
                field("Other Identification Type"; Rec."Other Identification Type")
                {
                    Caption = 'Secondary Identification Document Type';
                }
                field("Secondary Identification"; Rec."Secondary Identification")
                {
                    Caption = 'Secondary Identification Document Number';
                }
                field("Secondary Identification code"; Rec."Secondary Identification code")
                {
                    Caption = 'Other Identification Document Type';
                }
                field("Other Identification Number"; Rec."Other Identification Number")
                {
                }
                field("Mobile No"; Rec."Mobile No")
                {
                    Caption = 'Mobile Telephone Number';
                }
                field("Home Telephone"; Rec."Home Telephone")
                {
                }
                field("Work Telephone"; Rec."Work Telephone")
                {
                }
                field("Postal Address 1"; Rec."Postal Address 1")
                {
                }
                field("Postal Address 2"; Rec."Postal Address 2")
                {
                }
                field("Postal Location Town"; Rec."Postal Location Town")
                {
                }
                field("Postal Location Country"; Rec."Postal Location Country")
                {
                }
                field("Post Code"; Rec."Post Code")
                {
                }
                field("Physical Address 1"; Rec."Physical Address 1")
                {
                }
                field("Physical Address 2"; Rec."Physical Address 2")
                {
                }
                field("Plot Number"; Rec."Plot Number")
                {
                }
                field("Location Town"; Rec."Location Town")
                {
                }
                field("Location Country"; Rec."Location Country")
                {
                }
                field("Date of Physical Address"; Rec."Date of Physical Address")
                {
                    Caption = 'Type of Residency';
                }
                field("PIN Number"; Rec."PIN Number")
                {
                }
                field("Customer Work Email"; Rec."Customer Work Email")
                {
                    Caption = 'Consumer E-Mail';
                }
                field("Employer Name"; Rec."Employer Name")
                {
                }
                field("Employer Industry Type"; Rec."Employer Industry Type")
                {
                    Caption = 'Occupational Industry Type';
                }
                field("Employment Date"; Rec."Employment Date")
                {
                }
                field("Employment Type"; Rec."Employment Type")
                {
                }
                field("Income Amount"; Rec."Income Amount")
                {
                }
                field("Lenders Registered Name"; Rec."Lenders Registered Name")
                {
                }
                field("Lenders Trading Name"; Rec."Lenders Trading Name")
                {
                }
                field("Lenders Branch Name"; Rec."Lenders Branch Name")
                {
                }
                field("Lenders Branch Code"; Rec."Lenders Branch Code")
                {
                }
                field("Account Type"; Rec."Account Type")
                {
                    Caption = 'Account Joint/Single Indicator';
                }
                field("Account Product Type"; Rec."Account Product Type")
                {
                }
                field("Date Account Opened"; Rec."Date Account Opened")
                {
                }
                field("Installment Due Date"; Rec."Installment Due Date")
                {
                }
                field("Original Amount"; Rec."Original Amount")
                {
                }
                field("Currency of Facility"; Rec."Currency of Facility")
                {
                }
                field("Amount in Kenya shillings"; Rec."Amount in Kenya shillings")
                {
                    Caption = 'Current Balance in Kenya Shillings';
                }
                field("Current Balance"; Rec."Current Balance")
                {
                }
                field("Overdue Balance"; Rec."Overdue Balance")
                {
                }
                field("Overdue Date"; Rec."Overdue Date")
                {
                }
                field("No of Days in Arreas"; Rec."No of Days in Arreas")
                {
                }
                field("No of Installment In"; Rec."No of Installment In")
                {
                }
                field("Performing / NPL Indicator"; Rec."Performing / NPL Indicator")
                {
                    Caption = 'Prudential Risk Classification';
                }
                field("Account Status"; Rec."Account Status")
                {
                }
                field("Account Status Date"; Rec."Account Status Date")
                {
                }
                field("Account Closure Reason"; Rec."Account Closure Reason")
                {
                }
                field("Repayment Period"; Rec."Repayment Period")
                {
                }
                field("Deferred Payment Date"; Rec."Deferred Payment Date")
                {
                }
                field("Deferred Payment"; Rec."Deferred Payment")
                {
                    Caption = 'Deferred Payment Amount';
                }
                field("Payment Frequency"; Rec."Payment Frequency")
                {
                }
                field("Disbursement Date"; Rec."Disbursement Date")
                {
                }
                field("Insallment Amount"; Rec."Insallment Amount")
                {
                    Caption = 'Next Installment Amount';
                }
                field("Date of Latest Payment"; Rec."Date of Latest Payment")
                {
                }
                field("Last Payment Amount"; Rec."Last Payment Amount")
                {
                }
                field("Type of Security"; Rec."Type of Security")
                {
                }
                field("Name 2"; Rec."Name 2")
                {
                    Caption = 'Group ID';
                }
                field("Loan No."; Rec."Loan No.")
                {
                }
                field(Outbal; Rec.Outbal)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Generate Data")
            {
                Image = GetEntries;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                //RunObject = Report "Member Application Register";
            }
            action("Export CRB")
            {
                Image = Export;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ////RunObject = XMLport "Loans CRB";
            }
        }
    }
}

