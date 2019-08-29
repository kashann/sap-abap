REPORT Z_EXAMEN.
*TYPES Declaration
TYPES: BEGIN OF ty_stud,
	nume TYPE Z00T_STUDENTI-nume,
	prenume TYPE Z00T_STUDENTI-prenume,
	nota TYPE Z00T_CATALOG-nota,
	END OF ty_stud.

*DATA Declaration
DATA: gt_stud TYPE TABLE OF ty_stud,
      gs_stud TYPE ty_stud.

PARAMETERS p_cursid TYPE Z00T_CATALOG-CURS_ID.

START-OF-SELECTION.

SELECT nume prenume nota
INTO CORRESPONDING FIELDS OF TABLE gt_stud
FROM Z00T_STUDENTI
	JOIN Z00T_CATALOG IN Z00T_STUDENTI~STUD_ID = Z00T_CATALOG~STUD_ID
WHERE Z00T_CATALOG~nota >= 5 AND Z00T_CATALOG~curs_id = p_cursid.

IF sy-subrc = 0.
SORT gt_stud BY nota DESCENDING.
LOOP AT gt_stud INTO gs_stud.
	WRITE: /gs_stud-nume, gs_stud-prenume, gs_stud-nota.
ENDLOOP.
ENDIF.