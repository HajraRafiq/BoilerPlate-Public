CREATE OR REPLACE PROCEDURE update_receiver_wallet_byid(
    receiver int,
    amount real
) 
LANGUAGE plpgsql
AS
$$
DECLARE current_closing REAL = 0;
DECLARE closing_diff REAL = 0;
BEGIN


    SELECT closing_balance 
    INTO current_closing
    FROM receiver_accounts WHERE id=receiver;

    SELECT (current_closing - amount) INTO closing_diff;

    IF (closing_diff > 0) THEN 
        UPDATE receiver_accounts SET closing_balance=(closing_balance + closing_diff),opening_balance=closing_balance WHERE id=receiver;
    END IF;
END;
$$