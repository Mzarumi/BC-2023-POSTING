#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52185963 pageextension52185963 extends "Purchase Performance"
{
    layout
    {
        modify(StatusText)
        {
            ApplicationArea = Basic;
        }
        modify(BusinessChart)
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "StatusText(Control 2)".

    }
    actions
    {
        modify(SelectChart)
        {
            ApplicationArea = Basic;
        }
        modify(Day)
        {
            ApplicationArea = Basic;
        }
        modify(Week)
        {
            ApplicationArea = Basic;
        }
        modify(Month)
        {
            ApplicationArea = Basic;
        }
        modify(Quarter)
        {
            ApplicationArea = Basic;
        }
        modify(Year)
        {
            ApplicationArea = Basic;
        }
        modify(PreviousPeriod)
        {
            ApplicationArea = Basic;
        }
        modify(NextPeriod)
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "SelectChart(Action 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Day(Action 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Week(Action 13)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Month(Action 12)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Quarter(Action 11)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Year(Action 9)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PreviousPeriod(Action 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on "NextPeriod(Action 17)".

        addafter(NextPeriod)
        {
            separator(Action7)
            {
            }
            action(Refresh)
            {
                ApplicationArea = Basic;
                Caption = 'Refresh';
                Image = Refresh;

                trigger OnAction()
                begin
                    Rec.InitializePeriodFilter(0D, 0D);
                    // UpdateChart(Period::" ");
                end;
            }
        }
    }

    //Unsupported feature: Property Modification (ExternalDataType) on ""BusinessChart@-5::DataPointClicked"(EVENT 12).point(Parameter 1000)".


    //Unsupported feature: Property Modification (ExternalDataType) on ""BusinessChart@-5::DataPointDoubleClicked"(EVENT 13).point(Parameter 1000)".

}
