table 50001 "Favorite Color"
{
    Caption = 'Favorite Color';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; "Color Name"; Text[50])
        {
            Caption = 'Color Name';
        }
        field(3; "Hex Code"; Code[7])
        {
            Caption = 'Hex Code';
        }
        field(4; "Is Primary"; Boolean)
        {
            Caption = 'Is Primary';
        }
        field(5; "Brightness"; Decimal)
        {
            Caption = 'Brightness';
            MinValue = 0;
            MaxValue = 100;
        }
        field(6; "Description"; Text[100])
        {
            Caption = 'Description';
        }
        field(7; "Created Date"; Date)
        {
            Caption = 'Created Date';
            Editable = false;
        }
        field(8; "Popular"; Boolean)
        {
            Caption = 'Popular';
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(ColorName; "Color Name")
        {
        }
    }

    trigger OnInsert()
    begin
        ValidateHexCode();
        "Created Date" := Today;
    end;

    trigger OnModify()
    begin
        ValidateHexCode();
    end;

    local procedure ValidateHexCode()
    begin
        if "Hex Code" <> '' then
            if StrLen("Hex Code") <> 7 then
                Error('Hex code must be 7 characters (e.g., #FF0000)');
    end;

    procedure IsDarkColor(): Boolean
    begin
        exit(Brightness < 50);
    end;

    procedure GetColorInfo(): Text
    begin
        exit(StrSubstNo('%1 (%2)', "Color Name", "Hex Code"));
    end;
}
