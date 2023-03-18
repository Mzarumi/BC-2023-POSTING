page 52185945 "Responsibility Center CardBR"
{
    Caption = 'Responsibility Center Card';
    PageType = Card;
    SourceTable = "Responsibility CenterBR";

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
                field(Name; Rec.Name)
                {
                }
                field(Address; Rec.Address)
                {
                }
                field("Address 2"; Rec."Address 2")
                {
                }
                field("Post Code"; Rec."Post Code")
                {
                    Caption = 'Post Code/City';
                }
                field(City; Rec.City)
                {
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                }
                field(Contact; Rec.Contact)
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
                field("Phone No."; Rec."Phone No.")
                {
                }
                field("Fax No."; Rec."Fax No.")
                {
                }
                field("E-Mail"; Rec."E-Mail")
                {
                }
                field("Home Page"; Rec."Home Page")
                {
                }
                field("Notify Payment User(s)"; Rec."Notify Payment User(s)")
                {
                }
                field("Payment User(s) - E-Mail"; Rec."Payment User(s) - E-Mail")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Resp. Ctr.")
            {
                Caption = '&Resp. Ctr.';
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    ShortCutKey = 'Shift+Ctrl+D';
                    Visible = false;
                }
            }
        }
    }

    var
        Mail: Codeunit Mail;
}

