// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 1374 "Mini Favorite Customers List"
// {
//     Caption = 'Favorite Customers List';
//     PageType = ListPart;
//     SourceTable = "My Customer";

//     layout
//     {
//         area(content)
//         {
//             repeater(Control1)
//             {
//                 field("Customer No.";Rec."Customer No.")
//                 {
//                     ApplicationArea = Basic;
//                     Width = 4;

//                     trigger OnValidate()
//                     begin
//                         GetCustomer;
//                     end;
//                 }
//                 field("Cust.Name";Cust.Name)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Name';
//                     Editable = false;
//                     Width = 20;
//                 }
//                 field("Cust.""Phone No.""";Cust."Phone No.")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Phone No.';
//                     Editable = false;
//                     ExtendedDatatype = PhoneNo;
//                     Width = 8;
//                 }
//                 field(Balance;Cust.Balance)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Balance';
//                     Editable = false;
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(processing)
//         {
//             action(Open)
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Open';
//                 Image = ViewDetails;
//                 RunObject = Page "Mini Customer Card";
//                 RunPageLink = "No."=field("Customer No.");
//                 RunPageMode = View;
//                 RunPageView = sorting("No.");
//                 Scope = Repeater;
//                 ShortCutKey = 'Return';
//             }
//         }
//     }

//     trigger OnAfterGetRecord()
//     begin
//         GetCustomer;
//     end;

//     trigger OnNewRecord(BelowxRec: Boolean)
//     begin
//         Clear(Cust);
//     end;

//     trigger OnOpenPage()
//     begin
//         Rec.SetRange(Rec."User ID",UserId);
//     end;

//     var
//         Cust: Record Customer;

//     local procedure GetCustomer()
//     begin
//         Clear(Cust);
//         if Cust.Get(Rec."Customer No.") then
//           Cust.CalcFields(Balance);
//     end;
// }
