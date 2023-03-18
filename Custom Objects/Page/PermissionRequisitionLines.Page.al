page 52186268 "Permission Requisition Lines"
{
    PageType = ListPart;
    SourceTable = "Permission Requisition Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Systems Affected"; Rec."Systems Affected")
                {

                    trigger OnValidate()
                    begin
                        Rec.Role := '';
                        Rec."Reason For Request" := '';
                        if Rec."Systems Affected" = 'NAVISION' then
                            roleEditable := true
                        else
                            roleEditable := false;
                    end;
                }
                field(Category; Rec.Category)
                {
                }
                field(Role; Rec.Role)
                {
                    Enabled = roleEditable;

                    trigger OnValidate()
                    begin
                        AggregatePermissionSet.Reset;
                        AggregatePermissionSet.SetRange("Role ID", Rec.Role);
                        if AggregatePermissionSet.FindFirst then
                            Rec."Reason For Request" := AggregatePermissionSet.Name;
                    end;
                }
                field("Reason For Request"; Rec."Reason For Request")
                {
                    MultiLine = false;
                    Width = 20;
                }
                field("Start Date"; Rec."Start Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field("Employee No"; Rec."Employee No")
                {
                }
                field("Employee Name"; Rec."Employee Name")
                {
                }
                field(Granted; Rec.Granted)
                {
                }
                field("Granted\Denied By"; Rec."Granted\Denied By")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        roleEditable: Boolean;
        AggregatePermissionSet: Record "Aggregate Permission Set";
}

