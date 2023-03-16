page 52185944 "Imprest Details List"
{
    Caption = ' Travel  Imprest Details List';
    Editable = false;
    PageType = ListPart;
    SourceTable = "Imprest Lines";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field(No; Rec.No)
                {
                    Editable = false;
                    Visible = false;
                }
                field("Account No:"; Rec."Account No:")
                {
                }
                field("Account Name"; Rec."Account Name")
                {
                }
                field(Amount; Rec.Amount)
                {

                    trigger OnValidate()
                    begin
                        /*{Get the total amount paid}
                        Bal:=0;
                        
                        PayHeader.RESET;
                        PayHeader.SETRANGE(PayHeader."Line No.",No);
                        IF PayHeader.FINDFIRST THEN
                          BEGIN
                            PayLine.RESET;
                            PayLine.SETRANGE(PayLine.No,PayHeader."Line No.");
                            IF PayLine.FIND('-') THEN
                              BEGIN
                                REPEAT
                                  Bal:=Bal + PayLine."Pay Mode";
                                UNTIL PayLine.NEXT=0;
                              END;
                          END;
                        //Bal:=Bal + Amount;
                        
                        IF Bal > PayHeader.Amount THEN
                          BEGIN
                            ERROR('Please ensure that the amount inserted does not exceed the amount in the header');
                          END;
                          */

                    end;
                }
                field("Imprest Holder"; Rec."Imprest Holder")
                {
                }
                field("Due Date"; Rec."Due Date")
                {
                }
                field("Date Issued"; Rec."Date Issued")
                {
                }
                field(Purpose; Rec.Purpose)
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        PayHeader: Record "Receipts Header";
        PayLine: Record "Receipt Line";
        Bal: Decimal;
}

