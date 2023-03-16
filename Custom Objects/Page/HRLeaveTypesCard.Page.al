page 52185553 "HR Leave Types Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "HR Leave Types";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code"; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Days; Rec.Days)
                {
                }
                field(Gender; Rec.Gender)
                {
                }
                field("Unlimited Days"; Rec."Unlimited Days")
                {
                }
                field("Inclusive of Non Working Days"; Rec."Inclusive of Non Working Days")
                {
                }
                field("Max Carry Forward Days"; Rec."Max Carry Forward Days")
                {
                }
                field("Is Annual Leave"; Rec."Is Annual Leave")
                {
                }
                field(Active; Rec.Active)
                {
                }
                field("Carry Forward Allowed"; Rec."Carry Forward Allowed")
                {
                }
                group("Carry Forward")
                {
                    Caption = 'Carry Forward';
                    grid(Control2)
                    {
                        GridLayout = Rows;
                        ShowCaption = false;
                        group(Control1)
                        {
                            ShowCaption = false;
                            field(Balance; Rec.Balance)
                            {

                                trigger OnValidate()
                                begin

                                    fn_SetVisible;
                                end;
                            }
                        }
                    }
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin

        fn_SetVisible;
    end;

    var
        [InDataSet]
        CarryForwardVisible: Boolean;

    local procedure fn_SetVisible()
    begin
        //Dann - To hide fields to prevent setup errors and hide uneccessary fields
        CarryForwardVisible := false;
        case Rec.Balance of
            Rec.Balance::"Carry Forward":
                begin
                    CarryForwardVisible := true;
                end;
        end;
    end;
}

