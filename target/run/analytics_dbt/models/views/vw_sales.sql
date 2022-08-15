

  create view "dev"."public"."vw_sales__dbt_tmp" as (
    with source_sales as (
	select *
	from sales
	
),

RENAMED AS (
	SELECT
	SALESID AS ID_VENDAS,
		LISTID AS ID_LISTA,
		SELLERID AS ID_VENDEDOR,
		BUYERID AS ID_COMPRADOR,
		EVENTID AS ID_EVENTO,
		DATEID AS ID_DATE,
		QTYSOLD AS QUANTIDADE_VENDIDA,
		PRICEPAID AS VALOR_PAGO,
		COMMISSION AS COMISSÃO,
		SALETIME AS DATA_VENDA
		
	FROM SOURCE_SALES
	
)

SELECT * FROM RENAMED
  ) ;
