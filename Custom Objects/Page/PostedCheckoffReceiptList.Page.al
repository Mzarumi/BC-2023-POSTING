page 52185705 "Posted Checkoff  Receipt List"
{
    CardPageID = "Checkoff Receipt Transactions";
    Editable = false;
    PageType = List;
    SourceTable = "Checkoff  Receipt Transactions";
    SourceTableView = WHERE(Posted = FILTER(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                }
                field("Account No"; Rec."Account No")
                {
                }
                field("Account Name"; Rec."Account Name")
                {
                }
                field("Posting Period"; Rec."Posting Period")
                {
                }
                field("Document No"; Rec."Document No")
                {
                }
                field(Type; Rec.Type)
                {
                }
                field("Cheque Type"; Rec."Cheque Type")
                {
                }
                field("Cheque No"; Rec."Cheque No")
                {
                }
                field(Posted; Rec.Posted)
                {
                    Editable = false;
                }
                field(Cashier; Rec.Cashier)
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Employer No"; Rec."Employer No")
                {
                }
                field("Employer  Account Name"; Rec."Employer  Account Name")
                {
                }
                field(Remarks; Rec.Remarks)
                {
                }
                field("Posted By"; Rec."Posted By")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Discount Cheque")
            {
                Image = MakeAgreement;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = false;
                RunObject = Page "Cheque Discounting";
                RunPageLink = No = FIELD(No),
                              Type = CONST("Cheque Deposit");
                Visible = false;
            }
            action("Stop Cheque")
            {
                Image = VoidCheck;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                var
                    SaccoT: Codeunit "Sacco Transactions";
                begin

                    //SaccoT.StopCheque(Rec);
                end;
            }
            action("Clear Cheque")
            {
                Image = Delegate;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Cheque Clearance";
                Visible = false;

                trigger OnAction()
                begin
                    /*
                    IF Type<>Type::"26" THEN
                      ERROR('Only applicable to Lien');
                    
                    IF CONFIRM('Are you sure you want to process the selected transactions?',FALSE) = TRUE THEN BEGIN
                    
                    "Cheque Status":="Cheque Status"::Honoured;
                    "Date Cleared":=TODAY;
                    "Cleared By":=USERID;
                    MODIFY;
                    
                    MESSAGE('Lien processed successfully');
                    
                    END;*/

                end;
            }
        }
    }

    trigger OnInit()
    begin
        Temp.Get(UserId);

        Jtemplate := Temp."Cashier Journal Template";
        Jbatch := Temp."Cashier Journal Batch";
        TillNo := Temp."Default  Bank";
        MemberNo := Temp."Member No.";
        Excess := Temp."Excess Account";
        Shortage := Temp."Shortage Account";

        if Jtemplate = '' then begin
            Error(Text0001);
        end;
        if Jbatch = '' then begin
            Error(Text0002);
        end;

        if TillNo = '' then begin
            Error(Text0003);
        end;
        /*
        IF MemberNo='' THEN
          BEGIN
            ERROR(Text0004);
          END;
        
        IF Shortage='' THEN
          BEGIN
            ERROR(Text0005);
          END;
        
        IF Excess='' THEN
          BEGIN
            ERROR(Text0006);
          END;
        */

    end;

    trigger OnOpenPage()
    begin
        //SETRANGE(Cashier,USERID);
    end;

    var
        Temp: Record "Banking User Template";
        Jtemplate: Code[20];
        Jbatch: Code[20];
        TillNo: Code[20];
        MemberNo: Code[20];
        Text0001: Label 'Ensure the Cashier journal Template is set up in Banking User Setup';
        Text0002: Label 'Ensure the Cashier journal Batch is set up in Banking User Setup';
        Text0003: Label 'Ensure the Default Bank is set up in Banking User Setup';
        Text0004: Label 'Ensure the Cashier Member no is set up in Banking User Setup';
        Excess: Code[20];
        Shortage: Code[20];
        Text0005: Label 'Ensure the Cashier Shortage Account is set up in Banking User Setup';
        Text0006: Label 'Ensure the Cashier Excess Account iis set up in Banking User Setup';
}

