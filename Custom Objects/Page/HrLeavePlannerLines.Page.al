page 52185568 "Hr Leave Planner Lines"
{
    PageType = ListPart;
    SourceTable = "HR Leave Planner Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Staff No."; Rec."Staff No.")
                {
                }
                field("Staff Name"; Rec."Staff Name")
                {
                }
                field(January; Rec.January)
                {
                    DrillDown = true;
                    Editable = false;

                    trigger OnDrillDown()
                    begin
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown."Employee No", Rec."Staff No.");
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown.Month, 1);
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown.Year, Rec.Year);

                        PAGE.Run(0, LeavePlannerDrillDown);
                    end;
                }
                field(Feburuary; Rec.Feburuary)
                {
                    Editable = true;

                    trigger OnDrillDown()
                    begin
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown."Employee No", Rec."Staff No.");
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown.Month, 2);
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown.Year, Rec.Year);

                        PAGE.Run(0, LeavePlannerDrillDown);
                    end;
                }
                field(March; Rec.March)
                {
                    Editable = true;

                    trigger OnDrillDown()
                    begin
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown."Employee No", Rec."Staff No.");
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown.Month, 3);
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown.Year, Rec.Year);

                        PAGE.Run(0, LeavePlannerDrillDown);
                    end;
                }
                field(April; Rec.April)
                {
                    Editable = true;

                    trigger OnDrillDown()
                    begin
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown."Employee No", Rec."Staff No.");
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown.Month, 4);
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown.Year, Rec.Year);

                        PAGE.Run(0, LeavePlannerDrillDown);
                    end;
                }
                field(May; Rec.May)
                {
                    Editable = true;

                    trigger OnDrillDown()
                    begin
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown."Employee No", Rec."Staff No.");
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown.Month, 5);
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown.Year, Rec.Year);

                        PAGE.Run(0, LeavePlannerDrillDown);
                    end;
                }
                field(June; Rec.June)
                {
                    Editable = true;

                    trigger OnDrillDown()
                    begin
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown."Employee No", Rec."Staff No.");
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown.Month, 6);
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown.Year, Rec.Year);

                        PAGE.Run(0, LeavePlannerDrillDown);
                    end;
                }
                field(July; Rec.July)
                {

                    trigger OnDrillDown()
                    begin
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown."Employee No", Rec."Staff No.");
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown.Month, 7);
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown.Year, Rec.Year);

                        PAGE.Run(0, LeavePlannerDrillDown);
                    end;
                }
                field(August; Rec.August)
                {

                    trigger OnDrillDown()
                    begin
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown."Employee No", Rec."Staff No.");
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown.Month, 8);
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown.Year, Rec.Year);

                        PAGE.Run(0, LeavePlannerDrillDown);
                    end;
                }
                field(September; Rec.September)
                {

                    trigger OnDrillDown()
                    begin
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown."Employee No", Rec."Staff No.");
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown.Month, 9);
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown.Year, Rec.Year);

                        PAGE.Run(0, LeavePlannerDrillDown);
                    end;
                }
                field(October; Rec.October)
                {

                    trigger OnDrillDown()
                    begin
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown."Employee No", Rec."Staff No.");
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown.Month, 10);
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown.Year, Rec.Year);

                        PAGE.Run(0, LeavePlannerDrillDown);
                    end;
                }
                field(November; Rec.November)
                {

                    trigger OnDrillDown()
                    begin
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown."Employee No", Rec."Staff No.");
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown.Month, 11);
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown.Year, Rec.Year);

                        PAGE.Run(0, LeavePlannerDrillDown);
                    end;
                }
                field(December; Rec.December)
                {

                    trigger OnDrillDown()
                    begin
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown."Employee No", Rec."Staff No.");
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown.Month, 12);
                        LeavePlannerDrillDown.SetRange(LeavePlannerDrillDown.Year, Rec.Year);

                        PAGE.Run(0, LeavePlannerDrillDown);
                    end;
                }
            }
        }
    }

    actions
    {
    }

    var
        LeavePlannerDrillDown: Record "HR Leave Planner Drill";
}

