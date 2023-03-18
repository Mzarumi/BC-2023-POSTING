page 52185465 "Agent Transfer Page"
{
    PageType = Card;
    SourceTable = "Sky Agent Transfer";

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = false;
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field("Transaction Time"; Rec."Transaction Time")
                {
                }
                field("Agent Code"; Rec."Agent Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Member No"; Rec."Member No")
                {
                }
                field("Agent Name"; Rec."Agent Name")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field("Date Posted"; Rec."Date Posted")
                {
                }
                field("Time Posted"; Rec."Time Posted")
                {
                }
                field("Posted By"; Rec."Posted By")
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field("Debit Account Type"; Rec."Debit Account Type")
                {
                }
            }
            // group("Rejection reason")
            // {
            //     Editable = RejectedEditable;
            //     field("Rejection Reason"; Rec."Rejection Reason")
            //     {
            //     }
            //     field(Rejected; Rec.Rejected)
            //     {
            //     }
            //     field("Rejected By"; Rec."Rejected By")
            //     {
            //     }
            // }
        }
    }

    actions
    {
        area(creation)
        {
            action(Post)
            {
                Image = Post;
                Promoted = true;

                trigger OnAction()
                begin
                    if Rec.Posted then Error('The transaction has already been posted');
                    if Rec.Rejected then Error('You cannot post a rejected transaction');
                    //MESSAGE("Transaction ID");
                    //SkyAgencyBanking.PostAgentTransaction(Rec."Transaction ID");
                    Message('Posted Sucsessfully');
                end;
            }
            action(Reject)
            {
                Image = Reject;
                Promoted = true;

                trigger OnAction()
                begin
                    if Rec.Posted then Error('You cannot rejected a posted transaction');
                    if Rec.Rejected then Error('The transaction has already been rejected');
                    if Rec."Rejection Reason" = '' then Error('Rejection reason must have a value');
                    Rec.Rejected := true;
                    Rec."Rejected By" := UserId;
                    Rec.Modify;
                    //Send SMS;
                    AgentApplications.Get(Rec."Agent Code");
                    msg := 'Dear Agent your Utility to FOSA transfer of amount KES ' + Format(Rec.Amount) + ' has been rejected, Reason: ' + Rec."Rejection Reason";
                    MobileNo := AgentApplications."Mobile No";
                    //SkyAgencyBanking.SendSmsWithID(Source::Agency, MobileNo, msg, Format(Rec."Transaction ID"), '', true, 220, false, 'AGENT', "Session ID", 'AGENT');
                    Message('Rejected Successfully');
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        RejectedEditable := true;
        if Rec.Posted then
            RejectedEditable := false;
    end;

    var
        SkyAgencyBanking: Codeunit "Post Agent Transactions";
        RejectedEditable: Boolean;
        Source: Option ,Agency;
        msg: Text;
        MobileNo: Text;
        AgentApplications: Record "Agent Applications";
}

