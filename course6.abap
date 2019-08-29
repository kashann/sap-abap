REPORT  z05cs_curs6.

TABLES: z00t_products.
DATA gt_prod TYPE TABLE OF z00t_products.
DATA gs_prod TYPE z00t_products.

SELECT-OPTIONS s_idprod FOR z00t_products-id_prod.
PARAMETERS p_price TYPE z00t_products-price.

SELECT *
  FROM z00t_products
  INTO TABLE gt_prod.

IF sy-subrc = 0.
  LOOP AT gt_prod INTO gs_prod.
    WRITE: / gs_prod-id_prod, gs_prod-name_prod.
  ENDLOOP.
ENDIF.

REFRESH gt_prod.
SELECT *
  FROM z00t_products
  INTO TABLE gt_prod
  WHERE id_prod IN s_idprod AND
        price = p_price.

IF sy-subrc = 0.
  LOOP AT gt_prod INTO gs_prod.
    WRITE: / gs_prod-id_prod, gs_prod-name_prod, gs_prod-price.
  ENDLOOP.
ENDIF.