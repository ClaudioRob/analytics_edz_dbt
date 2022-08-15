with sales as (
    SELECT * FROM {{ ref('vw_sales') }}
),
compradores as (
    select 
        (firstname ||' '|| lastname) as Nome_Completo, userid
    from users
    ),
    top_10_compradores as (
        SELECT
            compradores.Nome_Completo as Nome_Completo,
            sum(sales.quantidade_vendida) as Vendas_Totais,
            sales.comissao as Comissao
        FROM
            sales INNER JOIN compradores
            on sales.id_comprador = compradores.userid
            GROUP BY compradores.userid, compradores.Nome_Completo, sales.comissao
            ORDER BY vendas_totais DESC
            LIMIT 10
    )

    select * from top_10_compradores