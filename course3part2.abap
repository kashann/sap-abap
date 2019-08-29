*&---------------------------------------------------------------------*
*& Report  Z05CS_CAUTARE_BINARE
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT  z05cs_cautare_binare.

DATA: gv_search_me  TYPE i,
      gv_min               TYPE i VALUE 0,
     gv_max              TYPE i VALUE 1000,
 gv_tries              TYPE i,
     gv_number       TYPE i.

gv_search_me = 23.
WHILE gv_number <> gv_search_me.
  ADD 1 TO gv_tries.
  gv_number = ( gv_min + gv_max ) / 2.
  IF gv_number > gv_search_me.
    gv_max = gv_number - 1.
  ELSE.
    gv_min = gv_number + 1.
  ENDIF.
ENDWHILE.
WRITE: / 'Maximul este ', gv_max.
WRITE: / 'Minimul este ', gv_min.