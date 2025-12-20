pageextension 60000 "Customer Card Dog Club" extends "Customer Card"
{
    layout
    {
        addlast(factboxes)
        {
            part(DogClubFactBox; "Customer Dog Club FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
            }
        }
    }
}
