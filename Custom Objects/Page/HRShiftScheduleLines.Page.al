page 52186616 "HR Shift Schedule Lines"
{
    PageType = ListPart;
    SourceTable = "HR Shift Schedule Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No."; Rec."Employee No.")
                {
                }
                field("Full Name"; Rec."Full Name")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Clock In Time"; Rec."Clock In Time")
                {
                }
                field("Clock Out Time"; Rec."Clock Out Time")
                {
                }
                field(Duration; Rec.Duration)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action("Suggest Participants")
                {
                    Caption = 'Suggest Participants';

                    trigger OnAction()
                    begin
                        HRShiftScheduleHeader.Reset;
                        HRShiftScheduleHeader.SetRange(HRShiftScheduleHeader.Code, Rec.Code);
                        if HRShiftScheduleHeader.Find('-') then begin
                            //HRShiftScheduleHeader.TestField(HRShiftScheduleHeader.Status,HRShiftScheduleHeader.Status::Approved);
                        end;



                        Rec.Reset;
                        Rec.SetFilter(Code, Rec.Code);
                        //REPORT.Run(REPORT::"HR Suggest Participants OLD", true, true, Rec);
                    end;
                }
            }
        }
    }

    var
        HRShiftScheduleHeader: Record "HR Shift Schedule Header";
        HRShiftScheduleLines: Record "HR Shift Schedule Lines";
}

