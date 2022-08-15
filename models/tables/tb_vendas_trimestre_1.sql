-- define as variáveis: meses e ano

{% set meses = ("JAN","FEB","MAR") %}
{% set ano = 2008 %}

-- cria a fonte com os dados de Date e converte nome das colunas
with source_date as (
    SELECT dateid as id_date,
        month as mes,
        year as ano
    FROM date
),

-- cria uma fonte de dados unindo a tebela sales com date
sales_date as (
    SELECT source_date.mes,
           sum(quantidade_vendida)
    FROM {{ ref('vw_sales')}} sales INNER JOIN source_date
    on sales.id_date = source_date.id_date
    where source_date.mes in {{meses}}
    and source_date.ano = '{{ano}}'
    group by source_date.mes
)
select * from sales_date