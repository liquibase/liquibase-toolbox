--liquibase formatted sql

--changeset root:table-dpayment_calc
create table dpayments_calculation_data
(
  event_id int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  payment_id int,
  recovered boolean,
  delinquent_amount int,
  difference int
);

--changeset root:plgsql-test splitStatements:false runOnChange:true
create or replace function get_dpayment_calc()
returns void
as
$$
DECLARE
    dpayment_calc dpayments_calculation_data;
    accountState varchar;
    paymentState varchar;
    trow dpayments_calculation_data;
    is_current boolean;
    _c text;
BEGIN
    accountState = 'RECOVERED';
    paymentState = 'OPEN';
    FOR trow IN
        WITH payments as (
        select DP.delinquency_event_id event_id,DR.delinquent_payment_id payment_id,
        sum(case when DR.transaction_reverted then (recovered_amount*0) else recovered_amount end ) recovered,DP.delinquent_amount,
                       DP.delinquent_amount - sum(case when DR.transaction_reverted then 0 else recovered_amount end ) difference
                       ,DR.transaction_reverted
                from snapcollections.delinquent_recovery DR
                    inner join snapcollections.delinquent_payment DP on DR.delinquent_payment_id = DP.id
                    inner join snapcollections.delinquency_event DE on DP.delinquency_event_id = DE.id
                where DE.customer_account_id = accountId_p
                group by DR.delinquent_payment_id,DP.delinquent_amount,DP.delinquency_event_id,DR.transaction_reverted,DP.delinquent_payment_ts
        order by DP.delinquent_payment_ts ASC)
        Select p.event_id,p.payment_id,sum(recovered) recovered,p.delinquent_amount,p.delinquent_amount - sum(recovered) difference
            from payments p group by event_id,payment_id,delinquent_amount
    LOOP
        dpayment_calc.event_id := trow.event_id;
        dpayment_calc.payment_id := trow.payment_id;
        dpayment_calc.recovered := trow.recovered;
        dpayment_calc.delinquent_amount := trow.delinquent_amount;
        dpayment_calc.difference := trow.difference;
        if trow.difference != 0 then
            accountState = 'OPEN';
            if trow.difference > 0 then
                if trow.difference =trow.delinquent_amount then
                    paymentState = 'OPEN';
                else
                    paymentState = 'PARTIALLY_RECOVERED';
                end if;
            end if;
        elseif trow.difference = 0 then
            paymentState = 'CLOSED';
        end if;
        update snapcollections.delinquent_payment
        set status = paymentState
        where id = trow.payment_id;
        RAISE NOTICE 'delinquent payment update / status % , id % , diff % ', paymentState, trow.payment_id, trow.difference;
    END LOOP;
    SELECT NOT(get_past_due_amount(accountId_p, CURRENT_DATE) > 0) into is_current;
    RAISE NOTICE 'is_current =  %', is_current;
     if is_current then
        update snapcollections.delinquency_event
        set status = 'RECOVERED',recovered_ts = now()
        where customer_account_id = accountId_p;
        RAISE NOTICE 'delinquent event update = RECOVERED , id %', accountId_p;
     else
         update snapcollections.delinquency_event
            set status = 'OPEN',recovered_ts =NULL, recovered_transaction_id = NULL
            where customer_account_id = accountId_p;
         RAISE NOTICE 'delinquent event update = OPEN , id %', accountId_p;
     end if;
EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Error executing delinquency payment calculation store procedure';
        RAISE NOTICE 'ERROR % %', SQLERRM, SQLSTATE;
        GET STACKED DIAGNOSTICS _c = PG_EXCEPTION_CONTEXT;
        RAISE NOTICE 'context: >>%<<', _c;
END
;
$$
LANGUAGE plpgsql;

-- rollback drop function get_dpayment_calc()
