*&---------------------------------------------------------------------*
*& Report  Z05KN_CURS4
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT  z05kn_curs4.

* TYPE declaration

* Type that can be used for local variables
TYPES ty_id_prod TYPE n LENGTH 10. "-> DATA ELEMENT (SE11)

* Type that can be used for local structures and local tables (ITAB)
TYPES: BEGIN OF ty_produs, "-> STRUCTURE (SE11)
            id_prod     TYPE ty_id_prod,
            name_prod   TYPE c LENGTH 40,
            qty         TYPE p DECIMALS 3,
            um          TYPE c LENGTH 5,
       END OF ty_produs.

* Type that can be used only for local tables (ITAB)
TYPES: ty_produs_t TYPE TABLE OF ty_produs. "-> TABLE TYPE (SE11)

* Data declaration
* Variable declaration
DATA gv_id_prod TYPE ty_id_prod.
*DATA gv_id_prod TYPE n LENGTH 10.  "->equivalent to above

* Structure declaration
*DATA gs_produs TYPE tr_produs.
DATA: BEGIN OF gs_produs,
            id_prod     TYPE ty_id_prod,
            name_prod   TYPE c LENGTH 40,
            qty         TYPE p DECIMALS 3,
            um          TYPE c LENGTH 5,
      END OF gs_produs.

* ITAB declaration
*DATA: gt_produs TYPE TABLE OF ty_produs.
*DATA: gt_produs TYPE TABLE OF db_table.
DATA: gt_produs TYPE ty_produs_t.