page 52185650 "prRates & Ceilings List"
{
    CardPageID = "PR Rates & Ceilings";
    PageType = List;
    SourceTable = "PR Vital Setup Info";

    layout
    {
        area(content)
        {
            group("Rates & Ceilings")
            {
                Caption = 'Rates & Ceilings';
                field("Setup Code"; Rec."Setup Code")
                {
                    Editable = true;
                }
                group("Tax Reliefs")
                {
                    Caption = 'Tax Reliefs';
                    field("Tax Relief"; Rec."Tax Relief")
                    {
                    }
                    field("Insurance Relief"; Rec."Insurance Relief")
                    {
                    }
                    field("NHIF Relief"; Rec."NHIF Relief")
                    {
                    }
                    label(Control35)
                    {
                        CaptionClass = Text19076757;
                        ShowCaption = false;
                    }
                    field("Max Relief"; Rec."Max Relief")
                    {
                    }
                    label(Control33)
                    {
                        CaptionClass = Text19058477;
                        ShowCaption = false;
                    }
                }
                group("N.S.S.F Contribution %")
                {
                    Caption = 'N.S.S.F Contribution %';
                    field("NSSF Employee"; Rec."NSSF Employee")
                    {
                    }
                    field("NSSF Employer Factor"; Rec."NSSF Employer Factor")
                    {
                    }
                }
                group("N.H.I.F/N.S.S.F Based On")
                {
                    Caption = 'N.H.I.F/N.S.S.F Based On';
                    field("NHIF Based on"; Rec."NHIF Based on")
                    {
                        Caption = 'NHIF Based On:';
                    }
                    field("NSSF Based on"; Rec."NSSF Based on")
                    {
                    }
                }
                group(Pension)
                {
                    Caption = 'Pension';
                    field("Max Pension Contribution"; Rec."Max Pension Contribution")
                    {
                    }
                    label(Control24)
                    {
                        CaptionClass = Text19049626;
                        ShowCaption = false;
                    }
                    field("Tax On Excess Pension"; Rec."Tax On Excess Pension")
                    {
                    }
                }
                group("Home Ownership Savings Plan")
                {
                    Caption = 'Home Ownership Savings Plan';
                    field("Mortgage Relief"; Rec."Mortgage Relief")
                    {
                        Caption = 'Less from Taxable Pay';
                    }
                }
                group("Owner Occupier Interest")
                {
                    Caption = 'Owner Occupier Interest';
                    field("OOI Deduction"; Rec."OOI Deduction")
                    {
                        Caption = 'Max Monthly Contribution';
                    }
                    field("OOI December"; Rec."OOI December")
                    {
                        Caption = 'December deduction';
                    }
                }
                group("Staff Loans")
                {
                    Caption = 'Staff Loans';
                    field("Loan Market Rate"; Rec."Loan Market Rate")
                    {
                    }
                    label(Control15)
                    {
                        CaptionClass = Text19080002;
                        ShowCaption = false;
                    }
                    field("Loan Corporate Rate"; Rec."Loan Corporate Rate")
                    {
                    }
                    label(Control13)
                    {
                        CaptionClass = Text19080003;
                        ShowCaption = false;
                    }
                }
                group("Servants Benefits")
                {
                    Caption = 'Servants Benefits';
                    field("Security Day (U)"; Rec."Security Day (U)")
                    {
                    }
                    field("Security Night (U)"; Rec."Security Night (U)")
                    {
                    }
                    field("Ayah (U)"; Rec."Ayah (U)")
                    {
                    }
                    field("Gardener (U)"; Rec."Gardener (U)")
                    {
                    }
                    field("Security Day (R)"; Rec."Security Day (R)")
                    {
                    }
                    field("Security Night (R)"; Rec."Security Night (R)")
                    {
                    }
                    field("Ayah (R)"; Rec."Ayah (R)")
                    {
                    }
                    field("Gardener (R)"; Rec."Gardener (R)")
                    {
                    }
                }
                group(Control3)
                {
                    ShowCaption = false;
                    field("Taxable Pay (Normal)"; Rec."Taxable Pay (Normal)")
                    {
                    }
                    field("Taxable Pay (Agricultural)"; Rec."Taxable Pay (Agricultural)")
                    {
                    }
                }
            }
        }
    }

    actions
    {
    }

    var
        Text19076757: Label '(%)';
        Text19058477: Label '(Personal+Insurance)';
        Text19049626: Label '(Pension(self)+Nssf)';
        Text19080001: Label '(%)';
        Text19080002: Label '(%)';
        Text19080003: Label '(%)';
}

