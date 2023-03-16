#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52186390 pageextension52186390 extends "Misc. Articles Overview" 
{
    layout
    {
        modify("MATRIX_CaptionRange")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""MATRIX_CaptionRange"(Control 2)".

    }
    actions
    {
        modify(ShowMatrix)
        {
            ApplicationArea = Basic;
        }
        modify("Previous Set")
        {
            ToolTip = 'Previous Set';
            ApplicationArea = Basic;
        }
        modify("Next Set")
        {
            ToolTip = 'Next Set';
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "ShowMatrix(Action 77)".

        moveafter(ShowMatrix;"Next Set")
    }

    //Unsupported feature: Property Modification (Id) on ""MATRIX_MatrixRecord"(Variable 1001)".

    //var
        //>>>> ORIGINAL VALUE:
        //"MATRIX_MatrixRecord" : 1001;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //"MATRIX_MatrixRecord" : 1004;
        //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "MatrixMgt(Variable 1000)".

    //var
        //>>>> ORIGINAL VALUE:
        //MatrixMgt : 1000;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //MatrixMgt : 1003;
        //Variable type has not been exported.


    //Unsupported feature: Property Modification (Length) on ""MATRIX_CaptionSet"(Variable 1045)".

    //var
        //>>>> ORIGINAL VALUE:
        //"MATRIX_CaptionSet" : 80;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //"MATRIX_CaptionSet" : 1024;
        //Variable type has not been exported.


    //Unsupported feature: Property Modification (Length) on ""MATRIX_CaptionRange"(Variable 1046)".

    //var
        //>>>> ORIGINAL VALUE:
        //"MATRIX_CaptionRange" : 80;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //"MATRIX_CaptionRange" : 1024;
        //Variable type has not been exported.

    //Unsupported feature: Move on ""MATRIX_GenerateColumnCaptions"(PROCEDURE 1096).CurrentMatrixRecordOrdinal(Variable 1001)".

}
