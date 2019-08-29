*&---------------------------------------------------------------------*
*& Report  Z05KN_CURS3
*&
*&---------------------------------------------------------------------*
*& Sa se calculeze suma numerelor pare si produsul numerelor impare
*& avand un N dat pe ecran
*&---------------------------------------------------------------------*
 REPORT z05kn_curs3.

* Declaratie date
 DATA gv_produs TYPE i VALUE 1.
 DATA gv_sum TYPE i.
 DATA gv_rest TYPE i.

* Inserarea numarului pe ecranul de selectie
 PARAMETERS p_num TYPE i.

*  gv_produs = 1
 DO p_num TIMES.
   gv_rest = sy-index MOD 2.
   IF gv_rest = 0.
     gv_sum = sy-index + gv_sum.
   ELSE.
     gv_produs = sy-index * gv_produs.
   ENDIF.
 ENDDO.

* Afisare rezultate
 WRITE: / 'Suma este: ', gv_sum.
 WRITE: / 'Produsul este: ', gv_produs.