// Query 7300 "Lot Numbers by Bin"
// {
//     Caption = 'Lot Numbers by Bin';
//     OrderBy = ascending(Bin_Code);

//     elements
//     {
//         dataitem(7312;7312)
//         {
//             column(Location_Code;"Location Code")
//             {
//             }
//             column(Item_No;"Item No.")
//             {
//             }
//             column(Variant_Code;"Variant Code")
//             {
//             }
//             column(Zone_Code;"Zone Code")
//             {
//             }
//             column(Bin_Code;"Bin Code")
//             {
//             }
//             column(Lot_No;"Lot No.")
//             {
//                 ColumnFilter = Lot_No=filter(<>'');
//             }
//             column(Sum_Qty_Base;"Qty. (Base)")
//             {
//                 ColumnFilter = Sum_Qty_Base=filter(<>0);
//                 Method = Sum;
//             }
//         }
//     }
// }
