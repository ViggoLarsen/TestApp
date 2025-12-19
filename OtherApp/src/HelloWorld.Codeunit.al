codeunit 60000 "Hello World"
{
    procedure SayHello(): Text
    begin
        exit('Hello from OtherApp!');
    end;
}
