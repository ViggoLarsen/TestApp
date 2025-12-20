page 60000 "Customer Dog Club FactBox"
{
    PageType = CardPart;
    SourceTable = Customer;
    Caption = 'Dog Club Info';

    layout
    {
        area(Content)
        {
            field("Dog Club Name"; Rec."Dog Club Name")
            {
                ApplicationArea = All;
            }
            field("Dog Club Membership No."; Rec."Dog Club Membership No.")
            {
                ApplicationArea = All;
            }
            field("Dog Club Member Since"; Rec."Dog Club Member Since")
            {
                ApplicationArea = All;
            }
        }
    }
}
