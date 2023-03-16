page 52186280 "Money Market Subform"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Investment Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Face Value"; Rec."Face Value")
                {
                }
                field("Premium/Discount"; Rec."Premium/Discount")
                {
                    Visible = Securities;
                }
                field("Investment Amount"; Rec."Investment Amount")
                {
                }
                field("Investment Amount (LCY)"; Rec."Investment Amount (LCY)")
                {
                }
                field("Fund Compliance"; Rec."Fund Compliance")
                {
                    Visible = false;
                }
                field("Sector Compliance"; Rec."Sector Compliance")
                {
                    Visible = false;
                }
                field("Aggregate Compliance"; Rec."Aggregate Compliance")
                {
                    Visible = false;
                }
                field("Entity Compliance"; Rec."Entity Compliance")
                {
                    Visible = false;
                }
                field("Interest Amount"; Rec."Interest Amount")
                {
                }
                field("Net Interest Amount"; Rec."Net Interest Amount")
                {
                }
                field("Wht Tax Amount"; Rec."Wht Tax Amount")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Create Asset")
            {
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        /*IF Header.GET("Request No.") THEN
        BEGIN
         IF Header."Deposit Type"=Header."Deposit Type"::Fixed THEN
       Fixed:=TRUE
       ELSE IF Header."Deposit Type"=Header."Deposit Type"::Call THEN
       Call:=TRUE
       ELSE IF Header."Deposit Type"=Header."Deposit Type"::Securities THEN
       Securities:=TRUE;
        END;
       */

    end;

    trigger OnInit()
    begin
        /*Securities:=FALSE;
        Fixed:=FALSE;
        Call:=FALSE;
        */

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        /* IF Header.GET("Request No.") THEN
         BEGIN
          IF Header."Deposit Type"=Header."Deposit Type"::Fixed THEN
        Fixed:=FALSE
        ELSE IF Header."Deposit Type"=Header."Deposit Type"::Call THEN
        Call:=FALSE
        ELSE IF Header."Deposit Type"=Header."Deposit Type"::Securities THEN
        Securities:=FALSE;
         END;
         */

    end;

    trigger OnOpenPage()
    begin
        /*IF Header.GET("Request No.") THEN
        BEGIN
         IF Header."Deposit Type"=Header."Deposit Type"::Fixed THEN
       Fixed:=TRUE
       ELSE IF Header."Deposit Type"=Header."Deposit Type"::Call THEN
       Call:=TRUE
       ELSE IF Header."Deposit Type"=Header."Deposit Type"::Fixed THEN
       Securities:=TRUE;
        END;
        */

    end;

    var
        Securities: Boolean;
        "Fixed": Boolean;
        Call: Boolean;
}

