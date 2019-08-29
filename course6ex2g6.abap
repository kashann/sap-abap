TABLES: z00t_products.

SELECT-OPTIONS: s_idprod FOR z00t_products-id_prod.
PARAMETERS: p_price TYPE z00t_products-price.

DATA: gt_products TYPE STANDARD TABLE OF z00t_products,
      gs_products TYPE z00t_products.

START-OF-SELECTION.

  SELECT *
    FROM z00t_products
    INTO CORRESPONDING FIELDS OF TABLE gt_products
    WHERE id_prod IN s_idprod
      AND price    = p_price.

  LOOP AT gt_products INTO gs_products.

*     ID_PROD
*     NAME_PROD
*     QTY
    WRITE: / gs_products-id_prod , gs_products-name_prod, gs_products-qty,
             gs_products-price.

  ENDLOOP.
*BREAK-POINT.