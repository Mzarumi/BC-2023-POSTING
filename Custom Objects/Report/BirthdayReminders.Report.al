#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185711 "Birthday Reminders"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Birthday Reminders.rdlc';

    dataset
    {
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    // trigger OnPreReport()
    // begin
    //     PeriodicActivities.SendBirthdayMessages;
    //     PeriodicActivities.SendTotoBirthdayMessages;
    // end;

    var
    //PeriodicActivities: Codeunit 52185470;
}
