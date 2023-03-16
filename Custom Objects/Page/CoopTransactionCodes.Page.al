page 52185505 "Coop Transaction Codes"
{
    PageType = List;
    SourceTable = "Coop Transaction Codes";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field(Terminal; Rec.Terminal)
                {

                    trigger OnValidate()
                    begin
                        /*
                        IF Terminal <> '' THEN
                            IF Code <> '0011' THEN
                                  IF Code <> '0027' THEN
                                      IF Code <> '0014' THEN
                                            IF Code <> '0016' THEN
                                                ERROR('Not Applicable to this Code');
                                                */

                    end;
                }
                field(Channel; Rec.Channel)
                {

                    trigger OnValidate()
                    begin
                        /*
                        IF Channel <> '' THEN
                            IF Code <> '0011' THEN
                                  IF Code <> '0027' THEN
                                      IF Code <> '0014' THEN
                                            IF Code <> '0016' THEN
                                                ERROR('Not Applicable to this Code');
                                                */

                    end;
                }
                field(Description; Rec.Description)
                {
                }
                field("Daily Limit"; Rec."Daily Limit")
                {
                }
                field("Coop Bank Account"; Rec."Coop Bank Account")
                {
                }
                field("Posting Description"; Rec."Posting Description")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Charges)
            {
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Coop ATM Charges";
                RunPageLink = Code = FIELD(Code),
                              Terminal = FIELD(Terminal),
                              Channel = FIELD(Channel);
            }
        }
    }

    trigger OnInit()
    begin
        SkyPermissions.Reset;
        SkyPermissions.SetRange("User ID", UserId);
        SkyPermissions.SetRange("ATM Setups", false);
        if SkyPermissions.FindFirst then Error('You do nto have permission ATM Setups in MBanking Permissions');
    end;

    var
        SkyPermissions: Record "Sky Permissions";
}

