*&---------------------------------------------------------------------*
*& Report  Z05KN_JOIN_EX1
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT  z05kn_join_ex1.

TABLES: z00t_products, z00t_sales.

SELECT-OPTIONS: s_idprod FOR z00t_products-id_prod,
                s_sdate FOR z00t_sales-sale_date.

DATA: gt_products TYPE STANDARD TABLE OF z00t_products,
      gs_products TYPE z00t_products.

DATA: gt_sales TYPE STANDARD TABLE OF z00t_sales,
      gs_sales TYPE z00t_sales.

START-OF-SELECTION.

  SELECT *
    FROM z00t_sales
    INTO CORRESPONDING FIELDS OF TABLE gt_sales
    WHERE id_prod IN s_idprod
      AND sale_date IN s_sdate.

  IF sy-subrc = 0.

    SELECT *
      FROM z00t_products
      INTO CORRESPONDING FIELDS OF TABLE gt_products
      FOR ALL ENTRIES IN gt_sales
      WHERE id_prod = gt_sales-id_prod.

    IF sy-subrc = 0.

      LOOP AT gt_sales INTO gs_sales.

        READ TABLE gt_products INTO gs_products
        WITH KEY id_prod = gs_sales-id_prod.

        IF sy-subrc = 0.

          WRITE: / gs_sales-id_sales , gs_sales-sale_date, gs_products-name_prod, gs_sales-total, gs_sales-currency.

        ENDIF.
      ENDLOOP.
    ENDIF.
  ENDIF.
*BREAK-POINT.