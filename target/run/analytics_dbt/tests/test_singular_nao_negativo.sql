select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      -- testa se existe valores menores que 0 (negativos)

select *
    FROM tb_10_compradores
    WHERE vendas_totais < 0
      
    ) dbt_internal_test