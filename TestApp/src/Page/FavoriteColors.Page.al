page 50001 "Favorite Colors"
{
    Caption = 'Favorite Colors';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Favorite Color";

    layout
    {
        area(Content)
        {
            repeater(Colors)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the entry number.';
                }
                field("Color Name"; Rec."Color Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the color.';
                }
                field("Hex Code"; Rec."Hex Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the hex code of the color (e.g., #FF0000).';
                }
                field("Is Primary"; Rec."Is Primary")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether this is a primary color.';
                }
                field(Brightness; Rec.Brightness)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the brightness level (0-100).';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(AddPrimaryColors)
            {
                Caption = 'Add Primary Colors';
                ApplicationArea = All;
                Image = Add;
                ToolTip = 'Adds the three primary colors to the list.';

                trigger OnAction()
                begin
                    InsertPrimaryColors();
                end;
            }
        }
    }

    local procedure InsertPrimaryColors()
    var
        FavoriteColor: Record "Favorite Color";
    begin
        InsertColor('Red', '#FF0000', true, 50);
        InsertColor('Green', '#00FF00', true, 50);
        InsertColor('Blue', '#0000FF', true, 50);
        Message('Primary colors added successfully!');
    end;

    local procedure InsertColor(ColorName: Text[50]; HexCode: Code[7]; IsPrimary: Boolean; Brightness: Decimal)
    var
        FavoriteColor: Record "Favorite Color";
    begin
        FavoriteColor.Init();
        FavoriteColor."Color Name" := ColorName;
        FavoriteColor."Hex Code" := HexCode;
        FavoriteColor."Is Primary" := IsPrimary;
        FavoriteColor.Brightness := Brightness;
        FavoriteColor.Insert(true);
    end;
}
