page 52185630 "Control-Information"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Control-Information";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
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
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                }
                field("Company P.I.N"; Rec."Company P.I.N")
                {
                }
                field("N.S.S.F No."; Rec."N.S.S.F No.")
                {
                }
                field("N.H.I.F No"; Rec."N.H.I.F No")
                {
                }
                field("Company code"; Rec."Company code")
                {
                }
                field(Mission; Rec.Mission)
                {
                }
                field(Vision; Rec.Vision)
                {
                }
                field("Mission/Vision Link"; Rec."Mission/Vision Link")
                {
                }
                field("Multiple Payroll"; Rec."Multiple Payroll")
                {
                }
                field(Picture; Rec.Picture)
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
            }
            group("Physical Address")
            {
                Caption = 'Physical Address';
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    Caption = 'Name';
                }
                field("Ship-to Address"; Rec."Ship-to Address")
                {
                    Caption = 'Address';
                }
                field("Ship-to Address 2"; Rec."Ship-to Address 2")
                {
                    Caption = 'Address 2';
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    Caption = 'Post Code/City';
                }
                field("Ship-to City"; Rec."Ship-to City")
                {
                }
                field("Ship-to Contact"; Rec."Ship-to Contact")
                {
                    Caption = 'Contact';
                }
                field("Location Code"; Rec."Location Code")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Company)
            {
                Caption = 'Company';
                action(Committes)
                {
                    Caption = 'Committes';
                    //RunObject = Page Page52211;
                    Visible = false;
                }
                action("Board Of Directors")
                {
                    Caption = 'Board Of Directors';
                    //RunObject = Page Page52212;
                    Visible = false;
                }
                action("Rules & Regulations")
                {
                    Caption = 'Rules & Regulations';
                    //RunObject = Page Page52213;
                    Visible = false;
                }
                action("Company Activities")
                {
                    Caption = 'Company Activities';
                    //RunObject = Page Page52226;
                }
                action("Base Calendar")
                {
                    Caption = 'Base Calendar';
                    Image = Calendar;
                    RunObject = Page "Base Calendar Card";
                }
                action("Vendors & Service Providers")
                {
                    Caption = 'Vendors & Service Providers';
                    Image = Vendor;
                    RunObject = Page "Vendor Card";
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset;
        if not Rec.Get then begin
            Rec.Init;
            Rec.Insert;
        end;
    end;

    var
        Mail: Codeunit Mail;
        PictureExists: Boolean;
}

