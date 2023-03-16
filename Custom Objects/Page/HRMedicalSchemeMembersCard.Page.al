page 52186503 "HR Medical Scheme Members Card"
{
    PageType = Card;
    SourceTable = "HR Medical Scheme Members";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Scheme No"; Rec."Scheme No")
                {
                }
                field("Employee No"; Rec."Employee No")
                {
                }
                field("First Name"; Rec."First Name")
                {
                }
                field("Last Name"; Rec."Last Name")
                {
                }
                field(Designation; Rec.Designation)
                {
                }
                field(Department; Rec.Department)
                {
                }
                field("Scheme Join Date"; Rec."Scheme Join Date")
                {
                }
                field("Scheme Anniversary"; Rec."Scheme Anniversary")
                {
                }
                field("Out-Patient Limit"; Rec."Out-Patient Limit")
                {
                }
                field("Cumm.Amount Spent Out"; Rec."Cumm.Amount Spent Out")
                {
                }
                field("Balance Out- Patient"; Rec."Balance Out- Patient")
                {
                }
                field("In-patient Limit"; Rec."In-patient Limit")
                {
                }
                field("Cumm.Amount Spent"; Rec."Cumm.Amount Spent")
                {
                }
                field("Balance In- Patient"; Rec."Balance In- Patient")
                {
                }
                field("Maximum Cover"; Rec."Maximum Cover")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Functions")
            {
                Caption = '&Functions';
                action("Medical Claims")
                {
                    Caption = 'Medical Claims';
                    Image = PersonInCharge;
                    Promoted = true;
                    PromotedCategory = Category4;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        Medscheme.Reset;
        Medscheme.SetRange(Medscheme."Scheme No", Rec."Scheme No");
        if Medscheme.Find('-') then begin
            Rec."Out-Patient Limit" := Medscheme."Out-patient limit";
            Rec."In-patient Limit" := Medscheme."In-patient limit";
            Rec."Balance In- Patient" := Rec."In-patient Limit" - Rec."Cumm.Amount Spent";
            Rec."Balance Out- Patient" := Rec."Out-Patient Limit" - Rec."Cumm.Amount Spent Out";
        end;
    end;

    trigger OnInit()
    begin

        Medscheme.Reset;
        Medscheme.SetRange(Medscheme."Scheme No", Rec."Scheme No");
        if Medscheme.Find('-') then begin
            Rec."Out-Patient Limit" := Medscheme."Out-patient limit";
            Rec."In-patient Limit" := Medscheme."In-patient limit";
            Rec."Balance In- Patient" := Rec."In-patient Limit" - Rec."Cumm.Amount Spent";
            Rec."Balance Out- Patient" := Rec."Out-Patient Limit" - Rec."Cumm.Amount Spent Out";
        end;
    end;

    trigger OnOpenPage()
    begin
        Medscheme.Reset;
        Medscheme.SetRange(Medscheme."Scheme No", Rec."Scheme No");
        if Medscheme.Find('-') then begin
            Rec."Out-Patient Limit" := Medscheme."Out-patient limit";
            Rec."In-patient Limit" := Medscheme."In-patient limit";
            Rec."Balance In- Patient" := Rec."In-patient Limit" - Rec."Cumm.Amount Spent";
            Rec."Balance Out- Patient" := Rec."Out-Patient Limit" - Rec."Cumm.Amount Spent Out";
        end;
    end;

    var
        objSchMembers: Record "HR Medical Scheme Members";
        objScmDetails: Record "HR Medical Schemes";
        decInPatientBal: Decimal;
        Medscheme: Record "HR Medical Schemes";
}

