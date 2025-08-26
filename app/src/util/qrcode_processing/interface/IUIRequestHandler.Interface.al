namespace STIL.PersonalFinanceManager.Util.Abstractions;

interface "STI IUIRequestHandler"
{
    Access = Internal;

    procedure HandleRequest(Args: JsonObject; var Result: JsonObject);
    procedure Initiliaze();
}