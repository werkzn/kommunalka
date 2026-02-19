CREATE OR REPLACE FUNCTION f_add_payment(
    p_month INTEGER, 
    p_year INTEGER, 
    p_utilities NUMERIC
)
RETURNS VOID AS
$$
DECLARE
    v_fixed NUMERIC := 30000;
    v_total NUMERIC;
    v_date DATE;
BEGIN
    -- Вызываем проверку (включая проверку на дубликат)
    PERFORM f_validate_payment(p_month, p_year, p_utilities);
    
    v_total := v_fixed + p_utilities;
    v_date := (p_year || '-' || LPAD(p_month::TEXT, 2, '0') || '-15')::DATE;
    
    -- Вставляем с новыми колонками
    INSERT INTO t_payments (
        payment_date, 
        fixed_rent, 
        utilities, 
        total,
        payment_year,
        payment_month
    )
    VALUES (
        v_date, 
        v_fixed, 
        p_utilities, 
        v_total,
        p_year,
        p_month
    );
    
    RAISE NOTICE 'Платеж за % успешно добавлен', TO_CHAR(v_date, 'DD.MM.YYYY');
END;
$$
LANGUAGE plpgsql;