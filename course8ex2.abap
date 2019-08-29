REPORT Z_EXAMEN.
*TYPES Declaration

*DATA Declaration
DATA: gt_stud TYPE TABLE OF Z00T_STUDENTI,
      gs_stud TYPE Z00T_STUDENTI.

PARAMETERS p_fac TYPE Z00T_STUDENTI-FACULTATE.

START-OF-SELECTION.

SELECT nume prenume cnp facultate
FROM Z00T_STUDENTI
INTO CORRESPONDING FIELDS OF TABLE gt_stud
WHERE facultate = p_fac.

IF sy-subrc = 0.
LOOP AT gt_stud INTO gs_stud.
	WRITE: /gs_stud-nume, gs_stud-prenume, gs_stud-cnp, gs_stud-facultate.
ENDLOOP.
ENDIF.