CREATE OR REPLACE PROCEDURE fetch_history_by_receiverid(
    receiver int,
    status varchar(14),
    INOUT _result_one refcursor = 'rcvhistory'
) 
LANGUAGE plpgsql
AS
$$
BEGIN
    OPEN _result_one FOR
        SELECT PR.id,
        PR.receiver_number,
        PR.receiver_name,
        PR.deposit_number,
        PR.sender_number,
        PR.sender_email,
        PR.tracking_code,
        PR.request_completed,
        PR.request_verified,
        PR.extra_params,
        PR.request_amount,
        PR.receiver_id,
        PR.sender_id,
        PR.tx_status_id,
        PR.tx_status_text,
        PR.view_count,
        PR.bykea_cash_ride,
        PR.bykea_tracking_code,
        PR.checkoutjs_tid,
        PLK.new_link,
        PR.dt,
        PR.dtu,
        CAST('receiver' AS VARCHAR(8)) AS source 
        FROM payment_requests AS PR
        LEFT JOIN payment_links AS PLK ON PLK.payment_request_id = PR.id
        WHERE PR.receiver_id=receiver AND PR.tx_status_id=(SELECT id FROM transaction_states WHERE system_tag=status)
        UNION ALL
        SELECT id,
        receiver_number,
        receiver_name,
        CAST(NULL AS VARCHAR(320)) AS deposit_number,
        sender_number,
        CAST(NULL AS VARCHAR(320)) AS sender_email,
        tracking_code,
        request_completed,
        request_verified,
        extra_params,
        request_amount,
        receiver_id,
        sender_id,
        tx_status_id,
        tx_status_text,
        CAST(NULL AS INT) AS view_count,
        bykea_cash_ride,
        bykea_tracking_code,
        checkoutjs_tid,
        CAST(NULL AS VARCHAR(512)) new_link,
        dt,
        dtu,
        CAST('sender' AS VARCHAR(8)) AS source
        FROM sender_requests AS SDR
        WHERE receiver_id=receiver AND tx_status_id=(SELECT id FROM transaction_states WHERE system_tag=status);
END;
$$