REPORT Z_EXAMEN.
*TYPES Declaration
TYPES: BEGIN OF ty_stud,
	stud_id TYPE Z00T_STUDNETI-stud_id,
	nume TYPE Z00T_STUDENTI-nume,
	prenume TYPE Z00T_STUDENTI-prenume,
	facultate TYPE Z00T_CATALOG-facultate,
	nr_credite TYPE Z00T_CATALOG-nr_credite,
	curs_id TYPE Z00T_CATALOG-curs_id,
	END OF ty_stud.
TYPES: BEGIN OF ty_total_credite,
	nume TYPE Z00T_STUDENTI-nume,
	prenume TYPE Z00T_STUDENTI-prenume,
	facultate TYPE Z00T_CATALOG-facultate,
	total_credite TYPE Z00T_CATALOG-nr-credite,
	END OF ty_total_credite.

*DATA Declaration
DATA: gt_stud TYPE TABLE OF ty_stud,
      gs_stud TYPE ty_stud,
      gv_id_stud.

SELECT stud_id nume prenume cnp facultate nr_credite curs_id
INTO CORRESPONDING FIELDS OF TABLE gt_stud
FROM Z00T_STUDENTI
JOIN Z005_CATALOG
ON Z00T_STUNDENTI~stud_id = Z00T_CATALOG~stud_id.

IF sy-subrc = 0.
SORT gt_stud BY stud_id.
READ TABLE gt_stud INTO gs_stud INDEX 1.
IF sy-subrc = 0.
gv_stud_id = gs_stud-id_stud.
ENDIF.
LOOP AT gt_stud INTO gs_stud.
	IF gv_stud_id = gs_stud-stud_id.
		MOVE CORRESPONDING gs_stud INTO gs_total_credite.
		gs_total_credite-total_credite=gs_total_credite-total_credite+gs_stud-nr_credite.
	ELSE.
		gv_stud_id=gs_stud_id.
		APPEND gs_total_credite TO gs_total_credite.
	ENDIF.
ENDLOOP.
ENDIF.