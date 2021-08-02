Select *
from seasons_and_quarters as sq
left join aapl_stock on
aapl_stock.date = sq.date 
order by sq.date;



