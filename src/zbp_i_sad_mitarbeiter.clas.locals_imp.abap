CLASS lhc_zi_sad_mitarbeiter DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR Mitarbeiter
        RESULT result,
      detSteuertarif FOR DETERMINE ON SAVE
        IMPORTING keys FOR Mitarbeiter~detSteuertarif,
      actKidActive FOR MODIFY
        IMPORTING keys FOR ACTION Mitarbeiter~actKidActive RESULT result,
      detGehalt FOR DETERMINE ON SAVE
        IMPORTING keys FOR Mitarbeiter~detGehalt.
ENDCLASS.

CLASS lhc_zi_sad_mitarbeiter IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.
  METHOD detSteuertarif.

    READ ENTITIES OF zi_sad_mitarbeiter IN LOCAL MODE
    ENTITY Mitarbeiter
    FIELDS ( Rolle Kinder ) WITH CORRESPONDING #( keys )
    RESULT DATA(mitarbeitern).

    LOOP AT mitarbeitern INTO DATA(marbeiter).

      IF marbeiter-Rolle = 'MM Consultant'.

        MODIFY ENTITIES OF zi_sad_mitarbeiter IN LOCAL MODE
        ENTITY Mitarbeiter
        UPDATE
        FIELDS ( Steuertarif )
        WITH VALUE #(
        ( %tky = marbeiter-%tky Steuertarif = '5.45' )
        ).
      ENDIF.

      IF marbeiter-Rolle = 'Project Manager'.

        MODIFY ENTITIES OF zi_sad_mitarbeiter IN LOCAL MODE
        ENTITY Mitarbeiter
        UPDATE
        FIELDS ( Steuertarif )
        WITH VALUE #(
        ( %tky = marbeiter-%tky Steuertarif = '8.45' )
        ).
      ENDIF.

    ENDLOOP.
  ENDMETHOD.
  METHOD actKidActive.

    MODIFY ENTITIES OF zi_sad_mitarbeiter IN LOCAL MODE
    ENTITY Mitarbeiter
    UPDATE
    FIELDS ( Kinder )
    WITH VALUE #( FOR key IN keys
    ( %tky = key-%tky Kinder = abap_true )
     )
    .

    READ ENTITIES OF zi_sad_mitarbeiter IN LOCAL MODE
        ENTITY Mitarbeiter
        ALL FIELDS WITH CORRESPONDING #( keys )
        RESULT DATA(mitarbeitern).

    result = VALUE #( FOR marbeiter IN mitarbeitern ( %tky = marbeiter-%tky %param = marbeiter ) ).

    "
  ENDMETHOD.
  METHOD detGehalt.


    READ ENTITIES OF zi_sad_mitarbeiter IN LOCAL MODE
    ENTITY Mitarbeiter
    FIELDS ( Gehalt Kinder ) WITH CORRESPONDING #( keys )
    RESULT DATA(mitarbeitern).

    LOOP AT mitarbeitern INTO DATA(marbeiter).

      IF marbeiter-Kinder = abap_true.

        MODIFY ENTITIES OF zi_sad_mitarbeiter IN LOCAL MODE
        ENTITY Mitarbeiter
        UPDATE
        FIELDS ( Gehalt )
        WITH VALUE #(
        ( %tky = marbeiter-%tky Gehalt = marbeiter-Gehalt + 2005 )
         )
        .
      ELSE.

        MODIFY ENTITIES OF zi_sad_mitarbeiter IN LOCAL MODE
        ENTITY Mitarbeiter
        UPDATE
        FIELDS ( Gehalt )
        WITH VALUE #(
        ( %tky = marbeiter-%tky Gehalt = marbeiter-Gehalt - 2005 )
         )
        .

      ENDIF.

    ENDLOOP.

    "

  ENDMETHOD.

ENDCLASS.
