-- TOTAL CREDIT AMOUNT
select sum(Amount) as TotalCredit
from final
where `Transaction Type` = 'Credit';

-- TOTAL DEBIT AMOUNT
select sum(Amount) as TotalDebit
from final
where `Transaction Type` = 'Debit';

-- CREDIT TO DEBIT RATIO
select
  sum(case when `Transaction Type` = 'Credit' then Amount else 0 end) /
  sum(case when `Transaction Type` = 'Debit' then Amount else 0 end) as CreditToDebitRatio
from final;

-- NET TRANSACTION AMOUNT
select
  sum(case when `Transaction Type` = 'Credit' then Amount else 0 end) -
  sum(case when `Transaction Type` = 'Debit' then Amount else 0 end) as NetTransactionAmount
from final;

-- ACCOUNT ACTIVITY RATIO
select 
  `Customer ID`,count(*) / avg(Balance) as AccountActivityRatio
from final
group by `Customer ID`;


-- TRANSACTION PER MONTH
select
  year(`Transaction Date`) AS Year,
  month(`Transaction Date`) AS Month,
  COUNT(*) AS TransactionsPerMonth
from final
group by Year, Month
order by Year, Month;

-- TRANSACTION BY BRANCH
select
  Branch,sum(Amount) as TotalTransactionAmount
from final
group by Branch;

-- TOP 10 CUSTOMERS BY BALANCE
select 
  `Customer Name`,
  sum(Balance) as TotalBalance
from final
group by `Customer Name`
order by TotalBalance desc
limit 10;








