*&---------------------------------------------------------------------*
*& Report  Z05LC_CURS5
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT  z05lc_curs5.

* TYPES declaration
TYPES: BEGIN OF ty_prod,
        id_prod   TYPE n LENGTH 10,
        name_prod TYPE c LENGTH 40,
        qty       TYPE p DECIMALS 3,
        um        TYPE c LENGTH 5,
       END OF ty_prod.

* DATA declaration
DATA: gs_prod TYPE ty_prod,
      gt_prod TYPE TABLE OF ty_prod.

* Selection-screen
PARAMETERS: p_id TYPE n LENGTH 10,
            p_name TYPE c LENGTH 40,
            p_qty TYPE p DECIMALS 3,
            p_um TYPE c LENGTH 5.

* Process data

*1. Add 3 records in ITAB Prod
gs_prod-id_prod = 1.
gs_prod-name_prod = 'Mere'.
gs_prod-qty = 0.
gs_prod-um = 'Buc'.
APPEND gs_prod TO gt_prod.

CLEAR gs_prod.
gs_prod-id_prod = 2.
gs_prod-name_prod = 'Pere'.
gs_prod-qty = 3.
gs_prod-um = 'Buc'.
*APPEND gs_prod TO gt_prod.
INSERT gs_prod INTO gt_prod INDEX 1.

CLEAR gs_prod.
gs_prod-id_prod = 3.
gs_prod-name_prod = 'Prune'.
gs_prod-qty = 5.
gs_prod-um = 'Buc'.
APPEND gs_prod TO gt_prod.

*2. Remove records with no quantity
DELETE gt_prod WHERE qty = 0.
IF sy-subrc <> 0.
  WRITE: / 'No record with zero quantity'.
ENDIF.

*3. Add record from SS
CLEAR gs_prod.
READ TABLE gt_prod INTO gs_prod WITH KEY id_prod = p_id.
IF sy-subrc <> 0.
  CLEAR gs_prod.
  gs_prod-id_prod = p_id.
  gs_prod-name_prod = p_name.
  gs_prod-qty = p_qty.
  gs_prod-um = p_um.
  APPEND gs_prod TO gt_prod.
ENDIF.
*afisez info din tabel CA TEMA!!!
*in cazul in care se introduce in tabel ceva cu id la fel, overwrite
BREAK-POINT.