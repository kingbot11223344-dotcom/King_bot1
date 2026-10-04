//+------------------------------------------------------------------+
//| King Bot - Demo Safety Version                                   |
//+------------------------------------------------------------------+
#property strict

#include <Trade/Trade.mqh>

CTrade trade;

input double LotSize = 0.01;
input int StopLossPoints = 300;
input int TakeProfitPoints = 600;
input int MagicNumber = 20261004;

int OnInit()
{
   trade.SetExpertMagicNumber(MagicNumber);
   return(INIT_SUCCEEDED);
}

void OnTick()
{
   // Safety: do not open another position if one already exists
   if(PositionSelect(_Symbol))
      return;

   // Demo testing only: simple signal
   double ask = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
   double bid = SymbolInfoDouble(_Symbol, SYMBOL_BID);

   if(ask <= 0 || bid <= 0)
      return;

   // Placeholder entry logic.
   // We will replace this with the actual strategy after testing.
   double sl = ask - StopLossPoints * _Point;
   double tp = ask + TakeProfitPoints * _Point;

   trade.Buy(LotSize, _Symbol, ask, sl, tp, "King Bot");
}
